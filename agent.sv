class agent;

    mailbox #(transaction) gen2driv;
    mailbox #(transaction) mon2scb;
    virtual my_interface inte;

    generator gen;
    driver driv;
    monitor mon;

    agent agt;
    scoreboard scb;

    function void build();
      gen2driv = new(1);
      mon = new();
      driv = new();
      gen = new();

    endfunction

    function void connect();

      	gen.gen2driv = gen2driv;
        driv.gen2driv = gen.gen2driv;
        driv.inte = inte;
        mon.inte = inte;
        mon.mon2scb = mon2scb; 


    endfunction

    task run();
        fork
          mon.run();
          driv.run();
          gen.run();
        join_any
    endtask

endclass