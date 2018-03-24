.name "Totoro"
.comment "totoro in wip"

init:
	sti		r1, %:fork_zone, %1
	sti		r1, %:live_loop, %1
	fork	%:main

main:
	st		r1, 6
	live	%1
	fork	%:top_protect
	zjmp	%:fork_zone

fork_zone:
	live	%1
	fork	%:live_loop
	ld		%0, r16
	zjmp	%:fork_zone

top_protect:
	live	%1
	ld		%178520064, r6	# 0a a4 00 00
	ld		%524545, r7		# 00 08 01 01
	ld		%655349, r8		# 00 09 ff f5
	sti		r8, %:init, %10
	sti		r1, %:init, %7
	sti		r7, %:init, %2
	sti		r6, %:init, %-2
	ld		%0, r16
	zjmp	%:top_protect

live_loop:
	live	%1
	fork	%:live_loop
	ld		%0, r16
	zjmp	%:live_loop
