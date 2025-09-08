module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //
    
    parameter [1:0]Byte1=2'b00,Byte2=2'b01,Byte3=2'b10,Done=2'b11;
    reg [1:0] state,nx_state;
    
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
    // Output logic
    assign done=(state==Done);
endmodule
