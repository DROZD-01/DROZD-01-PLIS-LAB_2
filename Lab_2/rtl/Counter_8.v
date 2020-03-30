`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2020 01:44:33
// Design Name: 
// Module Name: Counter_8
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


module Counter_8(
    input clk,
    input en,
    input rst,
    output reg [7:0] counter
    );
    
    always @(posedge clk or posedge rst) begin
        if (rst) counter <= 0;
        else if (en) counter <= counter + 1;
    end
    
endmodule
