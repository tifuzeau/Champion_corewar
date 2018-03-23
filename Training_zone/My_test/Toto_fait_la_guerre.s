.name "Toto"
.comment "Toto par a la guerre"


init:
	sti		r1, %:main, %1
	sti		r1, %:my_forck, %1
	sti		r1, %:soon, %1
	sti		r1, %:live, %1

main:
	live	%1
	fork	%:my_forck
	fork	%:soon
	ld		%0, r2
	zjmp	%:main

my_forck:
	live	%1
	fork	%:live
	ld		%0, r2
	zjmp	%:my_forck

soon:
	live	%1
	ld		%1500, r7
	fork	%:end
	ld		%0, r4
	zjmp	%:soon

live:
	live	%0
	ld		%0, r3
	zjmp	%:live

protect:
	ld		%16777216, r10
	sti		r5, %:end, r7
	ld		%1 , r5
	add		r5, r7, r7
	sti		r1, %:end, r7


# r5 - r7
end:
	live	%1
	ld		%16777216, r5
	sti		r5, %:end, r7
	ld		%1 , r5
	add		r5, r7, r7
	sti		r1, %:end, r7
	ld		%4, r5
	add		r5, r7, r7
	fork	%:end
	ld		%0, r5
	zjmp	%1500
