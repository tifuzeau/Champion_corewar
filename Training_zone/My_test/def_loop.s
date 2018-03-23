.name	"def_loop"
.comment "write live r1, zjmp live"

init:
	sti		r1, %:live_loop, %1

init_wall:
	ld		%16777216, r6 # 01 00 00 00
	ld		%34144256, r7 # 02 09 00 00
	ld		%265, r8 # 00 00 01 09
	ld		%4294115328, r9 # ff f3 00 00
	ld		%0, r16

wall:
	st		r6, -46
	st		r1, -50
	st		r7, -51
	st		r8, -52
	st		r9, -53

live_loop:
	live	%1
	ld		%0, r16
	zjmp	%:live_loop
