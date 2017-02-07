# Translate the following C program to MIPS:
# lock(lk)
# shvar = max(shvar, x)
# unlock(lk)
# Comment1: the address of lk is stored in $a0
# Comment2: the address of shvar is stored in $a1
# Comment3: the address of x is stored in $a2

AGAIN:
addi	$t0,	$0,		1
ll		$t1,	0($a0)
sc		$t0,	0($a0)
beq		$t0,	$0,		AGAIN
add		$s4,	$0,		$t1
beq		$s4,	$0,		MAX
j		AGAIN
MAX:
lw 		$t2,	0($a1)		# shvar
lw		$t3,	0($a2)		# x
slt		$t4,	$t2,	$t3
beq		$t4,	$0,		MAX_SH
lw		$t3,	0($a1)
j		UNLOCK
MAX_SH:
lw		$t2,	0($a1)
UNLOCK:
sw		$0,		0($a0)
