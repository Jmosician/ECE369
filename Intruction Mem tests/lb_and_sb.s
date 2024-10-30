.text
main:  
    addi $t1, $zero, 0x00001234         # WD = 00001234
    nop
    nop
    nop
    nop
    nop
    addi $t4, $zero, 0x00004321        # WD = 00001234
    nop
    nop
    nop
    nop
    nop
    addi $t2, $zero, 100
    nop
    nop
    nop
    nop
    nop
    sb $t1, 0($t2)                    #    34
    nop
    nop
    nop
    nop
    nop
    sh      $t1, 1($t2)               #      12
    nop
    nop
    nop
    nop
    nop
    lb      $t3, 0($t2)               #       34
    nop
    nop
    nop
    nop
    nop
    lh      $t3, 1($t2)               #        1234
    nop
    nop
    nop
    nop
    nop
    sb $t4, 3($t2)                    #    99
    nop
    nop
    nop
    nop
    nop
    lb $t5, 3($t2)                    #    99
    nop
    nop
    nop
    nop
    nop


