.data
	hdrr:		.ascii "----Start of Program #6: Power Function\n"
			.asciiz "Corinne Bond (CS220, ID:02) \n"
	ftr:		.asciiz "\n----End of Program----"
	msg1:		.asciiz "3^5 is "

	x:		.word	3
	y:		.word	5
	answer:		.word	0

#--------

	.text
	.globl main #entrance of program

main: 
##function to compute x^y

	la $a0, hdrr 		#load memory address of hdr msg
		
	li $v0, 4 		#syscall 4 -> print char from string
	syscall 		#do it!
	
	lw $a0, x		#load x to arguement register 0
	lw $a1, y		#load y to arguement register 1
	jal power		#call power function
	sw $v0, answer		#save result in function result register 0
	
	la $a0, msg1		#load memory address of msg1	
	li $v0, 4 		#syscall 4 -> print char from string
	syscall 		#do it!
	
	lw $a0, answer		#load mem address of answer
	li $v0, 1		#sys call 1 -> print int
	syscall			#do it

	li $v0, 4 		#syscall 4 -> print char from string
	la $a0, ftr 		#load memory address of ftr
	syscall			#do it

	li $v0, 10		#terminate
	syscall 		#do it
.end main
## function to find and return x^y

	.globl 	power
	.ent	power
power:
	li $v0, 1
	li $t0, 0
powLoop:
	mul $v0,$v0,$a0		#multiply $v0 = v0 * a0
	add $t0, $t0, 1		#add +1 to index value
	blt $t0, $a1, powLoop	#compares two registers, if

	jr	$ra	
.end power