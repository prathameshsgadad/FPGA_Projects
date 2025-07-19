// 1-bit Full Adder Module
// -----------------------
// This module implements a simple 1-bit full adder. 
// It takes three inputs: A, B, and Cin (carry-in) 
// and produces two outputs: S (sum) and Cout (carry-out).

module fulladder_rtl(
    input A,        // First input bit
    input B,        // Second input bit
    input Cin,      // Carry-in bit
    output Cout,    // Carry-out bit
    output S        // Sum bit
);

    // Sum Calculation
    // ----------------
    // The sum S is calculated using the XOR operation.
    // It adds the input bits A, B, and Cin.
    assign S = A ^ B ^ Cin;

    // Carry-out Calculation
    // ---------------------
    // The carry-out Cout is calculated using the following logic:
    // A carry is generated if any two of the inputs are 1.
    assign Cout = (A & B) | (B & Cin) | (Cin & A);

endmodule
