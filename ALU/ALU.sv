module ALU (
    input  logic [1:0] A,       // 2-bit operand A
    input  logic [1:0] B,       // 2-bit operand B
    input  logic [1:0] Op,      // 2-bit operation selector
    output logic [3:0] Result    // 4-bit result
);
    // Intermediate wires for operation outputs
    logic [3:0] AND_Result;
    logic [3:0] XOR_Result;
    logic [3:0] ADD_Result;
    logic [3:0] MUL_Result;

    // Instantiate operation modules
    AND_Operation and_inst (
        .A(A),
        .B(B),
        .AND_Out(AND_Result)
    );

    XOR_Operation xor_inst (
        .A(A),
        .B(B),
        .XOR_Out(XOR_Result)
    );

    ADD_Operation add_inst (
        .A(A),
        .B(B),
        .ADD_Out(ADD_Result)
    );

    MULTIPLY_Operation mul_inst (
        .A(A),
        .B(B),
        .MUL_Out(MUL_Result)
    );

    // Instantiate the multiplexer to select the result based on Op
    mux4to1 mux_inst (
        .AND_Result(AND_Result),
        .XOR_Result(XOR_Result),
        .ADD_Result(ADD_Result),
        .MUL_Result(MUL_Result),
        .Op(Op),
        .Result(Result)
    );
	 
endmodule
