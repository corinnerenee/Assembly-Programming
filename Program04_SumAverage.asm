	.data
	hdrr:		.ascii "----Start of Program #4: Sum and Average\n"
			.asciiz "Corinne Bond (CS220, ID:02) \n"
	ftr:		.asciiz "\n----End of Program----"
	msg1:		.asciiz "Average: "
	msg2:		.asciiz "\nSum: "
	
	array:		.word	 1,  3,  5,  7,  9, 11, 13, 15, 17, 19
			.word	21, 23, 25, 27, 29, 31, 33, 35, 37, 39
			.word	41, 43, 45, 47, 49, 51, 53, 55, 57, 59
	length:		.word 	30

	sum:		.word 	0
	average:	.word	0
#--------

	.text
	.globl main #entrance of program

main: 

## loop thru array, access each value, update sum and calculate average

	la $a0, hdrr 		#load memory address of hdr msg	
	li $v0, 4 		#syscall 4 -> print char from string
	syscall 		#do it!
	
	la $t0, array 		#starting address of array
	li $t1, 0		#index i=0
	lw $t2, length		#length

sumLoop:
	lw $t4, ($t0)		#load array val[i] grab value
	add $t3, $t3,$t4	#sum += array[i] calculating sum
	
	add $t1,$t1,1		#i+=1 updating index value
	add $t0,$t0, 4		#update array address

	blt $t1,$t2, sumLoop 	#compares two registers, if i < length continue

	sw $t3, sum		#store sum register to memory
#----
	div $t5,$t3,$t2		# divide sum / length, store avg in t5
	sw $t5, average		#store average resgister to memory

##print sum and avg
	la $a0, msg1		#load memory address of msg1	
	li $v0, 4 		#syscall 4 -> print char from string
	syscall 		#do it!
	
	lw $a0, average 	#load word from memoory
	li $v0, 1 		#syscall 1 -> print int
	syscall 		#do it!

	la $a0, msg2		#load memory address of msg2	
	li $v0, 4 		#syscall 4 -> print char from string
	syscall 		#do it!
	
	lw $a0, sum		#load word from memory
	li $v0, 1 		#syscall 1 -> print int
	syscall 
#-----
	li $v0, 4 		#syscall 4 -> print char from string
	la $a0, ftr 		#load memory address of ftr
	syscall			#do it

#-----
	li $v0, 10	#terminate
	syscall
.end main