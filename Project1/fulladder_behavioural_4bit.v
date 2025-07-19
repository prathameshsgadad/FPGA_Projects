// 1-bit Full Adder in Behavioral Style
module fulladder_behavioural_4bit (
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output wire [3:0] S,
    output wire Cout
);
// Sum calculation
assign {Cout, S} = A + B + Cin;

endmodule
