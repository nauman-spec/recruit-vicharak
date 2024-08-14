module RegisterFile (
    input wire clk,                        // Clock signal
    input wire [2:0] read_reg1,          
    input wire [2:0] read_reg2,           
    input wire [2:0] write_reg,          
    input wire [18:0] data_in,            // 19-bit input data to write
    input wire write_enable,               
    output reg [18:0] data_out1,          
    output reg [18:0] data_out2           
);

    reg [18:0] reg_array [0:7];           // Array of 8 registers, each 19 bits wide

    // Continuous assignment to read data from registers
    always @(*) begin
        data_out1 = reg_array[read_reg1];
        data_out2 = reg_array[read_reg2]; 
    end

    // Write operation on the positive edge of the clock
    always @(posedge clk) begin
        if (write_enable) begin
            reg_array[write_reg] <= data_in; // Write input data to the specified register
        end
    end

endmodule
