class test;

    mailbox #(transaction) gen2driv;
    mailbox #(transaction) mon2scb;
    virtual my_interface inte;

    environment env;

    //==========================
    function void build();

        gen2driv = new();
        mon2scb  = new();

        env = new();

        env.gen2driv = gen2driv;
        env.mon2scb  = mon2scb;
        env.inte     = inte;

        env.build();

    endfunction
    //==========================

    function void connect();

        env.connect();

    endfunction

    //==========================
    task reset();
        inte.reset = 1;
        #10;
        inte.reset = 0;
    endtask

    //==========================
    task run();
        env.run();
    endtask

endclass