class generator;
    mailbox #(transaction) gen2driv;

   ///////////////////////////////
    transaction tr;

    int count = 20;

    task run();
        repeat(count) begin
            
            tr = new();
            if (!tr.randomize()) begin
                $error("Randomization failed!");
            end

            tr.display("GEN");

            gen2driv.put(tr);

        end
    endtask

endclass