`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/11/2025 10:17:31 AM
// Design Name: 
// Module Name: uart_simplex_tx_top
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


module uart_simplex_tx_top #(
    parameter BAUD_RATE = 115200,
    parameter CLOCK_FREQ = 100_000_000
)(
    input clk,
    input rst,
    input [7:0] tx_data,
    input tx_start,
    output tx
);

    wire tx_busy;
    uart_tx #(.BAUD_RATE(BAUD_RATE), .CLOCK_FREQ(CLOCK_FREQ)) uart_transmitter (
        .clk(clk),
        .rst(rst),
        .tx_start(tx_start),
        .tx_data(tx_data),
        .tx(tx),
        .tx_busy(tx_busy)
    );
endmodule

