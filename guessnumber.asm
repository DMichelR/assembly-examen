include macro.inc
.model small
    extrn showStr:near
    extrn cleanTerminal:near
.data
    magicNumber db "98"
    guessNumberStr db "Inster your Guess: (1-100)$", 10, 13
    strGoodBye       db "------ Congratulations you Guessed it - Comeback Soon! -----", 10, 13
                     db "$"
    failedGraterStr db "Wrong Guess, Your Number is Grater than the Magic Number", 10, 13
                     db "$"
    failedLowerStr  db "Wrong Guess, Your Number is Lower than the Magic Number", 10, 13
                     db "$"
    strInvalidOption db "Thats not a Valid Number"
    guess db 100 dup ('$')
.code
        public startGame1

        startGame1 PROC
            print guessNumberStr
            xor cx, cx
            call readGuess 
            lea bx, guess
            lea si, magicNumber
            call compareLenght
        startGame1 endp
        
        compareLenght PROC
            cmp cx, 2                       ; 2 is the length of the string
            jg  failGrater
            cmp cx, 2                       ; 2 is the length of the string
            jb  failLower
            jmp compare
            ret
        compareLenght endp

        compare PROC
            cmp [bx], [si]
            jb  failLower
            cmp [bx], [si]
            jg  failGrater
            inc bx
            inc si
            loop compare
            jmp done
            ret
        compare endp

        done PROC
                  call        cleanTerminal
                  print       strGoodBye
                  ExitProcess 0
                  ret
        done endp
        
        failGrater PROC
                call cleanTerminal
                print failedGraterStr
                ExitProcess 0
                ret
        failGrater endp

        failLower PROC
                call cleanTerminal
                print failedLowerStr
                ExitProcess 0
                ret
        failLower endp

        readGuess PROC
                cmp    cx, 3
                je      endProc
                lea     bx, guess
                call    readChar
                cmp   al, 13
                je      endProc
                cmp   al, 48
                jb      invalidOption
                cmp   al, 57
                jg      invalidOption
                mov   [bx], al
                inc     bx
                inc     cx
                jmp readGuess
        readGuess endp

        invalidOption proc
                  call        cleanTerminal
                  print       strInvalidOption
                  jmp         startGame1
        invalidOption endp

        endProc proc
            ret
        endProc endp
    end
