module adder_tb;

    logic clk;
    logic reset;
    logic [3:0] a, b;
    logic valid;
    logic [4:0] c;

    adder uut (
        .clk(clk),
        .reset(reset),
        .a(a),
        .b(b),
        .valid(valid),
        .c(c)
    );
    always #5 clk = ~clk;

initial begin
	$fsdbDumpfile ( " waveform . fsdb " );
	$fsdbDumpvars ();
end
    initial begin
        clk = 0;
        reset = 1;
        valid = 0;
        a = 0;
        b = 0;

        #12;
        reset = 0;

        #10;
        valid = 1;
        a = 4'd3; b = 4'd2;  
        #10;
        a = 4'd7; b = 4'd8;   
        #10;
        a = 4'd15; b = 4'd1;
        #10;
        valid = 0;
        a = 4'd1; b = 4'd1;   

        #20;
        $finish;
    end

endmodule