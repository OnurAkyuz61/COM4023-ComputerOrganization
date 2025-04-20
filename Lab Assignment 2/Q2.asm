.data
    prompt: .asciiz "Enter a number: "
    perfect_msg: .asciiz "This is a perfect number"
    not_perfect_msg: .asciiz "It is not a perfect number"

.text
.global main

main:
    # Print prompt
    li $v0, 4
    la $a0, prompt
    syscall
    
    # Read integer
    li $v0, 5
    syscall
    move $t0, $v0     # t0 = input number
    
    # Initialize sum and counter
    li $t1, 0        # t1 = sum of divisors
    li $t2, 1        # t2 = current divisor
    
find_divisors:
    beq $t2, $t0, check_perfect    # If divisor == number, exit loop
    div $t0, $t2                   # Divide number by current divisor
    mfhi $t3                       # Get remainder
    bnez $t3, next_divisor         # If not divisible, try next
    beq $t2, $t0, next_divisor     # Skip if divisor equals number
    add $t1, $t1, $t2              # Add divisor to sum
    
next_divisor:
    addi $t2, $t2, 1              # Increment divisor
    j find_divisors
    
check_perfect:
    beq $t0, $t1, is_perfect      # If sum equals number, it's perfect
    
    # Print not perfect message
    li $v0, 4
    la $a0, not_perfect_msg
    syscall
    j exit
    
is_perfect:
    # Print perfect message
    li $v0, 4
    la $a0, perfect_msg
    syscall
    
exit:
    li $v0, 10
    syscall