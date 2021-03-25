	.data
	hdrr:		.ascii "----Start of Program #5: Stack Usage\n"
			.asciiz "Corinne Bond (CS220, ID:02) \n"
	ftr:		.asciiz "\n----End of Program----"
	array:      	.word     1,  3,  5,  7,  9, 11, 13, 15, 17, 19
            		.word    21, 23, 25, 27, 29, 31, 33, 35, 37, 39
            		.word    41, 43, 45, 47, 49, 51, 53, 55, 57, 59
	length:    	.word    30

#--------

	.text
	.globl main #entrance of program

main: 

## loop to push each element onto stack, loop to pop each one off, final result in reserved

	la $a0, hdrr 		#load memory address of hdr msg
		
	li $v0, 4 		#syscall 4 -> print char from string
	syscall 		#do it!

## loop to read items from array and push onto stack
	la $t0, array		#array starting address
	li $t1, 0		#load index val (i=0) to temp register 1
	lw $t2, length		#load word from memory to register

pushLoop:
	lw $t4, ($t0)		#load index val to temp register 4

	subu $sp,$sp, 4		#push array[i]
	sw $t4, ($sp)		#save stack ptr to temp register 4

	add $t1,$t1, 1		# add 1 to i, store new value in temp register 1
	add $t0,$t0, 4		#update array addresses

	blt $t1, $t2, pushLoop 	#compares two registers, if i < length continue
#-------

## loop to pop items from stack and write into array
	la $t0, array 		#array starting address
	li $t1, 0		#set index val to 0

popLoop:
	lw $t4,($sp)		#load stack ptr value to temp register 4
	addu $sp, $sp, 4	#pop array[i]

	sw $t4, ($t0)		#set val at index i

	add $t1,$t1, 1		#update index value +1
	add $t0,$t0, 4		#update array address

	blt $t1,$t2, popLoop	#compares two registers, if i < length continue
#-----
	li $v0, 4 		#syscall 4 -> print char from string
	la $a0, ftr 		#load memory address of ftr
	syscall			#do it

#-----
	li $v0, 10	#terminate
	syscall
.end main