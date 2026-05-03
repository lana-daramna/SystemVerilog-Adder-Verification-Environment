class transaction;

    rand logic [3:0] a;
    rand logic [3:0] b;

    logic [4:0] c;
/////////////////////////////////////////////////////////////
    rand bit [3:0] delay;

    constraint delay_c {
    delay >= 1;
    delay <= 10;
  }

    function void display(string tag = "");
        $display("[%s] a=%0d, b=%0d, c=%0d, delay=%0d", tag, a, b, c, delay);
    endfunction

endclass