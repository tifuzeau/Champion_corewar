.name "if"
.comment "how to if"

inti:
	sti		r1, %:if, %1
	sti		r1, %:loop_1, %1
	sti		r1, %:loop_2, %1
	ld		%2, r2 # r2 = 00 00 00 10
	ld		%0, r3 # carry = 1
	zjmp	%:if


#if sur r2
# si 01 & 00 carry = 1
# si 01 & 01 carry = 0

if:
	live	%1
	ld		%0, r6
	and		r2, r6, r16
	zjmp	%:loop_1
	ld		%2, r6
	and		r2, r6, r16
	zjmp	%:loop_2

void_1:
	live	%1
	live	%1
	live	%1
	live	%1
	ld		%0, r16
	zjmp	%:void_1

loop_1:
	live	%333
	ld		%0, r16
	zjmp	%:loop_1

void_2:
	live	%2
	live	%2
	live	%2
	live	%2
	ld		%0, r16
	zjmp	%:void_2

loop_2:
	live	%444
	ld		%0, r16
	zjmp	%:loop_2
