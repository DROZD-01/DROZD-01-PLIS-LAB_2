`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.02.2020 13:43:29
// Design Name: 
// Module Name: mainframe
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


module mainframe(
  input      [9:0] sw,
  input      [4:0] btn,
  input      CLK50MHZ,
  output     [9:0] led,
  output reg [6:0]  hex,
  output reg [7:0]  hex_on
    );
     
  wire [9:0]mainfr_register;  
  wire [7:0]mainfr_counter;  
  
  KEY_Switching u1(
    .KS_btn(btn[4:0]),
    .KS_sw(sw[9:0]),
    .KS_CLK50MHZ(CLK50MHZ),
    .KS_register(mainfr_register[9:0]),
    .KS_counter(mainfr_counter[7:0])
  );
  
  assign mainfr_CLK50MHZ    = CLK50MHZ;
  assign led = mainfr_register;
  
  reg mainfr_disp_selector = 1'd0;

  always @(posedge mainfr_CLK50MHZ) begin
      mainfr_disp_selector <= mainfr_disp_selector + 1'b1; 
      if (mainfr_disp_selector == 1'b0)
      begin
          hex_on <= 8'b1111_1110;
          case (mainfr_counter[3:0])
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
      
      if (mainfr_disp_selector == 1'b1)
      begin
          hex_on <= 8'b1111_1101;
          case (mainfr_counter[7:4])
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
  end
  
endmodule

