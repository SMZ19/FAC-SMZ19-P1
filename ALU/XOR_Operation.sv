module XOR_Operation(
    input  logic [1:0] A,      // 2-bit operand A
    input  logic [1:0] B,      // 2-bit operand B
    output logic [3:0] XOR_Out // 4-bit XOR result
);
    // Perform bitwise XOR
    assign XOR_Out = { {2{A[1] ^ B[1]}}, {2{A[0] ^ B[0]}} };
endmodule
