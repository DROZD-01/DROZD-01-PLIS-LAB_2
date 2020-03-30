`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2020 14:03:25
// Design Name: 
// Module Name: REG_Event
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


module REG_Event(
    input [9:0]REG_sw, //Ввод данных c sw[9:0] в обработчик событий
    input REG_CLK50MHZ,
    input REG_btn_ondn,
    output reg REG_synced_event = 0 // Выход внешнего синхронизатора (кнопки)
      );
      
    reg REG_sw_event = 0; //регистр уникального события
    reg [2:0] event_sync_reg = 3'b000; //синхронизирующий регистр 1
        
    // Обработчик уникального события (индивидуальное задание)
    // REG_sw_event - выход уникальных событий

    always @(REG_sw[9:0]) begin // Проверка наличия уникального события в момент изменения содержимого регистра KEY[0]
        if ((REG_sw[0] + REG_sw[1] + REG_sw[2] + REG_sw[3]+ REG_sw[4] + REG_sw[5] + REG_sw[6] + REG_sw[7] + REG_sw[8] + REG_sw[9]) > 4'd2) 
            REG_sw_event <= 1'b1; 
        else REG_sw_event <= 1'b0;
    end
     
    //Обработчик вывода синхронизированного сигнала (REG_sw_event)
    // REG_sync = event_sync_reg_1[1] & ~event_sync_reg_1[0];
    // Синхронизатор Reg_sw_event с CLK50MHZ
    always @(posedge REG_CLK50MHZ) begin
        event_sync_reg[2] <= REG_sw_event;
        event_sync_reg[1:0] <= event_sync_reg[2:1];
    end
    
    always @(posedge REG_btn_ondn) begin
        REG_synced_event <= event_sync_reg[1] & event_sync_reg[0];
        #20;
        REG_synced_event <= 1'b0; 
    end
    
endmodule
