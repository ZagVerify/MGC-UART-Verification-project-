/*
------------------------------------------------------------
  File: my_sequence_item.sv
  Engineer: Eng. Omar Ashraf
  Date: 17/3/2025
  Version: 1.0
  Description: 
      - This is the base transaction object used in the UVM 
        environment to initiate new transactions and capture
        transactions at the DUT interface.

  TODO:
      - Add more constraints if needed.
      - Verify the correctness of randomized fields.
      - Extend for additional APB operations.
------------------------------------------------------------
*/
class my_sequence_item extends uvm_sequence_item;

    `uvm_object_utils(main_sequence_item)

    rand  bit        presetn;
    randc bit [31:0] paddr;
    rand  bit        psel;
    rand  bit        pwrite;
    rand  bit        penable;
    randc bit [31:0] pwdata;

    function new(string name = "main_sequence_item");
        super.new(name);
    endfunction // new()

    constraint apb_const {
        presetn dist { 1 := 100, 0 := 1 };
        psel dist { 1 := 100, 0 := 1 };
       // pwrite dist { 1 := 70, 0 := 30 }; i think we will creat an isolated read and write sequences 
        paddr inside {32'h0000_0000, 32'h0000_0004, 32'h0000_0008, 32'h0000_000C,
                      32'h0000_0010, 32'h0000_0014, 32'h0000_0018, 32'h0000_001C,
                      32'h0000_0020};
        penable dist { 1 := 100, 0 := 1 };   
        pwdata inside {[32'h0000_0000:32'h0000_FFFF]};          
    }

    function string convert2string();
        return $sformatf("address=%0d, write data=%0d", paddr, pwdata);
    endfunction    

endclass // main_sequence_item
