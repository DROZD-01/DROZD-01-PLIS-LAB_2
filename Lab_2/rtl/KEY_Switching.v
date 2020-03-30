`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.03.2020 23:26:34
// Design Name: 
// Module Name: KEY_Switching
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


module KEY_Switching(
input [4:0]KS_btn,
input [9:0]KS_sw,
input KS_CLK50MHZ,
output [9:0]KS_register,
output [7:0]KS_counter
    );
  
  wire KS_synced_event;
  wire [4:0]KS_btn_ondn;    
  
  KEY_Pressing u1(
    .KP_btn(KS_btn[4:0]),
    .KP_CLK50MHZ(KS_CLK50MHZ),
    .KP_btn_ondn(KS_btn_ondn)
  ); // ¬вод кнопок
  
  Register_10 u2(
    .d(KS_sw[9:0]),
    .clk(KS_CLK50MHZ),
    .rst(KS_btn_ondn[3]),
    .en(KS_btn_ondn[0]),
    .register(KS_register[9:0])
  ); // –егистр ввода данных с переключателей
  
  Counter_8 u3(
    .clk(KS_CLK50MHZ),
    .rst(KS_btn_ondn[3]),
    .en(KS_synced_event),
    .counter(KS_counter[7:0])
  ); // —чЄтчик событий на переключател€х
  
  REG_Event u4(
    .REG_sw(KS_sw[9:0]),
    .REG_CLK50MHZ(KS_CLK50MHZ),
    .REG_synced_event(KS_synced_event),
    .REG_btn_ondn(KS_btn_ondn[0])
  );
  
  
endmodule
