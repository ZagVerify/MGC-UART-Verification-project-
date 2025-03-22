/*
------------------------------------------------------------
  File: my_main_sequence.sv
  Engineer: Eng. Omar Ashraf
  Date: 17/3/2025
  Version: 1.0
  Description: 
      - This sequence generates random APB transactions 
        using main_sequence_item and sends them via the sequencer.

  TODO:
------------------------------------------------------------
*/
class my_main_sequence extends uvm_sequence #(my_sequence_item);
    `uvm_object_utils(my_main_sequence)

    function new(string name = "my_main_sequence");
        super.new(name);
    endfunction

    rand int num; 	// Config total number of items to be sent
    constraint const {num inside {[50:100]}};

    task body();
        for(int i=0; i<num; i++) begin
            my_sequence_item m_item = my_sequence_item::type_id::create("m_item");
            start_item(m_item);
            m_item.randomize();

            `uvm_info("SEQ", $sformatf("Generate new item: %s", m_item.convert2string()), UVM_HIGH)

            finish_item(m_item);
        end
            `uvm_info("SEQ", $sformatf("Done generation of %0d items", num), UVM_LOW)
    endtask   

endclass //className extends superClass

//notes  start_item task found in uvm_sequence_base.svh
