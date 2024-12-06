%include 'in_out.asm'
SECTION .data
msg_func db "Функция: f(x) = 2(𝑥 − 1)",0
msg_res db "Результат: ",0
SECTION .text
global _start
_start:
mov eax, msg_func
call sprintLF
pop ecx
pop edx
sub ecx,1
mov esi, 0
next:
cmp ecx,0h
jz _end
pop eax
call atoi
sub eax, 1
mov ebx, 2
mul ebx
add esi, eax
loop next
_end:
mov eax, msg_res
call sprint
mov eax, esi
call iprintLF
call quit
