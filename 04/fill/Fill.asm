// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
// screen in 256 rows and 512 columns pixels
// screen is 256 rows and 32 words wide
// screen is 8k words

@16324
D=A
@screen
M=D

(READ_INPUT)
@KBD
D=M // if kbd = 0 then @color = 0 else @color = 0xFFFF

@CLEAR_SCREEN
D;JEQ


@0
D=A-1
@color
M=D

(FILL_SCREEN) // Fill screen with @color
// for i from 0 to 8k-1
@8192
D=A

@i
M=D


(NEXT_WORD)
@i
D=M

@READ_INPUT
D;JLT

@SCREEN
D=A+D

@word
M=D

@color
D=M

@word
A=M

M=D

@i
M=M-1

@NEXT_WORD
0;JMP


(CLEAR_SCREEN) // Fill screen with 0s
@0
D=A

@color
M=D

@FILL_SCREEN
0;JMP
