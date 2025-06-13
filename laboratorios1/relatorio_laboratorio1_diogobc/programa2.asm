.data
b:  .word 0
d:  .word 0
e:  .word 0
c:  .word 0

msg_b: .asciiz "Digite o valor de b: "
msg_d: .asciiz "Digite o valor de d: "
msg_e: .asciiz "Digite o valor de e: "
msg_result: .asciiz "Resultado (c) = "

.text
.globl main

main:
    li $v0, 4          
    la $a0, msg_b
    syscall

    li $v0, 5          
    syscall
    move $t0, $v0  
    sw $t0, b

    li $v0, 4
    la $a0, msg_d
    syscall

    li $v0, 5
    syscall
    move $t1, $v0     
    sw $t1, d

    li $v0, 4
    la $a0, msg_e
    syscall

    li $v0, 5
    syscall
    move $t2, $v0      
    sw $t2, e

    li $t3, 35          
    add $t4, $t0, $t3  

    mul $t5, $t1, $t1 
    mul $t5, $t5, $t1

    add $t6, $t4, $t2  

    sub $t7, $t5, $t6  

    sw $t7, c          

    li $v0, 4
    la $a0, msg_result
    syscall

    li $v0, 1
    move $a0, $t7     
    syscall

    li $v0, 11
    li $a0, 10
    syscall

    li $v0, 10
    syscall
