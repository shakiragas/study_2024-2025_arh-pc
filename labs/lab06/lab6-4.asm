%include 'in_out.asm'
SECTION .data
msg: DB 'Введите значение переменной x: ',0
rem: DB 'Результат: ',0
SECTION .bss
x: RESB 80
SECTION .text
GLOBAL _start
_start:
mov eax, msg
call sprint
mov ecx, x
mov edx, 80
call sread
mov eax,x ; вызов подпрограммы преобразования
call atoi ; ASCII кода в число, `eax=x`
sub eax,1; eax = eax - 1 = x - 1
mov ebx,4
mul ebx ; eax = eax * 4 = 4 * (x - 1)
mov ebx,3
div ebx ; eax = eax / 3 = 4/3 * (x - 1)
add eax,5; eax = eax + 5 = 4/3 * (x-1) + 5
mov edi,eax ; запись результата вычисления в 'edi'
mov eax,rem ; вызов подпрограммы печати
call sprint ; сообщения 'Результат: '
mov eax,edi ; вызов подпрограммы печати значения
call iprintLF ; из 'edi' в виде символов
call quit
