module wrapper ( my_interface vif );
  adder adder_inst (
    . clk ( vif . clk ) ,
    . reset ( vif . reset ) ,
    . a ( vif . a ) ,
    . b ( vif . b ) ,
    . valid ( vif . valid ) ,
    . c ( vif . c )
  );

endmodule
