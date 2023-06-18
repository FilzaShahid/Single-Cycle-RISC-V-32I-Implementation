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

### Simulation:

![image](https://github.com/FilzaShahid/Single-Cycle-RISC-V-32I-Implementation/assets/58341924/ef80a870-62a4-4954-9d56-5ff9ec2c976b)
![image](https://github.com/FilzaShahid/Single-Cycle-RISC-V-32I-Implementation/assets/58341924/f5b1e7a3-f013-4e14-a2a7-cfcdee7d8b8a)

![image](https://github.com/FilzaShahid/Single-Cycle-RISC-V-32I-Implementation/assets/58341924/e73ac6be-3d2a-4c6b-b82c-ce0cec26965b)
![image](https://github.com/FilzaShahid/Single-Cycle-RISC-V-32I-Implementation/assets/58341924/cc0c1a72-1e02-4bc8-94e0-39b03ca56af9)

![image](https://github.com/FilzaShahid/Single-Cycle-RISC-V-32I-Implementation/assets/58341924/019cdd69-8f5c-43af-aac4-c26ad1795e59)
![image](https://github.com/FilzaShahid/Single-Cycle-RISC-V-32I-Implementation/assets/58341924/7c68a9ee-8837-43e5-91e6-d6f41c30efac)

### Register Memmory:

![image](https://github.com/FilzaShahid/Single-Cycle-RISC-V-32I-Implementation/assets/58341924/0fcdd83a-fd0a-4667-8f51-d9863ac88e29)

### Data Memory:

![image](https://github.com/FilzaShahid/Single-Cycle-RISC-V-32I-Implementation/assets/58341924/7f3923ea-b3ed-4f73-947a-75579416974f)

### Instruction Memory:
![image](https://github.com/FilzaShahid/Single-Cycle-RISC-V-32I-Implementation/assets/58341924/b51ea292-1200-4458-8ecb-51bfe4a09835)

## Case 2: 
### Assembly code:
     
    main:
        addi x2, x0, 9
        addi x3, x0, 2
        bne x2, x3, imm
    rtype:
        add x4, x2, x3
        sub x5, x2, x3
        sll x6, x2, x3
        sltu x7, x2, x3
        xor x8, x2, x3
        srl x9, x2, x3
        sra x10, x2, x3
        or x11, x2, x3
        and x12, x2, x3
        bge x2, x3, load
    imm:
        addi x13, x2, 3
        slli x14, x2, 3
        xori x15, x2, 3
        srli x16, x2, 3
        srai x17, x2, 3
        ori x18, x2, 3
        andi x19, x2, 3
        j rtype
    load:
        lw x20, 0x04(x0)
        lb x21, 0x04(x0)
        lh x22, 0x04(x0)
        j upper_imm
    store:
        sw x20, 0x14(x0)
        sb x20, 0x18(x0)
        sh x20, 0x1c(x0)
        j end
    upper_imm:
        lui x25, 0x12345
        addi x25, x25, 0x678
        lui x26, 0x12346
        addi x26, x26,0xFFFFFA78
        auipc x27, 0x23456
        bgeu x2, x3, store
    end:
        j end

### Simulation:

![image](https://github.com/FilzaShahid/Single-Cycle-RISC-V-32I-Implementation/assets/58341924/98371b68-fce7-410b-9d04-dc5d1a416035)
![image](https://github.com/FilzaShahid/Single-Cycle-RISC-V-32I-Implementation/assets/58341924/e451cbd7-26c9-4ece-a70f-57bd5bd40f58)

![image](https://github.com/FilzaShahid/Single-Cycle-RISC-V-32I-Implementation/assets/58341924/480d088f-f952-4f38-a4dc-6b78ff28a36e)
![image](https://github.com/FilzaShahid/Single-Cycle-RISC-V-32I-Implementation/assets/58341924/c5d8f9fe-ba20-4746-ac4d-11febadb29d2)

### Register Memmory:

![image](https://github.com/FilzaShahid/Single-Cycle-RISC-V-32I-Implementation/assets/58341924/46ac982a-7d96-44a9-92cb-717cf1a0857e)

### Data Memory:

![image](https://github.com/FilzaShahid/Single-Cycle-RISC-V-32I-Implementation/assets/58341924/7ecc5327-328b-42d7-b6f6-8307bb7662dc)

### Instruction Memory:
![image](https://github.com/FilzaShahid/Single-Cycle-RISC-V-32I-Implementation/assets/58341924/f254c1a7-1033-4383-8e55-4626acd88a9c)
