.data
    pi_msg: .asciiz "3.14"  # Define the pi value as a string

.text
.globl main

main:
    # Print pi value
    li $v0, 4           # Load syscall number for printing string
    la $a0, pi_msg      # Load address of pi_msg
    syscall             # Execute syscall to print

    # Exit program
    li $v0, 10          # Load syscall number for exit
    syscall             # Execute syscall to exit
