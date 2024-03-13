include macro.inc
.model small

        public readChar
        public readStr
        public showStr
        public cleanTerminal
.data
        strCleanTerminal db 27,"[H",27,"[2J"
                         db "$"
.code
        endProc proc
            ret
        endProc endp

        readChar proc
            mov  ah, 1
            int  21h
            ret
        readChar endp

        readStr proc
            call  readChar
            cmp   al, 13
            je    endProc
            mov   [bx], al
            inc   bx
            jmp   readStr
        readStr endp

        showStr proc
            mov  ah, 9
            int  21h
            ret
        showStr endp

        cleanTerminal proc
            print strCleanTerminal
        cleanTerminal endp
    end
    