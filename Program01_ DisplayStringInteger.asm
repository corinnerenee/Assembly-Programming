	.data
	hdr:	.ascii "----Start of Program #1: Display Int\n"
		.asciiz "Corinne Bond (CS220, ID:02) \n"
	msg:	.asciiz "The meaning of life is: "
	ftr:	.asciiz "\n----End of Program----"
	number: .word	42
#------------------------------------------------------
#text/code section
	.text
	.globl main #entrance of program

main:
	la $a0, hdr #load memory address of hdr msg
		
	li $v0, 4 #syscall 4 -> print char from string
	syscall #do it!

	la $a0, msg #load memory address of msg
		
	li $v0, 4 #syscall 4 -> print char from string
	syscall #do it	

	li $v0, 1 #syscall 1 -> print an int
	lw $a0, number #load the num into argument register
	syscall #do it!
	
	li $v0, 4 #syscall 4 -> print char from string
	la $a0, ftr #load memory address of ftr
	syscall	#do it

	li $v0, 10 #terminate
	syscall

	jr $31 #terminate program
	.end main