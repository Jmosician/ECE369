.text
    main:
addi $t0, $zero, 6               #t0=6
nop
nop
nop
nop
nop
addi $t1, $zero, 6              #t1=6,display 24,6
nop
nop
nop
nop
nop
bne $t1, $t0, branchTaken
nop
nop
nop
nop
nop
add $t3, $t1, $t0               #t3 = 12 
nop
nop
nop
nop
nop


branchTaken:
nop
nop
nop
nop
nop
addi $t4, $zero, 100            #t4 = 100





20080006 ->	main:		addi	$t0, $zero, 6
00000000 ->			nop
00000000 ->			nop
00000000 ->			nop
00000000 ->			nop
00000000 ->			nop
20090006 ->			addi	$t1, $zero, 6
00000000 ->			nop
00000000 ->			nop
00000000 ->			nop
00000000 ->			nop
00000000 ->			nop
1128000b ->			beq	$t1, $t0, branchTaken
00000000 ->			nop
00000000 ->			nop
00000000 ->			nop
00000000 ->			nop
00000000 ->			nop
01285820 ->			add	$t3, $t1, $t0  
00000000 ->			nop
00000000 ->			nop
00000000 ->			nop
00000000 ->			nop
00000000 ->			nop
00000000 ->	branchTaken:	nop
00000000 ->			nop
00000000 ->			nop
00000000 ->			nop
00000000 ->			nop
200c0064 ->			addi	$t4, $zero, 100
