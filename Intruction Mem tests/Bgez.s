.text
    main:

    bgez $t0, Hi        #t0 > 0 -> Jump to Hi
    nop
    nop
    nop
    nop
    nop
    add $t5, $t2, $s4   #t5 = 30

    Hi: 
    addi $t1, $t2, 10   #t1 = 20, PC Address should be 8