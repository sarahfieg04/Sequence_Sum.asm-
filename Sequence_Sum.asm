.globl main
.data
msgNum: .asciiz "First number: "    # first number prompt
msgLen: .asciiz "Length of the sequence: "   # how many numbers
msgSum: .asciiz "Sum is: "      # final answer

.text
main:
    #get first number from user
    la $a0, msgNum  
    li $v0, 4       #print string   
    syscall         
    li $v0, 5       #get input    
    syscall
    move $s1, $v0   #save it
    
    #now get the length
    la $a0, msgLen
    li $v0, 4    
    syscall       
    li $v0, 5     
    syscall
    move $s2, $v0  #save length
    
    #do the adding stuff
    move $t0, $s1  #start number
    li $s0, 0      #sum = 0
    move $t1, $s2  #how many times to loop
    
loop:
    beq $t1, $zero, done    #check if done
    add $s0, $s0, $t0   #add number to sum
    addi $t0, $t0, 1    #next number
    addi $t1, $t1, -1   #decrease counter
    b loop

done:
    #print result
    la $a0, msgSum
    li $v0, 4
    syscall
    
    move $a0, $s0    #show answer
    li $v0, 1
    syscall
    
    #exit
    li $v0, 10
    syscall