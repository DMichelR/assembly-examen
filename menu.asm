include macro.inc
.model small
    extrn showStr:near
    extrn readStr:near
    extrn cleanTerminal:near
    extrn startGame1:near
.data
    option1str  db "--Guess my Number--", 10, 13
    option2str  db "--Guess my Number--", 10, 13
    option3str  db "--Guess my Number--", 10, 13
.code
        public option1
        public option2
        public option3


        option1 PROC
                          print  option1str
                          call startGame1
                          ret
        option1 endp
        
        option2 PROC
                          print  option2str
                          call startGame1
                          ret
        option2 endp

        option3 PROC
                          print  option3str
                          call startGame1
                          ret
        option3 endp
    end