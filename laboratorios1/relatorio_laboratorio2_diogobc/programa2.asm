.data
DISPLAY_RIGHT: .word 0xFFFF0010
KEYBOARD_ROW:  .word 0xFFFF0012
KEYBOARD_READ: .word 0xFFFF0014

digitos: .byte 0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71

.text
.globl main

main:
    li $t7, 1
    lw $s0, DISPLAY_RIGHT
    lw $t1, KEYBOARD_ROW
    lw $t2, KEYBOARD_READ
    la $t3, digitos

loop_scan:
    sb $t7, 0($t1)        
    lb $t4, 0($t2)      

    beqz $t4, next_row    

    andi $t5, $t4, 0x0F

    li $t9, 0
    beq $t5, 1, col0
    beq $t5, 2, col1
    beq $t5, 4, col2
    beq $t5, 8, col3
    j next_row  

col0:
    li $t9, 0
    j col_done

col1:
    li $t9, 1
    j col_done

col2:
    li $t9, 2
    j col_done

col3:
    li $t9, 3

col_done:
    andi $t6, $t4, 0xF0
    srl $t6, $t6, 4

    li $t8, 0
    beq $t6, 1, row0
    beq $t6, 2, row1
    beq $t6, 4, row2
    beq $t6, 8, row3
    j next_row 

row0:
    li $t8, 0
    j row_done

row1:
    li $t8, 1
    j row_done

row2:
    li $t8, 2
    j row_done

row3:
    li $t8, 3

row_done:
    mul $t5, $t9, 4
    addu $t5, $t5, $t8

    addu $t6, $t3, $t5       
    lb $t4, 0($t6)          

    sb $t4, 0($s0)   

    jal delay

next_row:
    sll $t7, $t7, 1
    li $t8, 16
    blt $t7, $t8, loop_scan
    li $t7, 1
    j loop_scan

delay:
    li $t0, 100000
delay_loop:
    addi $t0, $t0, -1
    bnez $t0, delay_loop
    jr $ra
