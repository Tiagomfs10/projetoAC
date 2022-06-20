.data
bemvindo: .asciiz"############# 		BEM-VINDO!			#############\n"
menu: .asciiz"\nEscolha um numero associado � opera��o:\n 1- Soma\n 2- Subtra��o\n 3- Multiplica��o\n 4- Divis�o\n 5- Fatorial\n 6- Convers�o de bases decimal para bin�rio\n 7- Convers�o de base bin�rio para decimal\n 8- Convers�o de base decimal para hexadecimal\n 9- Convers�o de hexadecimal para decimal\n 10- Calcular Seno\n 11- Calcular Coseno\n 12- Raiz de um n�mero(em inteiro)\n 13- Pot�ncia\n 16- Menu Ajuda\n 17- Terminar\n"
resultadofinal: .asciiz"O resultado �: \n"
num1: .asciiz"Escolha o primeiro numero: \n"
num2: .asciiz"Escolha o segundo numero: \n"
fator: .asciiz"Escolha o numero para o fatorial do mesmo: \n"
######	decimal para base 2
msg1: .asciiz "insira um n�mero (A > 0) : "
msg2: .asciiz "insira (2) para concretizar a convers�o em base bin�ria: "
msg3: .asciiz "\nResultado : "
###### binario para decimal
msgbindec:.asciiz "Insira um numero em base bin�ria (-2 para sair): "
resultadobindec:.asciiz "\nResult: "
allOnes:.asciiz "1111111111111111"
empty:.space 16
newLine:.asciiz "\n"
sum:.space 16 
sumMsg:.asciiz "O n�mero em decimal �: "
oneFound:.asciiz "\nOne found\n"
zeroFound:.asciiz "\nZero found\n"
###### seno
prompt1: .asciiz "Insira o valor de x para o sin(x): \n"
####### decimal para hexadecimal
msg: .asciiz "insira n�mero base 10 para converter em Hexadecimal: \n"
resposta: .asciiz "Equivalente Hexadecimal: "
resultado: .space 8
#####	hexadecimal para decimal
hexa: .space 4096
error_msg: .asciiz "O numero foi introduzido de forma incorreta, verifique se o numero em hexadecimal que introduziu tem um total de oito digitos com numeros entre 0 e 9 e e/ou a e f(letras pequenas).\n"
start_msg: .asciiz "Introduza um numero em hexadecimal: 0x"
resultadohexdec: .asciiz "A convers�o do mesmo para decimal �: "
new_line: .asciiz "\n"
#######	 cont.seno
float1: .float 0.000001
######### coseno
promptcos: .asciiz "Insira o valor de x em cos(x):  "
erro:.asciiz "\n\no valor tem de ser menor que 2PI\n"
resultadocos:.asciiz " Coseno = "
floatcos: .float 0.000001
float_pi_2:.float 1.5708
float_pi:.float 3.14159
float_3pi_2:.float 4.71239
float_5pi_2:.float 7.85398
float_2pi:.float 6.28319
####### raiz
raizz:.asciiz"Escolha um numero para fazer a sua raiz: \n"
####### potencia
numpotencia1:.asciiz "insira o numero base: \n"
numpotencia2:.asciiz "insira o expoente do numero base: \n"
##### log 2

######## log 10

####### menu help
localarquivo:.asciiz "C:/Users/tiago/OneDrive/Ambiente de Trabalho/Arquitetura de Computadores/menu help.txt"
conteudoarquivo:.space 1024#bufer
###### desligar a calculadora
ateaproxima:.asciiz"\n############# 		AT� A PR�XIMA! 			#############\n"
.text
li $v0,4
la $a0,bemvindo
syscall
While:
li $v0,4
la $a0,menu
syscall
#chamada da opera��o
li $v0,5
syscall
move $t0,$v0

li $t1,1
li $t2,2
li $t3,3
li $t4,4
li $t5,5
li $t6,6
li $t7,7
li $t8,8
li $t9,9
li $s0,10
li $s1,11
li $s2,12
li $s3,13
li $s6,16
li $s7,17


beq $t0,$t1,soma
beq $t0,$t2,subt
beq $t0,$t3,multi
beq $t0,$t4,divi
beq $t0,$t5,fatorial
beq $t0,$t6,conver_dec_bin
beq $t0,$t7,conver_bin_dec
beq $t0,$t8,conver_dec_hex
beq $t0,$t9,conver_hex_dec
beq $t0,$s0,seno1
beq $t0,$s1,cos
beq $t0,$s2,raiz_int
beq $t0,$s3,poten
beq $t0,$s6,menu_help
beq $t0,$s7,terminar

soma:
.globl main
main:
li $v0,4
la $a0,num1
syscall
li $v0,5
syscall
move $t6,$v0

li $v0,4
la $a0,num2
syscall
li $v0,5
syscall
move $t7,$v0
add $a0,$t6,$t7

b imprimir

subt:
.globl main2
main2:
li $v0,4
la $a0,num1
syscall
li $v0,5
syscall
move $t6,$v0

li $v0,4
la $a0,num2
syscall
li $v0,5
syscall
move $t7,$v0
sub $a0,$t6,$t7
b imprimir

multi:
.globl main3
main3:
li $v0,4
la $a0,num1
syscall
li $v0,5
syscall
move $t6,$v0

li $v0,4
la $a0,num2
syscall
li $v0,5
syscall
move $t7,$v0
mult $t6,$t7
mflo $a0
b imprimir

divi:
.globl main4
main4:
li $v0,4
la $a0,num1
syscall
li $v0,5
syscall
move $t6,$v0

li $v0,4
la $a0,num2
syscall
li $v0,5
syscall
move $t7,$v0
div $a0,$t6,$t7
b imprimir

fatorial:
.globl main5
main5:

li $v0,4
la $a0,fator
syscall
li $v0,5
syscall
move $t0,$v0
#li $v0,5

#move $s1,$v0
#syscall
li $t4,1
mult $t0,$t4
mflo $t3
for:
ble $t0,1,imprimir
sub $t0,$t0,1
mult $t3,$t0
mflo $t3
move $a0,$t3
b for

conver_dec_bin:
.globl main6
main6:
addi $s0,$zero,2
addi $s1,$zero,10
valorA:
li $v0,4
la $a0,msg1
syscall
li $v0,5
syscall
blt $v0,$zero,valorA
move $t0,$v0
valorB:
li $v0,4
la $a0,msg2
syscall
li $v0,5
syscall
blt $v0,$s0,valorB
bgt $v0,$s1,valorB
add $t1,$zero,$v0
li $v0,4
la $a0,msg3
syscall
add $a0,$zero,$t0
add $a1,$zero,$t1
jal converter

b While

converter:
#a0=A
#a1=B
addi $sp,$sp,-16
sw $s3,12($sp) #counter,used to know
#how many times we will pop from stack
sw $s0,8($sp) #A
sw $s1,4($sp) #B
sw $ra,0($sp)
add $s0,$zero,$a0
add $s1,$zero,$a1
beqz $s0,end
div $t4,$s0,$s1 #t4=A/B
rem $t3,$s0,$s1 #t3=A%B
add $sp,$sp,-4
sw $t3,0($sp) #guardar t3
add $a0,$zero,$t4 # A/B
add $a1,$zero,$s1 # B
addi $s3,$s3,1
jal converter  #chama converter 
end:
lw $ra,0($sp)
lw $s1,4($sp)
lw $s0,8($sp)
lw $s3,12($sp)
beqz $s3,done
lw $a0,16($sp)
li $v0,1
syscall
done:
addi $sp,$sp,20
jr $ra #retorna

conver_bin_dec:
.globl main7
main7:

getNum:
li $v0,4        # Print string system call
la $a0,msgbindec         #"Please insert value (A > 0) : "
syscall

la $a0, empty
li $a1, 16              # load 16 as max length to read into $a1
li $v0,8                # 8 is string system call
syscall

#la $a0, empty
#li $v0, 4               # print string
#syscall

li $t4, 0               # initialize sum to 0

startConvert:
la $t1, empty
li $t9, 16             # initialize counter to 16

firstByte:
lb $a0, ($t1)      # load the first byte
blt $a0, 48, printSum    # I don't think this line works 
addi $t1, $t1, 1          # increment offset
subi $a0, $a0, 48         # subtract 48 to convert to int value
subi $t9, $t9, 1          # decrement counter
beq $a0, 0, isZero
beq $a0, 1, isOne
j convert     # 

isZero:
j firstByte

isOne:                   # do 2^counter 
li $t8, 1               # load 1
sllv $t5, $t8, $t9    # shift left by counter = 1 * 2^counter, store in $t5
add $t4, $t4, $t5         # add sum to previous sum 

move $a0, $t4        # load sum
#li $v0, 1              # print int
#syscall
j firstByte

convert:

printSum:
srlv $t4, $t4, $t9

la $a0, sumMsg
li $v0, 4
syscall

move $a0, $t4      # load sum
li $v0, 1      # print int
syscall
b While

conver_dec_hex:
.globl main8
main8:
la $a0, msg
li $v0, 4
syscall
li $v0, 5
syscall
move $t2, $v0
li $v0, 4
la $a0, resposta
syscall
li $t0, 8 # countador
la $t3, resultado
Loop:
beqz $t0, Exit # branch to exit se contador � igual a zero
rol $t2, $t2, 4 # rodar 4 bits a esquerda
and $t4, $t2, 0xf # mascara com 1111
ble $t4, 9, Soma # se less than or equal to 9, branch tpara soma
addi $t4, $t4, 55 # se greater than 9, add 55
b End
Soma:
addi $t4, $t4, 48 # add 48 ao resultado
End:
sb $t4, 0($t3) # guarda o digito hexadecimal no resultado
addi $t3, $t3, 1 # incrementa contador address
addi $t0, $t0, -1 # decrementa contador loop
j Loop
Exit:
la $a0, resultado
li $v0, 4
syscall

b While
conver_hex_dec:
.globl main9
main9:
la $a0, start_msg
li $v0, 4
syscall
la $a0, hexa
li $a1, 1024
li $v0, 8
syscall
la $t8, hexa
la $t0, hexa
lb $t1, ($t0)
li $t6, 1
li $t7, 0
b find_end
find_end:
beq $t1, 10, end_found
addu $t0, $t0, 1
lb $t1, ($t0)
b find_end
end_found:		
subu $t0, $t0, 1
lb $t1, ($t0)
sge $t2, $t1, '0'
sle $t3, $t1, '9'
sge $t4, $t1, 'a'
sle $t5, $t1, 'f'
beq $t2, 1, zero_to_nine_check
b error
loop:
beq $t0, $t8, exit	
subu $t0, $t0, 1
lb $t1, ($t0)
mul $t6, $t6, 16
sge $t2, $t1, '0'
sle $t3, $t1, '9'
sge $t4, $t1, 'a'
sle $t5, $t1, 'f'
beq $t2, 1, zero_to_nine_check
b error	
zero_to_nine_check:
beq $t3, 1, is_between_zero_to_nine	
beq $t5, 1, a_to_f_check
b error	
is_between_zero_to_nine:
sub $t1, $t1, '0'
mul $t1, $t1, $t6
add $t7, $t7, $t1
b loop
a_to_f_check:
beq $t4, 1, is_a_to_f
b error
is_a_to_f:
beq $t1, 'a', is_a
beq $t1, 'b', is_b
beq $t1, 'c', is_c
beq $t1, 'd', is_d
beq $t1, 'e', is_e
beq $t1, 'f', is_f
b error
is_a:
li $t1, 10
mul $t1, $t1, $t6
add $t7, $t7, $t1
b loop
is_b:
li $t1, 11
mul $t1, $t1, $t6
add $t7, $t7, $t1
b loop
is_c:
li $t1, 12
mul $t1, $t1, $t6
add $t7, $t7, $t1
b loop
is_d:
li $t1, 13
mul $t1, $t1, $t6
add $t7, $t7, $t1
b loop
is_e:
li $t1, 14
mul $t1, $t1, $t6
add $t7, $t7, $t1
b loop
is_f:
li $t1, 15
mul $t1, $t1, $t6
add $t7, $t7, $t1
b loop					
error:
la $a0, error_msg
li $v0, 4
syscall
b main4
exit:
li $v0, 4
la $a0, resultadohexdec
syscall
move $a0, $t7
li $v0, 1
syscall
la $a0, new_line
li $v0, 4
syscall
b While
seno1:
.globl main10
main10:
li $t0,3 # Initilizar n
l.s $f4,float1# precis�o
li $v0,4 # syscall para imprimir string
la $a0, prompt1 # carregar endere�o da prompt
syscall # imprimr a prompt
li $v0,6 # ler float do teclado para $f0
syscall
b seno
seno:
mul.s $f2,$f0,$f0 # x^2
mov.s $f12,$f0 # impress�o de float deve estar em $f12
for1:
abs.s $f1,$f0 # Compara com valor n�o negativo da s�rie
c.lt.s $f1,$f4 # numero < que 0.000001?
bc1t endfor1
subu $t1,$t0,1 # (n-1)
mul $t1,$t1,$t0 # n(n-1)
mtc1 $t1, $f3 # move n(n-1) para registo floating
cvt.s.w $f3, $f3 # converte n(n-1) num float
div.s $f3,$f2,$f3 # (x^2)/(n(n-1))
neg.s $f3,$f3 # -(x^2)/(n(n-1))
mul.s $f0,$f0,$f3 # (Serie*x^2)/(n(n-1))
add.s $f12,$f12,$f0 # resposta em $f12
addu $t0,$t0,2 # Incrementa n
b for1 # Gvai para in�cio do loop for
endfor1:
li $v0,2 # imprime resposta em $f12
syscall

b While

cos:
.globl main11
main11:
li $t0,3 # Initilizar n
l.s $f4,floatcos# precis�o
li $v0,4 # syscall para imprimir string
la $a0, promptcos # carregar endere�o da prompt
syscall # imprimr a prompt
li $v0,6 # ler float do teclado para $f0
syscall
l.s $f6,float_pi_2
c.le.s $f0,$f6
bc1t primeiro
l.s $f6,float_pi
c.le.s $f0,$f6
bc1t segundo
l.s $f6,float_3pi_2
c.le.s $f0,$f6
bc1t terceiro
l.s $f6,float_2pi
c.le.s $f0,$f6
bc1t quarto
la $a0,erro
li $v0,4
syscall
quarto:
l.s $f6,float_5pi_2
sub.s $f0,$f6,$f0
b seno2
terceiro:
l.s $f6,float_5pi_2
sub.s $f0,$f6,$f0
b seno2
segundo:
l.s $f6,float_pi_2
add.s $f0,$f6,$f0
b seno2
primeiro:
sub.s $f0,$f6,$f0
b seno2
seno2:
mul.s $f2,$f0,$f0 # x^2
mov.s $f12,$f0 # impress�o de float deve estar em $f12
for2:
abs.s $f1,$f0 # Compara com valor n�o negativo da s�rie
c.lt.s $f1,$f4 # numero < que 0.000001?
bc1t endfor2
subu $t1,$t0,1 # (n-1)
mul $t1,$t1,$t0 # n(n-1)
mtc1 $t1, $f3 # move n(n-1) para registo floating
cvt.s.w $f3, $f3 # converte n(n-1) num float
div.s $f3,$f2,$f3 # (x^2)/(n(n-1))
neg.s $f3,$f3 # -(x^2)/(n(n-1))
mul.s $f0,$f0,$f3 # (Serie*x^2)/(n(n-1))
add.s $f12,$f12,$f0 # resposta em $f12
addu $t0,$t0,2 # Incrementa n
b for2 # Gvai para in�cio do loop for
endfor2:
la $a0,resultadocos
li $v0,4
syscall
li $v0,2 # imprime resposta em $f12
syscall
b While

raiz_int:
.globl main12
main12:
li $v0,4
la $a0,raizz
syscall
li $v0,5
syscall
add $t1,$zero,$v0
add $a0, $zero, $v0
jal isqrt # v0 = resultado
move $t1,$v0
# Imprimir resultado
li $v0,4
la $a0,resultadofinal
syscall
li $v0,1
move $a0,$t1
syscall
b While
isqrt:
 # v0 - entrada e retorno
 # t0 - bit
 # t1 - num
 # t2,t3 - temporarios
move $v0, $zero # initaliza retorno
move $t1, $a0 # move a0 para t1
addi $t0, $zero, 1
sll $t0, $t0, 30
isqrt_bit:
slt $t2, $t1, $t0 # num < bit
beq $t2, $zero, isqrt_loop
srl $t0, $t0, 2 # bit >> 2
j isqrt_bit
isqrt_loop:
beq $t0, $zero, isqrt_return
add $t3, $v0, $t0 # t3 = retorno + bit
slt $t2, $t1, $t3
beq $t2, $zero, isqrt_else
srl $v0, $v0, 1 # retorno >> 1
j isqrt_loop_end
isqrt_else:
sub $t1, $t1, $t3 # num -= retorno + bit
srl $v0, $v0, 1 # retorno >> 1
add $v0, $v0, $t0 # retorno + bit
isqrt_loop_end:
srl $t0, $t0, 2 # bit >> 2
j isqrt_loop
isqrt_return:
jr $ra


poten:
.globl main13
main13:
li $v0,4
la $a0,numpotencia1
syscall
li $v0,5
syscall
move $t3,$v0
li $v0,4
la $a0,numpotencia2
syscall
li $v0,5
syscall
move $t4,$v0
add $s6,$zero,$t3 # default Value for num 1
add $s7,$zero,$t4 # default Value for num 2
beq $s7, $zero, l1 #if $s7 and 0 are equal jump to L1
add $t2, $zero, $s6  #store value of s6 into t2
addi $t0, $zero, 1  #initialize t0 register to 1
beq $s7, $t0, l2 #if $s7 and 1 are equal jump to L2
loop3:
addi $t0, $t0, 1 # increment value stored in t0 register
mul $t2, $t2, $s6 # multiply values stored in t2 and s6 register, placed result in t2 register
blt $t0, $s7, loop3 # if t0 less than s7 then go to loop.
j l3
l1: 
addi $t2, $zero, 1 #store 1 into t2...number to power of 0
j l3
l2:
add $t2, $zero, $s6 #store s6 into t2...number to power of 1
l3:
addi $v0, $zero, 1
add $a0, $zero, $t2
li $v0,1
syscall #Print ans
b While

menu_help:
.globl main16
main16:
li $v0,13 #abrir arquivo
la $a0,localarquivo
li $a1,0 #leitura do arquivo: 0; escrita do arquivo: 1
syscall # descritor(identificador do fucheito) vai para $v0
move $s0,$v0 # copia o descritor para $s0
move $a0,$s0 #copia o descritor para $a0

li $v0,14 #ler conteudo referenciado em $a0
la $a1,conteudoarquivo#buffer que armazena o conteudo
li $a2,1024 #tamanho do buffer
syscall #leitura realizada

li $v0,4 #imprimir arquivo
move $a0,$a1
syscall
li $v0,16 #fechar arquivo
move $a0,$s0#para ficar seguro volta a copiar o descritor para $a0

b While

imprimir:
#li $v0,4
#la $a0,resultadofinal
#syscall
li $v0,1
syscall

b While

terminar:
li $v0,4
la $a0,ateaproxima
syscall
li $v0,10 # codigo 10 == terminar
syscall






