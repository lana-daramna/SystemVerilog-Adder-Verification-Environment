class monitor;

    mailbox #(transaction) mon2scb;
    virtual my_interface inte;
//• Declare Components: Inside the class, declare a transaction object.
    transaction tr;

    task run();
        forever begin
//1. Synchronize with the clock’s rising edge.
            @(posedge inte.clk);
//2. Wait for the valid signal to become active before capturing data.
            if (inte.valid) begin
//3. Create a new transaction object and assign interface signal values to the transaction.
                tr = new();
                tr.a = inte.a;
                tr.b = inte.b;
                tr.c =inte.c;
//4. Send the captured transaction to the scoreboard via the mon2scb mailbox.
                mon2scb.put(tr);

                tr.display("MON");

            end

        end
    endtask

endclass