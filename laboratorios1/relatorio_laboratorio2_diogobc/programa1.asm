.data
DISPLAY: .word 0xFFFF0010              

digitos: .byte 0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F  

.text
.globl main

main:
    li $t0, 0xFFFF0010      
    la $t1, digitos      
    li $t2, 0       

loop:
    lb $t3, 0($t1)        
    sb $t3, 0($t0)          
    
    li $v0, 32
    li $a0, 500
    syscall

    addi $t1, $t1, 1        
    addi $t2, $t2, 1       
    li $t4, 10               
    blt $t2, $t4, loop      

    li $v0, 10             
    syscall

