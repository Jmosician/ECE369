.text
    main:

    addi $t1, $zero, -5   #t1 = 5
    nop
    nop
    nop
    nop
    nop
    bgez $t1, positive  #branch
    nop
    nop
    nop
    nop
    nop
    addi $t1, $zero, 100     #should not branch
    nop
    nop
    nop
    nop
    nop

    positive:
    addi $t2, $zero, 0
    nop
    nop
    nop
    nop
    nop
    bgez $t2, hello
    nop
    nop
    nop
    nop
    nop

    hello:
    addi $t3, $zero, 50
    nop
    nop
    nop
    nop
    nop