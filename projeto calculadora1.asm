.data
bemvindo: .asciiz"############# 		BEM-VINDO!			#############\n"
resultadofinal: .asciiz"O resultado é: \n"
menu: .asciiz"\nEscolha um numero associado á operação:\n 1- Soma\n 2- Subtração\n 3- Multiplicação\n 4- Divisão\n 5- Fatorial\n 6- Conversão de bases decimal para binário\n 7- Conversão de base binário para decimal\n 8- Conversão de base decimal para hexadecimal\n 9- Conversão de hexadecimal para decimal\n 10- Calcular Seno\n 11- Calcular Coseno\n 12- Raiz de um número(em inteiro)\n 13- Potência\n 14- Logaritmo base 2\n 15- Logaritmo base 10\n 16- Menu Ajuda\n 17- Terminar\n"
num1: .asciiz"Escolha o primeiro numero: \n"
num2: .asciiz"Escolha o segundo numero: \n"
fator: .asciiz"Escolha o numero para o fatorial do mesmo: \n"
######	decimal para base 2
userInput:  .asciiz     "Please enter your integer: "
binaryInput:    .asciiz "Here is the input in binary: "
nl:         .asciiz     "\n"
hexInput:   .asciiz     "Here is the input in hexadecimal: "
binaryOutput:   .asciiz "Here is the output in binary: "
hexOutput:  .asciiz     "Here is the output in hexadecimal: "
hexDigit:   .asciiz     "0123456789ABCDEF"
obuf:       .space      100
obufe:

###### binario para decimal
msgbindec:.asciiz "Insira um numero em base binária (-2 para sair): "
resultadobindec:.asciiz "\nResult: "
allOnes:.asciiz "1111111111111111"
empty:.space 16
newLine:.asciiz "\n"
sum:.space 16 
sumMsg:.asciiz "O número em decimal é: "
oneFound:.asciiz "\nOne found\n"
zeroFound:.asciiz "\nZero found\n"
###### seno
prompt1: .asciiz "Insira o valor de x para o sin(x): \n"
####### decimal para hexadecimal
msg: .asciiz "insira número base 10 para converter em Hexadecimal: \n"
resposta: .asciiz "Equivalente Hexadecimal: "
resultado: .space 8
#####	hexadecimal para decimal
hexa: .space 1024
error_msg: .asciiz "O numero foi introduzido de forma incorreta, verifique se o numero em hexadecimal que introduziu tem um total de oito digitos com numeros entre 0 e 9 e e/ou a e f(letras pequenas).\n"
start_msg: .asciiz "Introduza um numero em hexadecimal: 0x"
resultadohexdec: .asciiz "A conversão do mesmo para decimal é: "
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
spacelog2: .asciiz " "
newlinelog2: .asciiz "\n"
logexception: .asciiz "O logaritmo de 1 e sempre 0.\n"
logexception2: .asciiz "O valor do logaritmo e: 1"
logdoneprompt: .asciiz "O valor do logaritmo e: "
logfailureprompt: .asciiz "ERRO eh negativo e/ou decimal ou eh indefinido.\n"
enterint: .asciiz "Introduza um numero para fazer o logaritmo de base 2 do mesmo: \n"
intinput: .word 0
######## log 10
spacelog10: .asciiz " "
newlinelog10: .asciiz "\n"
logexceptionlog10: .asciiz "O logaritmo de 1 e sempre 0.\n"
logexception2log10: .asciiz "O valor do logaritmo e: 2"
logdonepromptlog10: .asciiz "O valor do logaritmo e: "
logfailurepromptlog10: .asciiz "ERRO eh negativo e/ou decimal ou eh indefinido.\n"
enterintlog10: .asciiz "Introduza um numero para fazer o logaritmo de base 10 do mesmo: \n"
intinputlog10: .word 0
####### menu help
localarquivo:.asciiz "C:/Users/tiago/OneDrive/Ambiente de Trabalho/Arquitetura de Computadores/menu help.txt"
conteudoarquivo:.space 4096#bufer
###### desligar a calculadora
ateaproxima:.asciiz"\n############# 		ATÉ A PRÓXIMA! 			#############\n"
.text
li $v0,4
la $a0,bemvindo
syscall
While:
li $v0,4
la $a0,menu
syscall
#chamada da operação
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
li $s4,14
li $s5,15
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
beq $t0,$s4,log2
beq $t0,$s5,log10
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
li $v0,4
la $a0,userInput
syscall

# read user-input
li $v0,5
syscall
move $s0,$v0

# output original in binary
la $a0,binaryInput
li $a1,32
jal prtbin
# isolate bits 12,13,14,15
srl $s0,$s0,12
andi $s0,$s0,0x0F
b While

# prtbin -- print in binary
#
# arguments:
#   a0 -- output string
#   a1 -- number of bits to output
prtbin:
li $a2,1                   # bit width of number base digit
j  prtany

# prthex -- print in hex
#
# arguments:
#   a0 -- output string
#   a1 -- number of bits to output
#prthex:
    #li      $a2,4                   # bit width of number base digit
    #j       prtany

# prtany -- print in given number base
#
# arguments:
#   a0 -- output string
#   a1 -- number of bits to output
#   a2 -- bit width of number base digit
#   s0 -- number to print
#
# registers:
#   t0 -- current digit value
#   t5 -- current remaining number value
#   t6 -- output pointer
#   t7 -- mask for digit
prtany:
li $t7,1
sllv $t7,$t7,$a2             # get mask + 1
subu $t7,$t7,1               # get mask for digit

la $t6,obufe               # point one past end of buffer
subu $t6,$t6,1               # point to last char in buffer
sb $zero,0($t6)            # store string EOS

move $t5,$s0                 # get number

prtany_loop:
and $t0,$t5,$t7             # isolate digit
lb $t0,hexDigit($t0)       # get ascii digit

subu $t6,$t6,1               # move output pointer one left
sb $t0,0($t6)              # store into output buffer

srlv $t5,$t5,$a2             # slide next number digit into lower bits
sub $a1,$a1,$a2             # bump down remaining bit count
bgtz $a1,prtany_loop         # more to do? if yes, loop

# output string
li $v0,4
syscall
# output the number
move $a0,$t6                 # point to ascii digit string start
syscall
# output newline
la $a0,nl
syscall

jr $ra                     # return



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
beqz $t0, Exit # branch to exit se contador é igual a zero
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
b main9
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
l.s $f4,float1# precisão
li $v0,4 # syscall para imprimir string
la $a0, prompt1 # carregar endereço da prompt
syscall # imprimr a prompt
li $v0,6 # ler float do teclado para $f0
syscall
b seno
seno:
mul.s $f2,$f0,$f0 # x^2
mov.s $f12,$f0 # impressão de float deve estar em $f12
for1:
abs.s $f1,$f0 # Compara com valor não negativo da série
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
b for1 # Gvai para início do loop for
endfor1:
li $v0,2 # imprime resposta em $f12
syscall

b While

cos:
.globl main11
main11:
li $t0,3 # Initilizar n
l.s $f4,floatcos# precisão
li $v0,4 # syscall para imprimir string
la $a0, promptcos # carregar endereço da prompt
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
mov.s $f12,$f0 # impressão de float deve estar em $f12
for2:
abs.s $f1,$f0 # Compara com valor não negativo da série
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
b for2 # Gvai para início do loop for
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
log2:
.globl main14
main14:
li $v0,4
la $a0,enterint
syscall
li $v0,5
syscall
sw $v0,intinput
addi $t3,$zero,2 #base
addi $t4,$zero,2 #expoente
lw $t5,intinput #input
beq $t3,$t5,exception2
beq $t5,1,exception
addi $t7,$zero,2
logtwowhile:
mul $t7,$t7,$t3
beq $t7,$t5,logdone
bgt $t7,$t5,logfailure
addi $t4,$t4,1
blt $t7,$t5,logtwowhile
logdone:
li $v0,4
la $a0,logdoneprompt
syscall
li $v0,1
move $a0,$t4
syscall
li $v0,4
la $a0,newlinelog2
syscall
li $v0,4
la $a0,newlinelog2
syscall
b While
j main14
logfailure:
li $v0,4
la $a0,logfailureprompt
syscall
j main14
exception:
li $v0,4
la $a0,logexception
syscall
li $v0,4
la $a0,newlinelog2
syscall
li $v0,4
la $a0,newlinelog2
syscall
j main14
exception2:
li $v0,4
la $a0,logexception2
syscall
li $v0,4
la $a0,newlinelog2
syscall
li $v0,4
la $a0,newlinelog2
syscall
j main14

log10:
.globl main15
main15:
li $v0,4
la $a0,enterintlog10
syscall
li $v0,5
syscall
sw $v0,intinputlog10
addi $t3,$zero,10 #base
addi $t4,$zero,2 #expoente
lw $t5,intinputlog10 #input
beq $t3,$t5,exception2log10
beq $t5,1,exceptionlog10
addi $t7,$zero,10
logtwowhilelog10:
mul $t7,$t7,$t3
beq $t7,$t5,logdonelog10
bgt $t7,$t5,logfailurelog10
addi $t4,$t4,1
blt $t7,$t5,logtwowhilelog10
logdonelog10:
li $v0,4
la $a0,logdonepromptlog10
syscall
li $v0,1
move $a0,$t4
syscall
li $v0,4
la $a0,newlinelog10
syscall
li $v0,4
la $a0,newlinelog10
syscall
b While
j main15
logfailurelog10:
li $v0,4
la $a0,logfailurepromptlog10
syscall
j main15
exceptionlog10:
li $v0,4
la $a0,logexceptionlog10
syscall
li $v0,4
la $a0,newlinelog10
syscall
li $v0,4
la $a0,newlinelog10
syscall
j main15
exception2log10:
li $v0,4
la $a0,logexception2log10
syscall
li $v0,4
la $a0,newlinelog10
syscall
li $v0,4
la $a0,newlinelog10
syscall
j main15

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
li $a2,4096 #tamanho do buffer
syscall #leitura realizada

li $v0,4 #imprimir arquivo
move $a0,$a1
syscall
li $v0,16 #fechar arquivo
move $a0,$s0#para ficar seguro volta a copiar o descritor para $a0

b While

imprimir:
li $v0,1
syscall

b While

terminar:
li $v0,4
la $a0,ateaproxima
syscall
li $v0,10 # codigo 10 == terminar
syscall






