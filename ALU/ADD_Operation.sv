module ADD_Operation (
    input  logic [1:0] A,     // 2-bit operand A
    input  logic [1:0] B,     // 2-bit operand B
    output logic [3:0] ADD_Out // 4-bit ADD result
);
    // Internal carry wires
    logic carry0, carry1;

    // Bit 0 Addition
    assign ADD_Out[0] = A[0] ^ B[0];
    assign carry0 = A[0] & B[0];

    // Bit 1 Addition
    assign ADD_Out[1] = A[1] ^ B[1] ^ carry0;
    assign carry1 = (A[1] & B[1]) | (A[1] & carry0) | (B[1] & carry0);

    // Carry out
    assign ADD_Out[2] = carry1;
    assign ADD_Out[3] = 1'b0; // Unused for 2-bit addition
endmodule
