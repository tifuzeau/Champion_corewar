.name	"Totoro"
.comment "totoro en dev"

# r2 r3 r4 r5 = arg
# r6 r7 r8 r9 = var
# r10 r11 = count
# r12 r13 = test pair inpaire
# r14 for totoro
# r15 ++ for cp
#r16 = trash

init:
	sti		r1, %:totoro, %1
	sti		r1, %:loop_live, %1
	sti		r1, %:cp_live, %1
	sti		r1, %:corupt, %1
	ld		%2, r12
	ld		%4, r13
	ld		%1, r14
	ld		%-500, r2

totoro:
	live	%1
	and		r12, r14, r16
	zjmp	%:init_top
	fork	%:init_top
	and		r12, r14, r16
	zjmp	%:init_bot
	fork	%:init_bot
	fork	%:loop_live

loop_live:
	live	%1
	ld		%0, r16
	zjmp	%:loop_live

init_bot:
	ld		%2, r14 # set 0100 for totoro
	ld		%17, r6 # size_cp*

cp_bot:
	ld		%1, r6
	add		r15, r6, r15
	and		r15, r6, r16
	zjmp	%:cp_zjmp
	ld		%0, r16
	zjmp	%:cp_live


init_top:
	ld		%4, r14 # set 0100 for totoro
	ld		%-17, r6 # size_cp*

cp_top:
	ld		%1, r6
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
	zjmp	%:totoro

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
	zjmp	%:totoro

corupt:
	live	%1
	ld		%0, r16
	zjmp	%300
