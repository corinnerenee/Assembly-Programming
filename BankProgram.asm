.data
startMsg:	.ascii "---> Start of Bank Program <---\n"			#System.out.println(""---> Start of Bank Program <---\n")
		.ascii "Author information: CS 220 | #02 | Corinne Bond\n"	#System.out.println("Author information: CS 220 | #02 | Corinne Bond\n")
		.ascii "--->  Welcome to the Interest Calculator! <--- \n"	#System.out.println(">>> Welcome to Interest Calculator! <<<<\n
		.ascii "               1%: saving years < 5 years\n" 		# cont.. 1%: saving years < 5 years\n
		.asciiz "               5%: saving years >= 5 years\n"		# cont.. 5%: saving years >= 5 years\n
promptMsg1: 	.asciiz "==> Enter the principal:$ \n"				#System.out.println(""==> Enter the principal:$ \n")
promptMsg2: 	.asciiz "==> Enter the years of savings: \n"			#System.out.println("==> Enter the years of savings: \n")
resultLine:	.ascii	"----------------> Result <----------------"		#System.out.println("----------------> Result <----------------")
		.asciiz "\n---> Your principal is: "				#System.out.println("\n---> Your principal is: ")
resultLine2: 	.asciiz "\n---> Your interest rate is: "			#System.out.println("\n *** Interest rate is:"
hdr:		.asciiz "\nYear "						#System.out.println("\nYear")
hdr1:		.asciiz ": your balance is $"					#System.out.println(": your balance is $")
hdr2:		.asciiz "\n---> Your balance after "				#System.outprintln("\n---> Your balance after ")
hdr3:		.asciiz " years: $ "						#System.out.println(" years: $ ")
finalLine: 	.asciiz "\n----------------> End of Interest Calculator <---------------- "	#System.out.println("\n----------------> End of Interest Calculator <---------------- ")
newLine:	.asciiz "\n"							#System.out.println("\n")
principal: 	.float 0.0	#32bits, intial val of 0			#float principal = 0.0
years: 		.word 0 	#32bits, intial val of 0			#int years = 0
testVal:	.word 5								#int testVal = 0
rate1:		.float 0.01							#float rate1 = .01	
rate2:		.float 0.05							#float rate2 = .05
interestRate:	.float 0.0							#float interestRate = 0.0
balance: 	.float 0.0							#float balance = 0.0
#------------------------------------
#text/code section
.text
.globl main #entrance of program
.ent main

main:
	la $a0, startMsg 	#load address of start msg
	li $v0, 4		#syscall 4 -> print char from string
	syscall			#do it

	la $a0, promptMsg1	#load memory address of promptMsg1
	li $v0, 4		#syscall 4 -> print char from string
	syscall
	
	li $v0, 6		#syscall 6 -> read floating point from kb -> float principal = sc.nextFloat();
	syscall			#do it
	s.s $f0, principal	#save input into principal variable

	la $a0, promptMsg2	#load memory address of promptMsg2
	li $v0, 4		#syscall 4 -> print char from string
	syscall			#do it
	
	li $v0, 5		#syscall 5 -> read int from kb	-> int years = sc.nextInt();
	syscall			#do it
	sw $v0, years		#save input into years variable

	la $a0, resultLine 	#load memory address of resultLine
	li $v0, 4		#syscall 4 -> print char from string
	syscall			#do it

	l.s $f12, principal	#load principal val into float register to be printed
	li $v0, 2		#syscall 2 -> print float from register
	syscall

	la $a0, resultLine2	#load memory address of resultLine2
	li $v0, 4		#syscall 4 -> print char from string
	syscall			#do it

	#choose interest rate based on given variables
	lw $t1, years		#load word from years into register
	lw $t2, testVal		#load word from testVal into register
	blt $t1, $t2, lessThan	#if t1 < t2 ->  if (yearsOfSaving < 5) {return 0.01F;}
	l.s $f1, rate2		#load 5% interest rate into register -> else {return 0.05F;}
	s.s $f1, interestRate	#save floating point to interest rate variable
	
	#print interest rate
	l.s $f12, interestRate	#load floating point to register to be printed
	li $v0, 2		#syscall 2 -> print float from register
	syscall			#do it
	
	li $t3, 1		#syscall 1 -> print int
	
	while:			#start of  1st while loop (x>=5) 
	bgt $t3, $t1, exit	#exit if t3 > t1 -> for (int i = 1; i <= yearsOfSaving; i++)
	la $a0,hdr		#load memory address of hdr0
	li $v0, 4		#syscall 4 -> print char from string
	syscall			#do it
		
	move $a0, $t3		#move from t3 to a0
	li $v0, 1		#syscall 1 -> print int
	syscall			#do it

	la $a0, hdr1		#load memory address of hdr1
	li $v0, 4		#syscall 4 -> print char from string
	syscall			#do it

	l.s $f3, principal	#load floating point to register f3
	l.s $f4, interestRate	#load floating point to register f4
	mul.s $f2,$f3,$f4	#calculate interest, save into f2
	add.s $f5,$f3,$f2	#add interest to principa;. save into f5 ->  -> balance *= (1 + interest);		
	s.s $f5, principal	#update principal with value in f5
	s.s $f5, balance	#update balance with value in f5 -> float balance = principal;
	l.s $f12, balance	#load floating point to register to be printed
	li $v0, 2		#syscall 2 -> print float from register
	syscall 		#do it
	
	addi $t3, $t3, 1	#add 1 to value in register t3, update register value -> year++;
	j while			#repeat while

	exit:	
	la $a0, hdr2		#load memory address of hdr2	
	li $v0, 4		#syscall 4 -> print char from string -> 
	syscall			#do it
	
	lw $a0, years		#load years variable into register a0
	li $v0, 1		#syscall 1 -> print int
	syscall			#do it
		
	la $a0, hdr3		#load memory address of hdr3
	li $v0, 4		#syscall 1 -> print int
	syscall			#do it
	
	l.s $f12, balance	#load floating point to be printed
	li $v0, 2		#syscall 2 -> print floating point
	syscall			#do it

	la $a0, finalLine	#load memory address of finalLine
	li $v0, 4		#syscall 4 -> print char from string
	syscall			#do it

	li $v0, 10		#syscall 10 -> exit -> System.exit(0);
	syscall			#do it

	lessThan:		#less than branch
	l.s $f1, rate1		#load storage 
	s.s $f1, interestRate	#save variable to interest rate
	
	#print interest rate
	l.s $f12, interestRate	#load floating point to register to be printed
	li $v0, 2		#syscall 2 -> print float from register
	syscall			#do it
	
	li $t3, 1 		#syscall 1 -> print int
	
	while2:			#start of 2nd loop (x < 5)
	bgt $t3, $t1, exit	# if t3 > t4 exit -> -> for (int i = 1; i <= yearsOfSaving; i++)
	la $a0, hdr		#load memory address of hdr
	li $v0, 4		#syscall 4 -> print char from string
	syscall			#do it
	
	move $a0, $t3		#move from t3 to a0
	li $v0, 1		#syscall 1 -> print int
	syscall			#do it

	la $a0, hdr1		#load memory address of hdr1
	li $v0, 4		#syscall 4 -> print char from string
	syscall			#do it
	
	l.s $f3, principal	#load principal to f3
	l.s $f4, interestRate	#load interestRate to f4
	mul.s $f2, $f3,$f4	#calculate interest and save to f2	
	add.s $f5, $f3,$f2	#add interest back to principal and store in f5 -> balance *= (1 + interest);
	s.s $f5, principal	#update principal value
	s.s $f5, balance	#update balance
	l.s $f12, balance	#load value of balance to be printed
	li $v0, 2		#syscall 2 -> print floating point
	syscall 		#do it
	
	addi $t3, $t3, 1	#add 1 to t3, update value in same register
	j while2		
	

