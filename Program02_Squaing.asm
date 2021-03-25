	.data
	hdr:		.ascii	"Squaring Eaxmple\n"
			.asciiz	"Enter value: "
	hdrr:		.ascii "----Start of Program #2: Squaring Example\n"
			.asciiz "Corinne Bond (CS220, ID:02) \n"
	ftr:		.asciiz "\n----End of Program----"
	ansMsg:		.asciiz	" Value Squared: "
	value:		.word	0
#------

	.text
	.globl main #entrance of program

main: 
	la $a0, hdrr #load memory address of hdr msg
		
	li $v0, 4 #syscall 4 -> print char from string
	syscall #do it!

	li $v0, 4	#sys call 4 -> print char from string
	la $a0, hdr	#load memory address of hdr2 msg
	syscall		#do it
	
	li $v0, 5	#sys call 5 -> read int from kb
	syscall 	#do it
		
	mul $t0, $v0, $v0 	#multiply num by itself and store result into $t0
	sw $t0, value		#store result in the variable

	li $v0, 4 	#sys call 4 -> print string
	la $a0, ansMsg	#load memory address of answermsg
	syscall		#do it
		
	li $v0, 1 	#sys call 1 -> print an int
	lw $a0, value	#load value into reg $a0 to be printed
	syscall		#do it
	
	li $v0, 4 	#sys call 4 -> print char from string
	la $a0, ftr 	#load memory address of ftr
	syscall		#do it

	li $v0, 10 	#terminate
	.end main
