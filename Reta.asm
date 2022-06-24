
.data
frameBuffer:
.space 0x80000


menu:.asciiz "Escolha o comprimento da Reta (Em Pixels): \n"




.text 
li $v0,4 
la $a0,menu
syscall
li $v0,5
syscall
move $a0,$v0 
move $a1,$a0 
li $a2,150
li $a3,2 
jal reta
li $v0,10
syscall

reta:
# $a0 
# $a1 
# $a2 
# $a3 

beq $a1,$zero,reta_output 
beq $a3,$zero,reta_output 

li $t0,-75000 # Cor: Amarelo
la $t1,frameBuffer
add $a1,$a1,$a0
add $a3,$a3,$a2
sll $a0,$a0,2
sll $a1,$a1,2
sll $a2,$a2,11
sll $a3,$a3,11
addu $t2,$a2,$t1 
addu $a3,$a3,$t1
addu $a2,$t2,$a0 
addu $a3,$a3,$a0
addu $t2,$t2,$a1 
li $t4,0x800

retaYciclo:
move $t3,$a2 

retaXciclo:
sw $t0,($t3)
addiu $t3,$t3,4
bne $t3,$t2,retaXciclo # Continua at� ao limite inserido pelo utilizador em x

addu $a2,$a2,$t4 
addu $t2,$t2,$t4 
bne $a2,$a3,retaYciclo 

reta_output:
jr $ra
