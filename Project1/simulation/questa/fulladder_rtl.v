// Copyright (C) 2023  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// *****************************************************************************
// This file contains a Verilog test bench template that is freely editable to  
// suit user's needs .Comments are provided in each section to help the user    
// fill out necessary details.                                                  
// *****************************************************************************
// Generated on "08/28/2024 16:16:39"
                                                                                
// Verilog Test Bench template for design : fulladder_rtl
// 
// Simulation tool : Questa Intel FPGA (Verilog)
// 

`timescale 1 ps/ 1 ps
module fulladder_rtl_vlg_tst();
// constants                                           
// general purpose registers
reg eachvec;
// test vector input registers
reg A;
reg B;
reg Cin;
// wires                                               
wire Cout;
wire S;

// assign statements (if any)                          
fulladder_rtl i2 (
// port map - connection between master ports and signals/registers   
	.A(A),
	.B(B),
	.Cin(Cin),
	.Cout(Cout),
	.S(S)
);
initial                                                
begin                                                  
// code that executes only once                        
// insert code here --> begin                          
                                                       
// --> end                                             
$display("Running testbench");                       
end                                                    
always 
                                                
// optional sensitivity list                           
// @(event1 or event2 or .... eventn)                  
begin  
// Test Case 0: A=0, B=0, Cin=0
        A = 0; B = 0; Cin = 0;
        #1; // 1 ns delay
        $display("%b %b   %b  | %b   %b", A, B, Cin, S, Cout);

        // Test Case 1: A=0, B=0, Cin=1
        A = 0; B = 0; Cin = 1;
        #1; // 1 ns delay
        $display("%b %b   %b  | %b   %b", A, B, Cin, S, Cout);

        // Test Case 2: A=0, B=1, Cin=0
        A = 0; B = 1; Cin = 0;
        #1; // 1 ns delay
        $display("%b %b   %b  | %b   %b", A, B, Cin, S, Cout);

        // Test Case 3: A=0, B=1, Cin=1
        A = 0; B = 1; Cin = 1;
        #1; // 1 ns delay
        $display("%b %b   %b  | %b   %b", A, B, Cin, S, Cout);

        // Test Case 4: A=1, B=0, Cin=0
        A = 1; B = 0; Cin = 0;
        #1; // 1 ns delay
        $display("%b %b   %b  | %b   %b", A, B, Cin, S, Cout);

        // Test Case 5: A=1, B=0, Cin=1
        A = 1; B = 0; Cin = 1;
        #1; // 1 ns delay
        $display("%b %b   %b  | %b   %b", A, B, Cin, S, Cout);

        // Test Case 6: A=1, B=1, Cin=0
        A = 1; B = 1; Cin = 0;
        #1; // 1 ns delay
        $display("%b %b   %b  | %b   %b", A, B, Cin, S, Cout);

        // Test Case 7: A=1, B=1, Cin=1
        A = 1; B = 1; Cin = 1;
        #1; // 1 ns delay
        $display("%b %b   %b  | %b   %b", A, B, Cin, S, Cout);
                                                
// code executes for every event on sensitivity list   
// insert code here --> begin                          
                                                       
@eachvec;                                              
// --> end                                             
end                                                    
endmodule

