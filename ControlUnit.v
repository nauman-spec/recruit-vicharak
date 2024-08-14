module ControlUnit(
    input wire [18:0] instr,           // 19-bit instruction
    output reg [3:0] alu_op,           
    output reg mem_read,               
    output reg mem_write,              
    output reg reg_write,              
    output reg [1:0] alu_src,          
    output reg branch,                 
    output reg jump                  
);

    // Extract opcode from instruction
    wire [4:0] opcode = instr[18:14];  // Assuming opcode is 5 bits wide

    always @(*) begin
        // Default control signals
        alu_op = 4'b0000;
        mem_read = 0;
        mem_write = 0;
        reg_write = 0;
        alu_src = 2'b00;
        branch = 0;
        jump = 0;

        case (opcode)
            5'b00000: begin // Example: ADD instruction
                alu_op = 4'b0010; // ALU operation for addition
                reg_write = 1;    // Enable register write
                alu_src = 2'b00;  // Use registers as ALU inputs
            end
            5'b00001: begin // Example: SUB instruction
                alu_op = 4'b0110; // ALU operation for subtraction
                reg_write = 1;    // Enable register write
                alu_src = 2'b00;  // Use registers as ALU inputs
            end
            5'b00010: begin // Example: LOAD instruction
                alu_op = 4'b0000; // ALU operation for address calculation
                mem_read = 1;     // Enable memory read
                reg_write = 1;    // Enable register write
                alu_src = 2'b01;  // Use immediate value as ALU input
            end
            5'b00011: begin // Example: STORE instruction
                alu_op = 4'b0000; // ALU operation for address calculation
                mem_write = 1;    // Enable memory write
                alu_src = 2'b01;  // Use immediate value as ALU input
            end
            5'b00100: begin // Example: BRANCH instruction
                alu_op = 4'b0110; // ALU operation for comparison (subtraction)
                branch = 1;       // Enable branching
                alu_src = 2'b00;  // Use registers as ALU inputs
            end
            5'b00101: begin // Example: JUMP instruction
                jump = 1;         // Enable jumping
            end
            // Add more cases as needed for other instructions
            default: begin
                // Handle undefined instructions or NOP
            end
        endcase
    end
endmodule

