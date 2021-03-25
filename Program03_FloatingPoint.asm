	.data
	hdrr:		.ascii "----Start of Program #3: Floating Point Arithmetic\n"
			.asciiz "Corinne Bond (CS220, ID:02) \n"
	ftr:		.asciiz "\n----End of Program----"
	msg1:		.asciiz "The surface area is "
	msg2:		.asciiz "\nThe volume is "

	pi:		.float	3.14159
	fourPtZero: 	.float	4.0
	threePtZero:	.float	3.0
	radius:		.float	17.25
	surfaceArea:	.float 	0.0
	volume:		.float	0.0
#--------

	.text
	.globl main #entrance of program

main: 
	la $a0, hdrr #load memory address of hdr msg
		
	li $v0, 4 #syscall 4 -> print char from string
	syscall #do it!

	l.s	$f2, fourPtZero #load fourptzero to $f2
	l.s	$f4, pi 	#load pi to $f4
	mul.s	$f4, $f2, $f4 	#multiply pi by fourptzero and store result into pi's reg

	l.s 	$f6, radius 	#load radius to $f6

#calculate surface area -> 4.0 * pi * radius^2
	mul.s	$f8, $f6, $f6	#radius squared, store result in $f8
	mul.s	$f8, $f4, $f8	#radius^2 * pi, store result in $f8
	s.s 	$f8, surfaceArea	#store final ans in $f8

#calculate volume of a sphere -> ((4.0 * pi) /3.0) * radius^3
	l.s	$f8, threePtZero 	#load threeptzero t0 $f8 (divisor)

	div.s	$f2,$f4,$f8	#divide 4.0*pi by value in $f8

	mul.s	$f10,$f2,$f2
	mul.s	$f10,$f10,$f6	#radius cubed

	mul.s	$f12,$f6,$f10	#
	s.s	$f12, volume	#store final answer

##printing surface arrea
	li $v0, 4	#syscall 4 ->print char from string
	la $a0, msg1	#load memory address of msg1
	syscall		#do it
	
	li $v0, 2	#syscall 2-> print fp
	l.s $f12, surfaceArea	#register f12 is used to print fp, load val to register
	syscall		#do it

##print volume
	li $v0, 4	#syscall 4 ->print char from string
	la $a0, msg2	#load memory address of msg2
	syscall		#do it

	li $v0, 2	#syscall 2-> print fp
	l.s $f12, volume #register f12 is used to print fp, load val to register	
	syscall		#do it

	li $v0, 4 	#syscall 4 -> print char from string
	la $a0, ftr 	#load memory address of ftr
	syscall		#do it

#-----
	li $v0, 10	#terminate
	syscall

