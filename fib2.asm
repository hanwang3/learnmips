addi	$a0,	$zero,	3	

fib:
addi	$sp,	$sp,	-12
sw		$ra,	0($sp)
sw		$s0,	4($sp)
sw		$a0,	8($sp)

bne		$a0,	$0,		test
add		$v0,	$0,		$0
j		rtn

test:
addi	$t0,	$0,		1
bne		$a0,	$t0,	gen
addi	$v0,	$0,		1
j		rtn

gen:
addi	$a0,	$a0,	-1
jal		fib
add		$s0,	$v0,	$0
addi	$a0,	$a0,	-1
jal		fib
add		$v0,	$v0,	$s0

rtn:
lw		$ra,	0($sp)
lw		$s0,	4($sp)
lw		$a0,	8($sp)
addi	$sp,	$sp,	12
jr		$ra