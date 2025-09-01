module top_module( 
    input [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different );
 genvar i;
    generate for(i=0;i<3;i=i+1)begin:b1
        assign out_both[i]=in[i]&in[i+1];
    end
    endgenerate  
    
    generate for(i=3;i>0;i=i-1)begin:b2
        assign out_any[i]=in[i] | in[i-1];
    end
           // assign out_any[0]=1'b0;
        endgenerate
          
    generate for(i=0;i<3;i=i+1)begin:b3
        assign out_different[i]=in[i]^in[i+1];
    end
        assign out_different[3]=in[3]^in[0];
           endgenerate
endmodule
