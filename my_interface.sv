interface my_interface (input logic clk);

    logic [3:0] a;
    logic [3:0] b;
    logic valid;
    logic [4:0] c;
    logic reset;

    modport DRV (
        output a,b,valid,reset,
        input c,clk
    );

    modport MON (
        input a,b,valid,c,reset,clk
    );

endinterface