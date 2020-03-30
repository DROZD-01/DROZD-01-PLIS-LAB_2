`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.02.2020 13:05:30
// Design Name: 
// Module Name: test_clk_tb
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


module test_clk_tb(
    );
  reg        CLK50MHZ;  
  reg  [9:0] sw;
  reg  [4:0] btn;
  wire [9:0] led;
  wire [6:0]  hex;
  wire [7:0]  hex_on;
    
  mainframe DUT (
  .CLK50MHZ (CLK50MHZ),
  .sw     (sw),
  .btn    (btn),
  .led    (led),
  .hex    (hex),
  .hex_on (hex_on)
  );

 initial begin
    sw[9:0] = 10'b0000000000;
    btn[4:0] = 4'b0000;
    #50;
    
    btn[3]=1'b1;
    #100;
    btn[3]=1'b0;
    
    #200;

    sw[9:0] = 10'b0000000111;
    
    #200
    
    btn[0]=1'b1;
    #100;
    btn[0]=1'b0;
    
    #200;
    
    btn[0]=1'b1;
    #100;
    btn[0]=1'b0;
    
    #200;
    
    sw[9:0] = 10'b0000000011;
    
    #200;
    
    btn[0]=1'b1;
    #100;
    btn[0]=1'b0;
    
    #200;
    
    btn[3]=1'b1;
    #100;
    btn[3]=1'b0;   
 end 
 
 // Проверка модуляции CLK сигнала
 always begin //Создания 1-0 CLK сигнала
    CLK50MHZ = 1'b1;
    #10;
    CLK50MHZ = 1'b0;
    #10;
 end
    
endmodule
