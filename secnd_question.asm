include macro.inc
.model small
    extrn cleanTerminal:near
    extrn showStr:near
    extrn readStr:near
    extrn option1:near
    extrn option2:near
    extrn option3:near
.stack 100h
.data
    mainMenu         db "1. Game Guess my Number ", 10, 13
                     db "2. Game Hangman", 10, 13
                     db "3. About Programmers", 10, 13
                     db "0. Exit", 10, 13
                     db "Choose an Option: $", 10, 13
                     db "$"
    option           db 100 dup ('$')
    strInvalidOption db "Thats not a Valid Number"
    strGoodBye       db "------ Good bye - Comeback Soon! -----", 10, 13
.code
    main:         
                  GetDS
                  call        displayMenu
                  ExitProcess 0

displayMenu PROC
                  call        cleanTerminal
                  print       mainMenu
                  read        option
                  lea         bx, option
                  cmp         byte ptr [bx], 48
                  jb          invalidOption
                  cmp         byte ptr [bx], 52
                  ja          invalidOption
                  cmp         byte ptr [bx], 48
                  je          done
                  cmp         byte ptr [bx], 49
                  je          option1
                  cmp         byte ptr [bx], 50
                  je          option2
                  cmp         byte ptr [bx], 51
                  je          option3

displayMenu endp
done proc
                  call        cleanTerminal
                  print       strGoodBye
                  ExitProcess 0
                  ret
done endp
invalidOption proc
                  call        cleanTerminal
                  print       strInvalidOption
                  jmp         displayMenu
invalidOption endp

    end main