module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
wire k0,k1,k2,k3;
reg [3:0]red;
    assign k0=KEY[0];
    assign k1=KEY[1];
    assign k2=KEY[2];
    assign k3=KEY[3];
    
    MUXDFF u1(red[3],k1,SW[3],k2,k3,k0); 
    MUXDFF u2(red[2],k1,SW[2],k2,red[3],k0);
    MUXDFF u3(red[1],k1,SW[1],k2,red[2],k0);
    MUXDFF u4(red[0],k1,SW[0],k2,red[1],k0);
 assign LEDR=red;
endmodule

module MUXDFF (
output reg Q,
input E,
input R,
input L,
input w,
input clk);
wire q;
    assign q=L?R:(E?w:Q);
    always@(posedge clk)
        Q<=q;
endmodule
