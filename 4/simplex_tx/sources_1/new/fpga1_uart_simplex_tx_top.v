`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/11/2025 10:50:43 AM
// Design Name: 
// Module Name: fpga1_uart_simplex_tx_top
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


module fpga1_uart_simplex_tx_top(
    input clk,
    input rst,
    input UART_rxd,          // From PC1 via USB-UART (V12)
    output uart_tx_pmod      // To FPGA2 via PMOD
);
    
    wire [7:0] rx_data;
    wire rx_data_valid;
    reg [7:0] tx_data;
    reg tx_start;
    wire tx_busy;

    // UART RX from PC1
    uart_rx uart_rx_pc(
        .clk(clk),
        .rst(rst),
        .rx(UART_rxd),
        .rx_data_valid(rx_data_valid),
        .rx_data(rx_data)
    );

    // UART TX to FPGA2 (PMOD)
    uart_tx uart_tx_pmod_inst(
        .clk(clk),
        .rst(rst),
        .tx_start(tx_start),
        .tx_data(tx_data),
        .tx(uart_tx_pmod),
        .tx_busy(tx_busy)
    );

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            tx_start <= 0;
            tx_data <= 8'd0;
        end else begin
            tx_start <= 0;
            if (rx_data_valid && !tx_busy) begin
                tx_data <= rx_data;
                tx_start <= 1;
            end
        end
    end
endmodule

