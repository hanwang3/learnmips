add		$a0,	$0,		$0
addi	$a0,	$a0,	0x10010000

Main:
addi	$sp,	$sp,	-4
sw		$ra,	0($sp)
addi	$t0,	$a0,	0		# address copy to $t0
addi	$t6,	$0,		0x30	# $t6 = '0'
addi	$t7,	$0,		0x39	# $t7 = '9'
addi	$v0,	$v0,	0

Loop:
lb		$t1,	0($t0)
slt		$t2,	$t1,	$t6
bne		$t2,	$0,		Test	# $t1 < '0',change to Done
slt		$t2,	$t7,	$t1
bne		$t2,	$0,		Test	# $t1 > '9',change to Done
sub		$t1,	$t1,	$t6
addi	$t3,	$0,		10
mul		$v0,	$v0,	$t3
add		$v0,	$v0,	$t1
addi	$t0,	$t0,	1
j		Loop

Test:
beq		$t1,	$0,		Done
addi	$v0,	$0,		-1

Done:
lw		$ra,	0($sp)
addi	$sp,	$sp,	4
jr		$ra
