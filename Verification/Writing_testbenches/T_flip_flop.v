module top_module ();
wire q;
reg clk;
reg reset;
reg t;
tff u1(.q(q),.clk(clk),.reset(reset),.t(t));
 always #5 clk=~clk;
 initial begin
 clk=0;reset=1;t=1'b1;#10;
 reset=0;t=1'b0;#10;
 t=1'b1;#10;
 end   
endmodule
