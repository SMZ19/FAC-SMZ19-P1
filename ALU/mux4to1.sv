module mux4to1 (
    input  logic [3:0] AND_Result, // AND operation result
    input  logic [3:0] XOR_Result, // XOR operation result
    input  logic [3:0] ADD_Result, // ADD operation result
    input  logic [3:0] MUL_Result, // MULTIPLY operation result
    input  logic [1:0] Op,         // Operation selector (2-bit)
    output logic [3:0] Result      // Selected result
);

    // Intermediate signals for negated Op values
    logic Op0_not, Op1_not;

    // Negate the selector bits
    assign Op0_not = ~Op[0];
    assign Op1_not = ~Op[1];

    // Multiplexer logic using only gates
    assign Result[0] = (Op1_not & Op0_not & AND_Result[0]) |  // AND when Op = 00
                       (Op1_not &  Op[0] & XOR_Result[0]) |  // XOR when Op = 01
                       ( Op[1]  & Op0_not & ADD_Result[0]) | // ADD when Op = 10
                       ( Op[1]  &  Op[0] & MUL_Result[0]);   // MUL when Op = 11

    assign Result[1] = (Op1_not & Op0_not & AND_Result[1]) | 
                       (Op1_not &  Op[0] & XOR_Result[1]) | 
                       ( Op[1]  & Op0_not & ADD_Result[1]) | 
                       ( Op[1]  &  Op[0] & MUL_Result[1]);

    assign Result[2] = (Op1_not & Op0_not & AND_Result[2]) | 
                       (Op1_not &  Op[0] & XOR_Result[2]) | 
                       ( Op[1]  & Op0_not & ADD_Result[2]) | 
                       ( Op[1]  &  Op[0] & MUL_Result[2]);

    assign Result[3] = (Op1_not & Op0_not & AND_Result[3]) | 
                       (Op1_not &  Op[0] & XOR_Result[3]) | 
                       ( Op[1]  & Op0_not & ADD_Result[3]) | 
                       ( Op[1]  &  Op[0] & MUL_Result[3]);

endmodule
