`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.03.2020 21:13:05
// Design Name: 
// Module Name: KEY_Debounce
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module KEY_Debounce(
    input clk,
    input i_btn,
    output reg o_state=0,
    output o_ondn,
    output o_onup
    );
    
    // sync with clock and combat metastability
    reg sync_0 = 0, sync_1 = 0;
    always @(posedge clk) sync_0 <= i_btn;
    always @(posedge clk) sync_1 <= sync_0;

    // 2.6 ms counter at 50 MHz
    reg [1:0] counter = 2'd0;
    wire idle = (o_state == sync_1);
    wire max = &counter;

    always @(posedge clk)
    begin
        if (idle)
            counter <= 0;
        else
        begin
            counter <= counter + 1;
            if (max)
                o_state <= ~o_state;
        end
    end

    assign o_ondn = ~idle & max & ~o_state;
    assign o_onup = ~idle & max & o_state;
    
endmodule
