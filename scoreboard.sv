class scoreboard;

  mailbox #(transaction) mon2scb;
//1. Declare a transaction object to hold the monitored transaction data.
  transaction tr;
//2. Declare a variable to store the expected output for comparison.
    logic [4:0] expected_c;

    task run();
//1. Use a forever loop to continuously receive transactions from the monitor via the mailbox
        forever begin
            mon2scb.get(tr);

//2. Calculate the expected output based on the received transaction data.
   if (tr.c == expected_c) begin
                $display("[SCB PASS] a=%0d, b=%0d, c=%0d",
                          tr.a, tr.b, tr.c);
            end
            else begin
                $error("[SCB FAIL] a=%0d, b=%0d, expected=%0d, got=%0d",
                        tr.a, tr.b, expected_c, tr.c);
            end
            expected_c = tr.a + tr.b;
//3. Compare the expected output with the actual output in the transaction.
//4. Print success or error messages based on whether the outputs match.

          
         

        end
    endtask

endclass