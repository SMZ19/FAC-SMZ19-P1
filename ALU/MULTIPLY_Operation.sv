module MULTIPLY_Operation (
    input  logic [1:0] A,       // 2-bit operand A
    input  logic [1:0] B,       // 2-bit operand B
    output logic [3:0] MUL_Out   // 4-bit MULTIPLY result
);
    // Partial Products
    logic pp0, pp1, pp2, pp3;

    assign pp0 = A[0] & B[0];
    assign pp1 = A[0] & B[1];
    assign pp2 = A[1] & B[0];
    assign pp3 = A[1] & B[1];

    // Summing Partial Products
    // MUL_Out[0] = pp0
    assign MUL_Out[0] = pp0;

    // MUL_Out[1] = pp1 ^ pp2
    logic mul_carry1;
    assign MUL_Out[1] = pp1 ^ pp2;
    assign mul_carry1 = pp1 & pp2;

    // MUL_Out[2] = pp3 ^ mul_carry1
    assign MUL_Out[2] = pp3 ^ mul_carry1;

    // MUL_Out[3] = pp3 & mul_carry1
    assign MUL_Out[3] = pp3 & mul_carry1;
endmodule
