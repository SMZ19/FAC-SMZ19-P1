module ALU_tb;
    // Testbench signals
    logic [1:0] A;
    logic [1:0] B;
    logic [1:0] Op;
    logic [3:0] Result;

    // Instantiate the ALU
    ALU uut (
        .A(A),
        .B(B),
        .Op(Op),
        .Result(Result)
    );

    // Task to display results
    task display_result;
        input [1:0] A_tb;
        input [1:0] B_tb;
        input [1:0] Op_tb;
        input [3:0] Result_tb;
        begin
            // Decode operation for readability
            string op_name;
            case (Op_tb)
                2'b00: op_name = "AND";
                2'b01: op_name = "XOR";
                2'b10: op_name = "ADD";
                2'b11: op_name = "MUL";
                default: op_name = "UNKNOWN";
            endcase

            $display("A = %b (%0d), B = %b (%0d), Op = %b (%s) => Result = %b (%0d)", 
                     A_tb, A_tb, 
                     B_tb, B_tb, 
                     Op_tb, op_name, 
                     Result_tb, Result_tb);
        end
    endtask

    initial begin
        // Initialize A and B
        A = 2; // 2'b10
        B = 3; // 2'b11

        // Display header
        $display("Starting ALU Testbench for A=2 and B=3...");
        $display("-------------------------------------------------");
        $display("A      B      Op     | Result");
        $display("-------------------------------------------------");

        // Iterate through all possible Op values (0 to 3)
        for (Op = 0; Op < 4; Op = Op + 1) begin
            #10; // Wait for 10 time units
            display_result(A, B, Op, Result);
        end

        // Finish simulation
        $display("ALU Testbench Completed.");
        $finish;
    end
endmodule
