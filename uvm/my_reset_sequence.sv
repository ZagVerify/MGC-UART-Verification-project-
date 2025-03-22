/*
------------------------------------------------------------
  File: my_reset_sequence.sv
  Engineer: Eng. Omar Ashraf
  Date: 18/3/2025
  Version: 1.0
  Description: 
      - This sequence generates reset APB transactions 
        using main_sequence_item and sends them via the sequencer.
      - It primarily focuses on generating reset transactions.
  Features:
      - Generates a configurable number of reset transactions.
      - Ensures presetn, sel, and enable are properly set to reset values.
      - Sends transactions sequentially to the DUT.
  TODO:
------------------------------------------------------------
*/
class my_reset_sequence extends uvm_sequence #(my_reset_sequence_item);
    `uvm_object_utils(my_reset_sequence)

    function new(string name = "my_reset_sequence");
        super.new(name);
    endfunction

    rand int num; 	// Config total number of items to be sent
    constraint const {num inside {[50:100]}};

    task body();
        for(int i=0; i<num; i++) begin
            my_sequence_item reset_item = my_sequence_item::type_id::create("reset_item");
            start_item(reset_item);
            reset_item.presetn = 0;
            reset_item.psel = 0;
            reset_item.penable = 0;

            `uvm_info("SEQ", $sformatf("Generate new item: %s", reset_item.convert2string()), UVM_HIGH)

            finish_item(reset_item);
        end
            `uvm_info("SEQ", $sformatf("Done generation of %0d items", num), UVM_LOW)
    endtask   

endclass //className extends superClass

//notes  start_item task found in uvm_sequence_base.svh
