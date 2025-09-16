module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 
    parameter [1:0] A=2'b00,B=2'b01,C=2'b10,D=2'b11;
    reg [1:0]state,nx_state;
    
    always@(posedge clk)begin
        if(!resetn)
            state<=A;
        else 
            state<=nx_state;
    end
    
    always@(*)begin
        case(state)
         2'b00:begin
             if(r[1])
                 nx_state=B;
             else if(!r[1]&r[2])
                 nx_state=C;
             else if(!r[1]&!r[2]&r[3])
                 nx_state=D;
             else
                 nx_state=A;
         end
        
          2'b01:begin
              if(r[1])
                  nx_state=B;
              else 
                  nx_state=A;
          end
            
         2'b10:begin
             if(r[2])
                 nx_state=C;
             else
                 nx_state=A;
         end
            
         2'b11:begin
             if(r[3])
                 nx_state=D;
             else
                 nx_state=A;
         end
         default:nx_state=A;
        endcase
    end
    
    assign g[1]=(state==B);
    assign g[2]=(state==C);
    assign g[3]=(state==D);
endmodule
