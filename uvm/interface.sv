/* 
------------------------------------------------------------
  File: my_interface.sv
  Engineer: Eng. Omar Ashraf
  Date: 18/3/2025
  Version: 1.0
  Description: 
      - This interface defines the APB (Advanced Peripheral Bus) 
        signal set for communication between the DUT and the 
        UVM testbench.

  Signals:
      - pclk     : Clock signal.
      - presetn  : Active-low reset.
      - paddr    : Address bus (32-bit).
      - psel     : Peripheral select signal.
      - pwrite   : Write enable signal.
      - penable  : Enable signal.
      - pwdata   : Write data bus (32-bit).
      - prdata   : Read data bus (32-bit).
      - pready   : Ready signal indicating transfer completion.
      - pslverr  : Error signal indicating a slave error.

  TODO:
      - Add modports if required for DUT, Driver, and Monitor.
------------------------------------------------------------
*/
interface my_interface (input bit pclk);
    logic        presetn;
    logic [31:0] paddr;
    logic        psel;
    logic        pwrite;
    logic        penable;
    logic [31:0] pwdata;
    logic [31:0] prdata;
    logic        pready;
    logic        pslverr;
endinterface

