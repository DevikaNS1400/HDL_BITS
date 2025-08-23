module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);

    wire r1,r2,r3;
    assign r1=(q[3:0]==4'b1001);
    assign r2=(q[7:4]==4'b1001);
    assign r3=(q[11:8]==4'b1001);
    
    assign ena[1]=r1;
    assign ena[2]=r1&r2;
    assign ena[3]=r1&r2&r3;
    
    always@(posedge clk)begin
        if(reset) q[3:0]<=4'b0;
        else if(r1) q[3:0]<=4'b0;
        else q[3:0]<=q[3:0]+4'b0001;
    end
    
     always@(posedge clk)begin
         if(reset) q[7:4]<=4'b0;
         else if(ena[1])begin
             if(r2) q[7:4]<=4'b0;
        else q[7:4]<=q[7:4]+4'b0001;
         end
    end
    
     always@(posedge clk)begin
         if(reset) q[11:8]<=4'b0;
         else if(ena[2])begin
             if(r3) q[11:8]<=4'b0;
        else q[11:8]<=q[11:8]+4'b0001;
         end
    end
    
     always@(posedge clk)begin
         if(reset) q[15:12]<=4'b0;
         else if(ena[3])begin
            if (q[15:12]==4'b1001) q[15:12]<=4'b0;
        else q[15:12]<=q[15:12]+4'b0001;
         end
    end
     
endmodule
