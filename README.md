# Single-Cycle-RISC-V-32I-Implementation
This repository includes the implementation of single cycle RISC-V 32I including all set of instructions. 
The implementation is done in System Verilog and the simulation is verified using QuestaSim.

# Simulation and Results
## Case 1: GCD computation

### Assembly code:
    addi x8, x0, 20
    addi x9, x0, 4
  gcd:
    beq x8, x9, stop
    blt x8, x9, less
    sub x8, x8, x9
    j gcd
  less:
    sub x9, x9, x8
    j gcd
  stop:
    sw x8, 0x08(x0)
    lw x10, 0x08(x0)
  end:
    j end
