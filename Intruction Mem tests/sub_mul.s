.text
    main:
addi $t1, $t1, 10       #t1 = 10    PC
nop
nop
nop
nop
nop
add $t2, $t1, $t1      #t2 = 20
nop
nop
nop
nop
nop
sub $t3, $t2, $t1       #t3 = 10
nop
nop
nop
nop
nop
mul $t4, $t3, $t3       #$t4 = 100
nop
nop
nop
nop
nop
addi $t5, $zero, 7      #t5 = 7
nop
nop
nop
nop
nop
and $t6, $t1, $t5       #t6 = 2
nop
nop
nop
nop
nop
andi $t7, $t1, 31       #t7 = 10
nop
nop
nop
nop
nop
j main




2129000a ->	main:	addi	$t1, $t1, 10
00000000 ->		nop
00000000 ->		nop
00000000 ->		nop
00000000 ->		nop
00000000 ->		nop
01295020 ->		add	$t2, $t1, $t1
00000000 ->		nop
00000000 ->		nop
00000000 ->		nop
00000000 ->		nop
00000000 ->		nop
01495822 ->		sub	$t3, $t2, $t1
00000000 ->		nop
00000000 ->		nop
00000000 ->		nop
00000000 ->		nop
00000000 ->		nop
716b6002 ->		mul	$t4, $t3, $t3
00000000 ->		nop
00000000 ->		nop
00000000 ->		nop
00000000 ->		nop
00000000 ->		nop
200d0007 ->		addi	$t5, $zero, 7
00000000 ->		nop
00000000 ->		nop
00000000 ->		nop
00000000 ->		nop
00000000 ->		nop
012d7024 ->		and	$t6, $t1, $t5
00000000 ->		nop
00000000 ->		nop
00000000 ->		nop
00000000 ->		nop
00000000 ->		nop
312f001f ->		andi	$t7, $t1, 31
00000000 ->		nop
00000000 ->		nop
00000000 ->		nop
00000000 ->		nop
00000000 ->		nop
08000000


