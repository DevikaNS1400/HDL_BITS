module top_module(
    input clk,
    input areset,
    input train_valid,
    input train_taken,
    output [1:0] state
);
    reg [1:0]st;
    parameter [1:0] SNT=2'b00,WNT=2'b01,WT=2'b10,ST=2'b11;
    
    reg[1:0]nx_state;
    
    always@(posedge clk or posedge areset)begin
        if(areset)
            st<=WNT;
        else
            st<=train_valid?nx_state:st;
    end
    always@(*)begin
        case(st)
            2'b00:nx_state=train_taken?WNT:SNT;
            2'b01:nx_state=train_taken?WT:SNT;
            2'b10:nx_state=train_taken?ST:WNT;
            2'b11:nx_state=train_taken?ST:WT;
            default:nx_state=WNT;
        endcase
    end
assign state=st;
endmodule
