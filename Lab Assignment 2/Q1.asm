.data
    array: .word 90, 68, -92, 46, 300, -54, -19, 431, -5, 12    # Define the array
    max_msg: .asciiz "\nMaximum value: "
    min_msg: .asciiz "\nMinimum value: "

.text
.global main

main:
    # Initialize registers
    la $t0, array          # Load array address
    lw $t1, ($t0)         # Load first element as initial max and min
    move $t2, $t1         # t2 = max
    move $t3, $t1         # t3 = min
    li $t4, 1             # Counter
    li $t5, 10            # Array size

loop:
    beq $t4, $t5, print   # If counter == size, exit loop
    addi $t0, $t0, 4      # Move to next element
    lw $t1, ($t0)         # Load next element
    
    # Check for maximum
    bgt $t2, $t1, check_min  # If current max > element, skip
    move $t2, $t1            # Update max
    
check_min:
    blt $t3, $t1, continue  # If current min < element, skip
    move $t3, $t1            # Update min
    
continue:
    addi $t4, $t4, 1      # Increment counter
    j loop

print:
    # Print minimum
    li $v0, 4             # Print string syscall
    la $a0, min_msg
    syscall
    
    li $v0, 1             # Print integer syscall
    move $a0, $t3         # Load min value
    syscall
    
    # Print maximum
    li $v0, 4             # Print string syscall
    la $a0, max_msg
    syscall
    
    li $v0, 1             # Print integer syscall
    move $a0, $t2         # Load max value
    syscall
    
    # Exit program
    li $v0, 10
    syscall