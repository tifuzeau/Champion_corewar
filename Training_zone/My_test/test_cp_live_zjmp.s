.name	"test_live_zjmp"
.comment "name"

# r2 r3 r4 r5 = arg
# r6 r7 r8 r9 = var
# r10 r11 = count
# r12 r13 = test pair inpaire
# r14 for totoro
# r15 ++ for cp
#r16 = trash

init:
	sti		r1, %:cp_live, %1
	sti		r1, %:cp_top, %1

init_cp:
	ld		%4, r14 # set 0100 for totoro
	ld		%1, r15
	ld		%-400, r2

cp_top:
	live	%1
	ld		%1, r6
	ld		%5, r7
	sub		r7, r2, r2
	add		r15, r6, r15
	and		r15, r6, r16
	zjmp	%:cp_zjmp
	ld		%0, r16
	zjmp	%:cp_live



# r2 = zone de copy, 5 need
# f_size = 
cp_live:
	live	%1
	ld		%16777216, r6
	sti		r6, %0, r2
	ld		%1, r6
	add		r6, r2, r2
	sti		r1, r2, %0
	ld		%0, r16
	zjmp	%:cp_top

# r2 = zone de copy, 12 need
cp_zjmp:
	ld		%4, r10
	ld		%344144256, r6
	ld		%265, r7
	ld		%4294377472, r8
	st		r6, r2
	add		r2, r10, r2
	st		r7, r2
	add		r2, r10, r2
	st		r8, r2
	add		r2, r10, r2
	ld		%0,r10
	zjmp	%:cp_top
