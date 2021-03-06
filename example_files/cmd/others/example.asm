global _start
 ;  Guess the number: example taken from http://www.rosettacode.org/
section .data
 
    rand dd 0
    guess dd 0
    msg1 db "Guess my number (1-10)", 10
    len1 equ $ - msg1
    msg2 db "Wrong, try again!", 10
    len2 equ $ - msg2
    msg3 db "Well guessed!", 10
    len3 equ $ - msg3
 
section .text
 
    _start:
        ; random number using time
        mov eax, 13
        mov ebx, rand
        int 80h
        mov eax, [ebx]
        mov ebx, 10
        xor edx, edx
        div ebx
        inc edx
        mov [rand], edx
 
        ; print msg1
        mov eax, 4
        mov ebx, 1
        mov ecx, msg1
        mov edx, len1
        int 80h
 
    input:
        ; get input
        mov eax, 3
        xor ebx, ebx
        mov ecx, msg1
        mov edx, 1
        int 80h
        mov al, [ecx]
        cmp al, 48
        jl check
        cmp al, 57
        jg check
        ; if number
        sub al, 48
        xchg eax, [guess]
        mov ebx, 10
        mul ebx
        add [guess], eax
        jmp input
 
    check:
        ; else check number
        mov eax, 4
        inc ebx
        mov ecx, [guess]
        cmp ecx, [rand]
        je done
        ; if not equal
        mov ecx, msg2
        mov edx, len2
        mov dword [guess], 0
        int 80h
        jmp input
 
    done:
        ; well guessed
        mov ecx, msg3
        mov edx, len3
        int 80h
        ; exit
        mov eax, 1
        xor    ebx, ebx
        int 80h