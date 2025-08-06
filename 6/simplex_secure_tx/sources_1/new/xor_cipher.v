module xor_cipher #(
    parameter KEY = 8'h0f // Example key, change as needed
)(
    input  [7:0] data_in,
    output [7:0] data_out
);
    assign data_out = data_in ^ KEY;
endmodule