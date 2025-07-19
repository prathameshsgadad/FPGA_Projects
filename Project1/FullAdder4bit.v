module FullAdder (
    input A, B, Cin,
    output S, Cout
);
    wire S1, C1, C2;

    xor (S1, A, B);
    xor (S, S1, Cin);
    and (C1, A, B);
    and (C2, S1, Cin);
    or (Cout, C1, C2);
endmodule

module FullAdder4bit (
    input [3:0] A, B,
    input Cin,
    output [3:0] S,
    output Cout
);
    wire C1, C2, C3;

    FullAdder FA0 (.A(A[0]), .B(B[0]), .Cin(Cin), .S(S[0]), .Cout(C1));
    FullAdder FA1 (.A(A[1]), .B(B[1]), .Cin(C1), .S(S[1]), .Cout(C2));
    FullAdder FA2 (.A(A[2]), .B(B[2]), .Cin(C2), .S(S[2]), .Cout(C3));
    FullAdder FA3 (.A(A[3]), .B(B[3]), .Cin(C3), .S(S[3]), .Cout(Cout));
endmodule