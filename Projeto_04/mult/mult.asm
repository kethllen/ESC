// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplica R0 e R1 e armazena o resultado em R2.
// (R0, R1, R2 refere-se a RAM[0], RAM[1], e RAM[2])

// set numero de iterações
// iter = R1
@R1
D=M //guarda o valor do primeiro valor em R1
@iter
M=D //guarda o numero de iterações (o mesmo de R1) em iter

// inicializa soma = 0
// R2 = 0 
@R2
M=0 // resultado iniciado com 0

// set D = R0
@R0
D=M // guarda o valor do segundo numero que vai ser multiplicado que esta em R0

(LOOP) 
  // Subtrai 1 do meu numero de iterações
  @iter
  M=M-1

  @END
  M;JLT   // if iter < 0 jump para END

  // atualiza  soma = soma + D (que é o valor de R0)
  @R2
  M=D+M
  // restart loop
  @LOOP
  0;JMP

// impede que o programa continue
(END)
  @END
  0;JMP