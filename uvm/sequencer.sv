/*
------------------------------------------------------------
  File: my_sequencer.sv
  Engineer: Eng. Omar Ashraf
  Date: 18/3/2025
  Version: 1.0
  Description: 
      - This sequencer acts as the transaction distributor 
        between sequences and the driver.
      - It handles transactions of type `my_sequence_item`.

  Features:
      - Enables dynamic transaction generation.
      - Can handle multiple sequence types (e.g., reset, read, write).
      - Interacts with `my_reset_sequence` to send reset transactions.

  TODO:
      - Implement arbitration for multiple sequence handling.
      - Extend for additional sequence types (e.g., read, write).
------------------------------------------------------------
*/
class my_sequencer extends uvm_sequencer #(my_sequence_item);
    `uvm_component_utils(my_sequencer)

    function new(string name = "my_sequencer", uvm_component parent = null);
        super.new(name, parent);
    endfunction

endclass
