module top_module (
    input clock,
    input a,
    output p,
    output q );
reg p1,q1;

always@(*)begin
  if(clock==1)
   p1<=a;
end
always@(negedge clock)begin
    q1<=a;
end  
assign p=p1;
assign q=q1;
endmodule
