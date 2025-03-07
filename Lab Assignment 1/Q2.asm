.data
    prompt: .asciiz "Enter your favorite lesson: "
    buffer: .space 100  # Buffer to store user input
    output: .asciiz "\nYour favorite lesson is: "

.text
.globl main

main:
    # Print prompt
    li $v0, 4           # Load syscall number for printing string
    la $a0, prompt      # Load address of prompt
    syscall             # Execute syscall to print

    # Read user input
    li $v0, 8           # Load syscall number for reading string
    la $a0, buffer      # Load buffer address
    li $a1, 100         # Maximum number of characters to read
    syscall             # Execute syscall to read string

    # Print output message
    li $v0, 4           # Load syscall number for printing string
    la $a0, output      # Load address of output message
    syscall             # Execute syscall to print

    # Print user input
    li $v0, 4           # Load syscall number for printing string
    la $a0, buffer      # Load address of buffer containing user input
    syscall             # Execute syscall to print

    # Exit program
    li $v0, 10          # Load syscall number for exit
    syscall             # Execute syscall to exit
