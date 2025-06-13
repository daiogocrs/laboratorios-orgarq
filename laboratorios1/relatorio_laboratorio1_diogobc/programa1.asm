.data
b:      .word 20
d:      .word 3      
e:      .word 7     
c:      .word 0

msg_b:  .asciiz "Número fixo b: "
msg_d:  .asciiz "Número fixo d: "
msg_e:  .asciiz "Número fixo e: "
msg_res:.asciiz "Resultado: "
newline:.asciiz "\n"

.text
.globl main

main:
    lw $t0, b          

    li $t2, 35        
    add $t1, $t0, $t2  

    lw $t3, d          

    mul $t4, $t3, $t3   
    mul $t4, $t4, $t3   

    lw $t5, e          

    add $t6, $t1, $t5  

    sub $t7, $t4, $t6 

    sw $t7, c          

    li $v0, 4
    la $a0, msg_b
    syscall

    move $a0, $t0
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 4
    la $a0, msg_d
    syscall

    move $a0, $t3
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 4
    la $a0, msg_e
    syscall

    move $a0, $t5
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 4
    la $a0, msg_res
    syscall

    move $a0, $t7
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 10
    syscall