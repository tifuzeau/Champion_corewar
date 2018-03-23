.name "PC_gun"
.comment "I gen many process can you resist ?"


init:
	sti		r1, %:main_loop, %1
	sti		r1, %:gen_life, %1
	sti		r1, %:gen_gun, %1
	sti		r1, %:live_loop, %1
	ld		%16777216, r2	# 01 00 00 00
	ld		%57672192, r5	# 03 70 02 00
	ld		%839086081, r6	# 32 03 70 01
	ld		%3014656, r7	# 00 2e 00 00

main_loop:
	live	%1
	fork	%:gen_life
	fork	%:gen_gun
	ld		%0, r16
	zjmp	%:main_loop

gen_life:
	live	%1
	fork	%:live_loop
	ld		%0, r16
	zjmp	%:gen_life

gen_gun:
	live	%1
	fork	%:gun
	ld		%0, r16
	zjmp	%:gen_gun

live_loop:
	live	%0
	ld		%0, r16
	zjmp	%:live_loop

gun:
	live	%1
	fork	%:ball
	ld		%0 , r16
	zjmp	%:gun

ball:
	st		r5, 160
	st		r6, 159
	st		r7, 158
	ld		%0, r16
	zjmp	%100
