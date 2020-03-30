`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.02.2020 14:43:01
// Design Name: 
// Module Name: KEY_Pressing
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


module KEY_Pressing(
  input      [4:0] KP_btn,
  input            KP_CLK50MHZ,
  output     [4:0] KP_btn_ondn
    );
    
  wire [4:0]KP_btn_onup;
  wire [4:0]KP_btn_state;
      
// Модуль обработки сигналов с кнопок [4:0]btn   
  KEY_Debounce u1(
    .i_btn   (KP_btn[0]),
    .o_onup  (KP_btn_onup[0]),
    .o_ondn  (KP_btn_ondn[0]),
    .o_state (KP_btn_state[0]),
    .clk     (KP_CLK50MHZ)
  ); // Кнопка btn[0]
    KEY_Debounce u2(
    .i_btn   (KP_btn[1]),
    .o_onup  (KP_btn_onup[1]),
    .o_ondn  (KP_btn_ondn[1]),
    .o_state (KP_btn_state[1]),
    .clk     (KP_CLK50MHZ)
  ); // Кнопка btn[1] или KEY[0]
    KEY_Debounce u3(
    .i_btn   (KP_btn[2]),
    .o_onup  (KP_btn_onup[2]),
    .o_ondn  (KP_btn_ondn[2]),
    .o_state (KP_btn_state[2]),
    .clk     (KP_CLK50MHZ)
  ); // Кнопка btn[2]
    KEY_Debounce u4(
    .i_btn   (KP_btn[3]),
    .o_onup  (KP_btn_onup[3]),
    .o_ondn  (KP_btn_ondn[3]),
    .o_state (KP_btn_state[3]),
    .clk     (KP_CLK50MHZ)
  ); // Кнопка btn[3] или KEY[1]
    KEY_Debounce u5(
    .i_btn   (KP_btn[4]),
    .o_onup  (KP_btn_onup[4]),
    .o_ondn  (KP_btn_ondn[4]),
    .o_state (KP_btn_state[4]),
    .clk     (KP_CLK50MHZ)
  ); // Кнопка btn[4]
endmodule
