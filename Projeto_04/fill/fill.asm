// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Define o numero max de iterações
@8192
D=A
@max
M=D

// reseta D e a contagem das iterações
(START)
@0
D=A
@iter
M=D-1 // as iterações começam com -1 porque no loop de start lhe é adicionado 1

(LOOP)
  @iter
  M=M+1 // iter = iter + 1

  // if iter = max, reseta as iterações
  D=M // D = iter
  @max
  D=M-D // D = max - iter
  @START
  D;JEQ // D = 0 ? sim => jump para START porque significa que ja foram realizados o numero max de iterações

  // lÊ o valor do teclado
  @KBD
  D=M

  // jump para BLACK se alguma tecla estiver precionada
  @BLACK
  D;JNE // D != 0

  // if D = 0 continua e pinta de branco
  @iter
  D=M // Pegar o numero da iteração
  @SCREEN
  A=A+D // Pegar a posição da palavra para fazer a iteração
  M=0 // Escreve 0 para esta palavra
  @LOOP
  0;JMP // ir para a proxima iteração

  (BLACK)
  @iter
  D=M // Pegar o numero da iteração
  @SCREEN
  A=A+D //Pegar a posição da palavra para fazer a iteração
  M=-1 // Escreve 1 para todos os 16 bits desta palavra e nao so em 1 pixel
  @LOOP
  0;JMP // volta para o loop para realizar a proxima iteração