module top_module (
    input clk,
    input j,
    input k,
    output Q); 
reg Q1;
wire w1,w2,w3,w4,Qb;
    not g1(w2,k);
    and g2(w1,Qb,j);
    and g3(w3,Q1,w2);
    or g4(w4,w3,w1);
//assign Qb=!Q;
    always @(posedge clk)begin
        Q1<=w4;
    end
assign Q=Q1;
assign Qb=!Q1;
endmodule
