module fulladder_tb();
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