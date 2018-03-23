.name "top_protect"
.comment "write ld $my_num, r1; live $my_num"

init:
	live	%1
	st		r1, -4

write:
	ld		%178520064, r6 # 0a a4 00 00
	ld		%524545, r7 # 00 08 01 01
	sti		r6, %:init, %-7
	sti		r7, %:init, %-3
	
	ld		%0, r16
	zjmp	%:init
