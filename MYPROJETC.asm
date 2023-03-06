 
.MODEL SMALL
.DATA

msg db '====================+ WELCOME TO OUR PROJECT +==================== $'
msg1 db 10,13,'************************+ BMI CALCULATOR +******************** $' 
msg2 DB 10,13,' Input your height in cm:$'
msg3 DB 10,13,' Input your weight in km:$' 
MSG4 DB 10,13,' "Your weight is:over weight"$'
MSG5 DB 10,13,' "Your weight is:perfect"$'
MSG6 DB 10,13,' "Your weight is:under weight"$'
MSG7 DB 10,13,' "Press 1 to see the instruction for gain the perfect weight if you are under-weight "$'
MSG8 DB 10,13,' "Press 2 to see the instruction for gain the perfect weight if you are over-weight " $'
MSK1 DB 10,13,' " 1.Eat more and sleep 8 hours a day."$'
MSK2 DB 10,13,' " 2.Absorb high calorie food (potato, brown rice, chicken breast, check peas, almond, sweet potato etc.)"$'
MSK3 DB 10,13,' " 3.Drink at least 3L water per day."$'
MSK4 DB 10,13,' " 4.Eat vegetables and 1 glass of milk and 1 whole egg each day."$'
  
MSK5 DB 10,13,' " 1.Try to follow a low calorie healthy diet."$'
MSK6 DB 10,13,' " 2.Eat high protein, vegetables and avoid fast food."$'
MSK7 DB 10,13,' " 3.Do some workout for weight lose (walking, running, crunching, ropping )."$' 
  
MSN DB 10,13,' Congratulation..! Keep it up.$'
  
MSM1 DB 10,13,' " Press 1 to Recalculate."$'
MSM2 DB 10,13,' " Press 2 to EXIT."$' 
MSM3 DB 10,13,'          ********THANK YOU********$'
MSM4 DB 10,13,' " Press any key to continue...."$'
N dw ? 
M dw ?  
T DW 100





.CODE

MAIN PROC                                                              

MOV AX, @DATA                                                       

MOV DS, AX

LEA DX, msg                                                     

MOV AH, 09H                                                             

INT 21H                                                                         

LEA DX, msg1                                                       

MOV AH, 09H                                                          

INT 21H                                                                         
                                                                                                                                                                        ; dos interrupt function
jmp START

MOV AX, 4C00H                                                   

INT 21H 


 

START: 

LEA DX,msg2 
MOV AH,09H
int 21h  
MOV AX,0
MOV BX,0
MOV CX,0
MOV DX,0 
mov N,0  
MOV BL,10  
jmp INPUT1


  
 

INPUT1:
MOV AH,1
INT 21H  

CMP AL,13
JE PRINT 
sub al,30h
mov ah,0
mov cx,ax
mov ax,N  
MUL BL
add ax,cx
mov N,ax
jmp INPUT1



PRINT:    
LEA DX,msg3
MOV AH,9
INT 21H 
MOV AX,0
MOV BX,0
MOV CX,0
MOV DX,0 
mov M,0  
MOV BL,10 
jmp INPUT2




INPUT2:
mov AH,1
int 21h

cmp al,13
JE CONVERT
SUB AL,30H 
MOV AH,0
MOV CX,AX
MOV AX,M 
MUL BL
ADD AX,CX 
MOV M,AX
JMP INPUT2

 
CONVERT:
MOV AX,0
MOV BX,0
MOV CX,0
MOV DX,0 
MOV AX,M
mov bx,t
mul bx
mov bx,N
div bx 

cmp ax,28
JA OVER

cmp ax,24
JB UNDER

jmp PERFECT



OVER:
MOV AX,0
MOV BX,0
MOV CX,0
MOV DX,0 

LEA DX,MSG4
MOV AH,9
INT 21H
JMP PRESS


UNDER:
MOV AX,0
MOV BX,0
MOV CX,0
MOV DX,0 

LEA DX,MSG6
MOV AH,9
INT 21H
JMP PRESS


PERFECT:
MOV AX,0
MOV BX,0
MOV CX,0
MOV DX,0 

LEA DX,MSG5
MOV AH,9
INT 21H
LEA DX,MSN
MOV AH,9
INT 21H
JMP EXIT


PRESS: 
LEA DX,MSG7
MOV AH,9
INT 21H  

LEA DX,MSG8
MOV AH,9
INT 21H 

MOV AX,0
MOV AH,1
INT 21H

CMP AL,'1'
JE P1

CMP AL,'2'
JE P2

 
P1:
LEA DX,MSK1
MOV AH,9 
INT 21H

LEA DX,MSK2
MOV AH,9
INT 21H
    
LEA DX,MSK3
MOV AH,9
INT 21H
    
LEA DX,MSK4
MOV AH,9
INT 21H
    
JMP EXIT
    
P2:
LEA DX,MSK5
MOV AH,9
INT 21H
    
LEA DX,MSK6
MOV AH,9
INT 21H
    
LEA DX,MSK7
MOV AH,9
INT 21H


EXIT: 
MOV AX,0
LEA DX,MSM4
MOV AH,9
INT 21H   
    
MOV AH,1
INT 21H 

MOV AX,0

LEA DX,MSM1
MOV AH,9
INT 21H
    
LEA DX,MSM2
MOV AH,9
INT 21H 

MOV AX,0   
MOV AH,1
INT 21H
    
CMP AL,'1'
JE START
    
JMP EXIT2


EXIT2:
LEA DX,MSM3
MOV AH,9
INT 21H

MOV AH,4CH
INT 21H

MAIN ENDP

END MAIN                                                  



