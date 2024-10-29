.text
    main:
# Initialize values
    addi $t0, $zero, 10    # $t0 = 10
    nop
    nop
    nop
    nop
    nop
    addi $t1, $zero, 5     # $t1 = 5

# Store the return address in $ra and jump to the subroutine
    jal subroutine

# Main code after return from jr
    add $t2, $t0, $t1      # $t2 = 20 (10 + 10) if jr worked correctly
    nop
    nop
    nop
    nop
    nop

# Subroutine definition
subroutine:
    add $t1, $t1, $t1      # Just a dummy operation (multiply $t1 by 2)
    nop
    nop
    nop
    nop
    nop
    jr $ra                 # Return to the instruction after jal
    nop
    nop
    nop
    nop
    nop


