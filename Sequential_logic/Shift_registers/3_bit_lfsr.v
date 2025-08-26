module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q
    reg [2:0]Q;
    wire w1,clk,k;
    assign w1=Q[2]^Q[1];
    assign clk=KEY[0];
    assign k=KEY[1];
    always@(posedge clk)begin
        Q[0]<=k?SW[0]:Q[2];
        Q[1]<=k?SW[1]:Q[0];
        Q[2]<=k?SW[2]:w1;
    end
    assign LEDR=Q;
endmodule
