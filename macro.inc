GetDS macro
        mov ax, @data
        mov ds, ax
endm

print macro buffer
        lea  dx, buffer
        call showStr
endm


menuOption macro buffer
             call  cleanTerminal
             print buffer
             call  cleanTerminal
             jmp   displayMenu
endm


read macro buffer
       lea  bx, buffer
       call readStr
endm


ExitProcess macro x
              mov bx, x
              mov ah, 4ch
              int 21h
endm