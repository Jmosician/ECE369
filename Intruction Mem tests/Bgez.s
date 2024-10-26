.text
    main:

    bgez $t0, Hi        #t0 > 0 -> Jump to Hi
    nop
    nop
    nop
    nop
    nop
    sub $t5, $t9, $s4   #t5 = 5

    Hi: 
    addi $t1, $t2, 10   #t1 = 20, PC Address should be 8