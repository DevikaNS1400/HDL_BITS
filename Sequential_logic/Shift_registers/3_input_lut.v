module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 
    reg [0:7] mem;
    wire [2:0]addr;
    always@(posedge clk)begin
        if(enable)
            mem<={S,mem[0:6]};
    end
  assign  addr={A,B,C};
    assign Z=mem[addr];
endmodule
