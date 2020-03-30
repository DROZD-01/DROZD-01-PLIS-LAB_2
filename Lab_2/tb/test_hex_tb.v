`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.02.2020 13:54:15
// Design Name: 
// Module Name: test_hex_tb
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


module test_hex_tb(

    );

  reg  [15:0] sw;
  wire [15:0] led;
  wire [6:0]  hex;
  wire [7:0]  hex_on;
  
  mainframe DUT (
  .sw     (sw),
  .led    (led),
  .hex    (hex),
  .hex_on (hex_on)
  );

//// Проверка первого режима с DC1
// initial begin
//    sw[9] = 0;
//    sw[8] = 0;
//    sw[7:4] = 4'd0;
//    sw[3:0] = 4'd0;
//    forever begin
//      #5 sw[3:0] = sw[3:0] +1'b1;
//    end
//  end     

//// Проверка второго режима с DC2  
// initial begin
//    sw[9] = 0;
//    sw[8] = 1;
//    sw[3:0] = 4'd0;
//    sw[7:4] = 4'd0;
//    forever begin
//      #5 sw[7:4] = sw[7:4] +1'b1;
//    end
//  end      

//// Проверка третьего режима с F  
// initial begin
//    sw[9] = 1;
//    sw[8] = 0;
//    sw[7:4] = 4'd0;
//    sw[3:0] = 4'd0;
//    forever begin
//      #5 sw[3:0] = sw[3:0] +1'b1;
//    end
//  end   

//// Проверка четвёртого режима с выводом sw[3:0]  
// initial begin
//    sw[9] = 1;
//    sw[8] = 1;
//    sw[7:4] = 4'd0;
//    sw[3:0] = 4'd0;
//    forever begin
//      #5 sw[3:0] = sw[3:0] +1'b1;
//    end
//  end  
        
endmodule
