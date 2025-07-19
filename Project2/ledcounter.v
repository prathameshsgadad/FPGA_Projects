module ledcounter(
    input clk,
    input reset,
    input direction,
    output reg [3:0] count
);

    reg [31:0] pre_count;

    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            pre_count <= 32'b0;  // Reset the counter to zero
        end else begin
            if (direction) begin
                pre_count <= pre_count + 1;  // Increment if direction is '1'
            end else begin
                pre_count <= pre_count - 1;  // Decrement if direction is '0'
            end
        end
    end

    // Assign the 4 most significant bits of pre_count to count output
    always @(*) begin
        count = pre_count[31:28];  // Taking the 4 MSB bits
    end

endmodule
