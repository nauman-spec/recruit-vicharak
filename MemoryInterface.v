module MemoryInterface(
    input wire clk,             // Clock signal
    input wire rst,             // Reset signal
    input wire [18:0] instr,    // 19-bit instruction
    output reg [18:0] data_out, // 19-bit output data
    input wire read_enable,     
    input wire write_enable,    
    output reg [18:0] address  
);

    // Define a memory with 19-bit wide data and 256 locations
    reg [18:0] memory [255:0];

    always @(posedge clk or posedge rst) begins
        if (rst) begin
            // Clear memory on reset
            address <= 19'b0;
            data_out <= 19'b0;
        end else begin
            if (write_enable) begin
                // Write the 19-bit instruction to the memory address
                memory[instr[18:10]] <= instr[9:0];
                address <= instr[18:10];
            end else if (read_enable) begin
                // Read the data from the memory address
                data_out <= memory[instr[18:10]];
                address <= instr[18:10];
            end
        end
    end
endmodule
