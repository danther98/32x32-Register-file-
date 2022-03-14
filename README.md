# 32x32-Register-file-
This register file has, 
- Two 5-bit source register numbers, 
- One 5-bit destination register number, 
- One 32-bit wide data port for writes, 
- A write enable signal and clock. 
- The outputs are two 32-bit registers values, one for each read port. 

    --Behavior--
    
     -Writes should take effect synchronously on the rising edge of the clock and only when write enable is
       also asserted (active high).
       
     -The register file read port should output the value of the selected register combinatorially.
      
     -When reading and writing the same register, the read port will update on the rising clock edge. The
       read port is still combinatorial.
       
     -Reading register zero ($0) should always return (combinatorially) the value zero.
      
     -Writing register zero has no effect.
      

    --Test-Bench--
    
    The test bench uses hardcoded values to check if each register can hold values.
    It also includes an attempt to write to R0 which is hard set to the value "0"
    
