module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //
    
    parameter [1:0]Byte1=2'b00,Byte2=2'b01,Byte3=2'b10,Done=2'b11;
    reg [1:0] state,nx_state;
    reg [23:0]data_packet;
    // State transition logic (combinational)
    always@(*)begin
        case(state)
            Byte1:nx_state=in[3]?Byte2:Byte1;
            Byte2:nx_state=Byte3;
            Byte3:nx_state=Done;
            Done:nx_state=in[3]?Byte2:Byte1;
            default:nx_state=Byte1;
        endcase
    end
    // State flip-flops (sequential)
    always@(posedge clk)begin
        if(reset)
            state<=Byte1;
        else
            state<=nx_state;
    end
    // New: Datapath to store incoming bytes.
    always@(posedge clk)begin
        if(reset)
            data_packet=24'b0;
        else 
            data_packet={data_packet[15:8],data_packet[7:0],in};
    end        
    // Output logic
    assign done=(state==Done);  
    assign out_bytes=done?data_packet:24'b0;
endmodule
