class environment;
  
    mailbox #(transaction) mon2scb;
    mailbox #(transaction) gen2driv;
    virtual my_interface inte;

    agent agt;
    scoreboard scb;

    function void build();
      mon2scb = new(1);    // Mailbox instantiation
        agt = new();
        scb = new();
      	agt.build();
    endfunction
    function void connect();
        agt.inte = inte;
        agt.mon2scb = mon2scb;  // Pass mailbox to agent
        scb.mon2scb = mon2scb;  // Pass same to scoreboard
      	agt.connect();
    endfunction

    task run();
        fork
            scb.run();
            agt.run();
           
          	
        join_any
    endtask

endclass
