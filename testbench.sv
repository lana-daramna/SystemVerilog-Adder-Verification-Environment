// Code your testbench here
// or browse Examples
`include "transaction.sv"
`include "my_interface.sv"

`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

`include "agent.sv"
`include "environment.sv"

`include "test.sv"

`include "wrapper.sv"

module top_testbench ;
  logic clk ;
  initial begin
    clk = 0;
  end
  always
    #1 clk <= ~ clk ;
  my_interface inf (
    clk
  );
  wrapper wrap (
    inf
  );
  initial begin
    test tst ;
    tst = new ();
    tst . inte = inf ;
    tst . build ();
    tst . connect ();
    tst . run ();
  end
  initial begin
    #300;
    $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end
endmodule
