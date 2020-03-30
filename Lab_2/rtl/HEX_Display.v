`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2020 01:13:34
// Design Name: 
// Module Name: HEX_Display
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


module HEX_Display(
input [7:0]HEX_counter,
output reg [6:0]  hex,
output     [7:0]  hex_on
    );
  
  reg HEX_disp_selector[1:0]
  
  assign hex_on = 8'b1111_1100;
    
  always @(*) begin
    case (dc_dec[3:0])
      4'd0 : hex = 7'b100_0000;
      4'd1 : hex = 7'b111_1001;
      4'd2 : hex = 7'b010_0100;
      4'd3 : hex = 7'b011_0000;
      4'd4 : hex = 7'b001_1001;
      4'd5 : hex = 7'b001_0010;
      4'd6 : hex = 7'b000_0010;
      4'd7 : hex = 7'b111_1000;
      4'd8 : hex = 7'b000_0000;
      4'd9 : hex = 7'b001_0000;
      4'd10 : hex = 7'b000_1000;
      4'd11 : hex = 7'b000_0011;
      4'd12 : hex = 7'b100_0110;
      4'd13 : hex = 7'b010_0001;
      4'd14 : hex = 7'b000_0110;
      4'd15 : hex = 7'b000_1110;
    endcase
  end 
    
endmodule
