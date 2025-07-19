// Test Bench for 1-bit Full Adder
module tb_full_adder_4bit;

// Testbench signals
reg [3:0] A;
reg [3:0] B;
reg Cin;
wire [3:0] S;
wire Cout;

// Instantiate the full adder module (use behavioral or structural here)
FullAdder4bit UUT (
    .A(A),
    .B(B),
    .Cin(Cin),
    .S(S),
    .Cout(Cout)
);

// Initialize and apply test vectors
initial begin
    // Display results
    $monitor("A=%b B=%b Cin=%b | S=%b Cout=%b", A, B, Cin, S, Cout);

// Test vector 1
    A = 4'b0010; // Binary 2
    B = 4'b0101; // Binary 5
    Cin = 1'b0;  // Decimal 0
    #1;

    // Test vector 2
    A = 4'b0000; // Binary 0
    B = 4'b0010; // Binary 2
    Cin = 1'b1;  // Decimal 1
    #1;

    // Test vector 3
    A = 4'b0000; // Binary 0
    B = 4'b0011; // Binary 3
    Cin = 1'b0;  // Decimal 0
    #1;

    // Test vector 4
    A = 4'b0100; // Binary 4
    B = 4'b0001; // Binary 1
    Cin = 1'b1;  // Decimal 1
    #1;

    // Test vector 5
    A = 4'b0010; // Binary 2
    B = 4'b0000; // Binary 0
    Cin = 1'b0;  // Decimal 0
    #1;

    // Test vector 6
    A = 4'b0101; // Binary 5
    B = 4'b0000; // Binary 0
    Cin = 1'b1;  // Decimal 1
    #1;

    // Test vector 7
    A = 4'b0101; // Binary 5
    B = 4'b0001; // Binary 1
    Cin = 1'b0;  // Decimal 0
    #1;

    // Test vector 8
    A = 4'b0110; // Binary 6
    B = 4'b0001; // Binary 1
    Cin = 1'b1;  // Decimal 1
    #1;


    // End simulation
    $finish;
end

endmodule
