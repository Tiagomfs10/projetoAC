# A ferramenta de Bitmap Display tem de estar conectada com MARS e parametrizada para
#   display width in pixels: 512
#   display height in pixels: 512
#   base address for display: 0x10000000 (global data)
.data
frameBuffer:
.space 0x80000 # (512 � 256)?? pixels


menu:.asciiz "Escolha o comprimento do Lado do Quadrado (Em Pixels): \n"

# Desenho quadrado; O input � o valor do lado do quadrado
# (0,0) no display (canto superior esquerdo e incrementa para a direita e para Baixo


.text #imprimir Pergunta
li $v0,4 
la $a0,menu
syscall
li $v0,5
syscall
move $a0,$v0 # copia o comprimento de lado decidido
move $a1,$a0 # Largura
li $a2,100 
move $a3,$a0 # Comprimento - O valor copiado de $a0
jal quadrado
li $v0,10
syscall

quadrado:
# $a0 � o minimo de x (i.e., canto esquerdo; tem de estar no display)
# $a1 corresponde � Largura (must be nonnegative and within the display)
# $a2 � o minimo de y  (i.e., canto do topo, acumula para baixo; tem de estar no display)
# $a3 iguala o comprimento por forma a corresponder a valor Lado

beq $a1,$zero,quadrado_output # zero Largura: N�o desenha nada
beq $a3,$zero,quadrado_output # zero Altura: N�o desenha nada

li $t0,-35000 # Cor: Laranja
la $t1,frameBuffer
add $a1,$a1,$a0 
add $a3,$a3,$a2
sll $a0,$a0,2 # Escala x valores para bytes (4 bytes por pixel)
sll $a1,$a1,2
sll $a2,$a2,11 # Escala y valores para bytes (512*4 bytes por coluna display)
sll $a3,$a3,11
addu $t2,$a2,$t1 # traduz os valores de y para a morada dos valores da coluna para o display
addu $a3,$a3,$t1
addu $a2,$t2,$a0 # traduz os valores do quadrado de y para a morada dos valores da coluna
addu $a3,$a3,$a0
addu $t2,$t2,$a1 # e armazena para a primeira coluna do quadrado
li $t4,0x800 # bytes por coluna de display

quadradoYciclo:
move $t3,$a2 # pointer  para o actual pixel para o ciclo de X; come�a no canto superior esquerdo

quadradoXciclo:
sw $t0,($t3)
addiu $t3,$t3,4
bne $t3,$t2,quadradoXciclo # Continua at� ao limite inserido pelo utilizador em x

addu $a2,$a2,$t4 # avan�a uma coluna para a esquerda
addu $t2,$t2,$t4 # e avan�a uma coluna para baixo
bne $a2,$a3,quadradoYciclo # continua at� ao limite inserido em input

quadrado_output:
jr $ra
