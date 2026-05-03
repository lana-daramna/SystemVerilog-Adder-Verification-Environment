// adder .sv
module adder (
    input  logic        clk,
    input  logic        reset,
    input  logic [3:0]  a,
    input  logic [3:0]  b,
    input  logic        valid,
    output logic [4:0]  c
);

    logic [4:0] tmp_c;

    // Sequential logic: reset and addition
    always_ff @(posedge clk or posedge reset) begin
        if (reset)
            tmp_c <= 5'd0;
        else if (valid)
            tmp_c <= a + b;
    end

    assign c = tmp_c;

endmodule