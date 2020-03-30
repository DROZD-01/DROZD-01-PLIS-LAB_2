`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2020 00:46:47
// Design Name: 
// Module Name: Register_D
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


module Register_10(
    input [9:0] d,
    input clk,
    input rst,
    input en,
    output reg [9:0] register
    );
    
  always @(posedge clk or posedge rst) begin
      if (rst) register <= 0;
      else if (en) register <= d;
  end 
  
endmodule
