module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
    
   // reg [7:0]hr,min,sec;
    reg [2:0] en_hms;
   // reg pm1;
    assign en_hms={(ena&&(mm==8'h59)&&(ss==8'h59)),(ena&&(ss==8'h59)),ena};
 
    count_ms ss_cnt(.t(mm),.clk(clk),.reset(reset),.ena(en_hms[1]));
    count_ms mm_cnt(.t(ss),.clk(clk),.reset(reset),.ena(en_hms[0]));
    
    
    always@(posedge clk)begin
        if(reset)begin
        hh<=8'h12;
        pm<=0;
        end
        else begin
            if(en_hms[2]&&mm==8'h59&&ss==8'h59)begin
                if(hh==8'h12)
                    hh<=8'h1;
                else if(hh==8'h11)begin
                    hh<=hh+8'h1;
                    pm<=~pm;
                end
                else begin
                    if(hh[3:0]==4'h9)begin
                        hh[7:4]<=hh[7:4]+1'h1;
                        hh[3:0]<=4'h0;
                    end
                    else
                        hh[3:0]<=hh[3:0]+1'h1;
                end
            end
            else
                hh<=hh;
        end
    end
endmodule

module count_ms(
    output reg [7:0]t,
    input clk,
    input reset,
    input ena);
    always@(posedge clk)begin
        if(reset)
            t<=0;
        else begin
          if(ena)begin
            if(t[3:0]==4'h9)begin
                if(t[7:4]==4'h5)
                    t<=0;
                else begin
                    t[7:4]<=t[7:4]+1'h1;
                    t[3:0]<=4'h0;
                end
            end
              else
                  t[3:0]<=t[3:0]+1'h1;
          end
            else
                t<=t;
        end
    end 
    endmodule
