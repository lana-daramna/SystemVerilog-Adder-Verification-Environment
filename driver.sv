class driver;

  	mailbox #(transaction) gen2driv;
    virtual my_interface inte;
  ////////////////////////////////////////
  //Declare Components: Inside the class, declare a transaction object and a counter variable.

    transaction tr;
    int count = 0;

    task run();
        forever begin
//1. Retrieve a transaction from the gen2drv mailbox.
            gen2driv.get(tr);
//2. Increment the transaction counter.
            count++;
//3. Synchronize with the clock’s rising edge.
            @(posedge inte.clk);
//4. If reset is active, drive all outputs to zero.
          if (inte.reset) begin
                inte.a     <= 0;
                inte.b     <= 0;
                inte.valid <= 0;
            end
//5. Otherwise, assign values to interface signals and manage the valid signal.
            else begin
                inte.a     <= tr.a;
                inte.b     <= tr.b;
                inte.valid <= 1;

                @(posedge inte.clk);
                inte.valid <= 0;
            end
//6. Handle transaction delay before sending the next transaction.
            repeat(tr.delay) @(posedge inte.clk);
//7. Display the transaction details for debugging.
            tr.display($sformatf("DRV count=%0d", count));

        end
    endtask

endclass