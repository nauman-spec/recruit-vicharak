odule ALU (
    input [15:0] a, b,
    input [2:0] op, // 3-bit opcode for different operations
    output [15:0] result,
    output zero, carry, overflow
);

wire [15:0] sum, diff;
wire cout, ov;

assign sum = a + b;
assign diff = a - b;

// Simple ALU with basic operations
assign result = (op == 3'b000) ? sum :
                (op == 3'b001) ? diff :
                (op == 3'b010) ? (a & b) :
                (op == 3'b011) ? (a | b) :
                (op == 3'b100) ? (a ^ b) :
                16'b0; // Default: no operation

assign zero = (result == 16'b0);
assign carry = cout;
assign overflow = ov;

endmodule
