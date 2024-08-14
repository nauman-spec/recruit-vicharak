module PipelineStage (
    input wire clk,                    // Clock signal
    input wire rst,                    // Reset signal
    input wire [18:0] in_data,         // 19-bit input data
    input wire valid_in,               
    output reg [18:0] out_data,       
    output reg valid_out              
);

    // Internal signal for data processing (can represent any operation)
    reg [18:0] processed_data;

    // Processing logic (simple pass-through for this example)
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            processed_data <= 19'b0;   
            out_data <= 19'b0;        
            valid_out <= 1'b0;          // Reset output valid signal
        end else begin
            if (valid_in) begin
                processed_data <= in_data; 
                out_data <= processed_data; 
                valid_out <= 1'b1;          
            end else begin
                valid_out <= 1'b0;          
            end
        end
    end

endmodule
