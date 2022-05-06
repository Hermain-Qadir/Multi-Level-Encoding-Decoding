Title (MultiLevlel Enryption)                                                       
INCLUDE Irvine32.inc                                                                    ;Group Members:
                                                                                        ;1. Hermain Qadir 19K-1517
                                                                                        ;2. Ahmed Raza 19K-0134
                                                                                        ;3. Mohammad Areeb 19K-0360                                                                                    
INCLUDE macros.inc                                                                      
                                                                                        
mReadStr MACRO varName                                                                  
push ecx
push edx
mov edx,OFFSET varName
mov ecx,(SIZEOF varName) - 1
call ReadString
pop edx
pop ecx
ENDM


msetupx macro one:REQ,two:REQ
push eax
mov eax, yellow + (blue * 16)
call SetTextColor
;call GetTextColor
pop eax
endm

mgotox macro one:REQ,two:REQ
push edx
mov dh, two
mov dl, one
call gotoxy
;call GetTextColor
pop eax
endm



Mspacing Macro
call crlf
call crlf
ENDM

mwaits Macro
push eax
push ecx

mov eax, 300
mov ecx,5
L1:
call clrscr
Mspacing
mWrite<"  ------------------------------LOADING-------  ">                   
call delay
loop L1

pop ecx
pop eax
endm

Mread_f Macro fileName          ;macro to read file
LOCAL string, outfile , string_size ,string_taken, count 


.data
outfile dword ?
;fileName        BYTE  "DataIn.txt",0
string_size     byte    100
string_taken    BYTE    100 DUP(?)
fileHandle      HANDLE  ?
count           byte    ?
choice     BYTE 'Enter ( .txt for text file)==>MOST PREFERABLE (.docx for word file) (.ppt for powerpoint file) ',0


.code

push edx
push eax
push ecx
push esi


call crlf
mov edx, offset choice
call writeString
call crlf
 mWrite<"Enter the file to be Read">
call crlf
mReadStr fileName





; Open the file for input
   mov EDX,OFFSET fileName
   call openInputFile
   mov fileHandle,eax

;Check For errors.
    cmp eax,INVALID_HANDLE_VALUE      ;error opening file?
    jne file_ok
    mWrite <"Cannot open file.",0dh,0ah>
    jmp quit                                                                                             ;----------------------- FILE READ--------------
                                                                                                         ;----------------------- FILE READ--------------
file_ok:                                                                                                 ;----------------------- FILE READ--------------
; Read the file into a buffer.                                                                           ;----------------------- FILE READ--------------
    mov ecx,0                                                                                            ;----------------------- FILE READ--------------
    mov EDX,OFFSET string_taken                                                                          ;----------------------- FILE READ--------------
   mov ECX, sizeof string_taken                                                                          ;----------------------- FILE READ--------------
   call ReadFromFile                                                                                     ;----------------------- FILE READ--------------
   call WriteWindowsMsg                                                                                  ;----------------------- FILE READ--------------
                                                                                                         ;----------------------- FILE READ--------------
; Display the buffer                                                                                     ;----------------------- FILE READ--------------
   mWrite <"Buffer:",0dh,0ah,0dh,0ah>            ;display the buffer                                     ;----------------------- FILE READ--------------
   mov esi,offset string_taken                                                                           ;----------------------- FILE READ--------------
   mov ECX, sizeof string_taken                                                                          ;----------------------- FILE READ--------------
                                                                                                         ;----------------------- FILE READ--------------
  mWrite<"Your Message is: ">
  Mspacing
  
  Loop1:                                                                                                 ;----------------------- FILE READ--------------
    mov eax,0                                                                                            ;----------------------- FILE READ--------------
    mov eax,[esi]                                                                                        ;----------------------- FILE READ--------------
    call Writechar                                                                                       ;----------------------- FILE READ--------------
    inc esi                                                                                              ;----------------------- FILE READ--------------
  loop Loop1                                                                                             ;----------------------- FILE READ--------------
                                                                                                         ;----------------------- FILE READ--------------
    call crlf                                                                                            ;----------------------- FILE READ--------------
                                                                                                         ;----------------------- FILE READ--------------
; close file                                                                                             ;----------------------- FILE READ--------------
    mov eax,fileHandle                                                                                   ;----------------------- FILE READ--------------
    call CloseFile                                                                                       ;----------------------- FILE READ--------------
                                                                                                         ;----------------------- FILE READ--------------
quit:                                                                                                    ;----------------------- FILE READ--------------
pop edx                                                                                                  ;----------------------- FILE READ--------------
pop eax                                                                                                  ;----------------------- FILE READ--------------
pop ecx                                                                                                  ;----------------------- FILE READ--------------
pop esi                                                                                                  ;----------------------- FILE READ--------------
                                                                                                         ;----------------------- FILE READ--------------
ENDM                                                                                                     ;----------------------- FILE READ--------------





Mread_k Macro fileName          ;macro to read file
LOCAL string, outfile , string_size ,string_taken, count 


.data
msg byte "  ",0
outfile dword ?
;fileName        BYTE  "DataIn.txt",0
string_size     byte    100
string_taken    BYTE    100 DUP(?)
fileHandle      HANDLE  ?
count           byte    ?
choice     BYTE 'Enter ( .txt for text file)==>MOST PREFERABLE (.docx for word file) (.ppt for powerpoint file) ',0


.code

push edx
push eax
push ecx
push esi


call crlf
mov edx, offset choice
call writeString
call crlf
 mWrite<"Enter the file to be Read">
call crlf
mReadStr fileName





; Open the file for input
   mov EDX,OFFSET fileName
   call openInputFile
   mov fileHandle,eax

;Check For errors.
    cmp eax,INVALID_HANDLE_VALUE      ;error opening file?
    jne file_ok
    mWrite <"Cannot open file.",0dh,0ah>
    jmp quit                                                                                             ;----------------------- FILE READ--------------
                                                                                                         ;----------------------- FILE READ--------------
file_ok:                                                                                                 ;----------------------- FILE READ--------------
; Read the file into a buffer.                                                                           ;----------------------- FILE READ--------------
    mov ecx,0                                                                                            ;----------------------- FILE READ--------------
    mov EDX,OFFSET string_taken                                                                          ;----------------------- FILE READ--------------
   mov ECX, sizeof string_taken                                                                          ;----------------------- FILE READ--------------
   call ReadFromFile                                                                                     ;----------------------- FILE READ--------------
   call WriteWindowsMsg                                                                                  ;----------------------- FILE READ--------------
                                                                                                         ;----------------------- FILE READ--------------
; Display the buffer                                                                                     ;----------------------- FILE READ--------------
   mWrite <"Buffer:",0dh,0ah,0dh,0ah>            ;display the buffer                                     ;----------------------- FILE READ--------------
   mov esi,offset string_taken                                                                           ;----------------------- FILE READ--------------
   mov ECX, sizeof string_taken                                                                          ;----------------------- FILE READ--------------
                                                                                                         ;----------------------- FILE READ--------------
  mWrite<"Your Message is: ">
  Mspacing
  
  Loop1:                                                                                                 ;----------------------- FILE READ--------------
    mov eax,0                                                                                            ;----------------------- FILE READ--------------
    mov eax,[esi]                                                                                        ;----------------------- FILE READ--------------
    call Writeint                                                                                       ;----------------------- FILE READ--------------
    mov edx,offset msg
	call writestring
	inc esi                                                                                              ;----------------------- FILE READ--------------
  loop Loop1                                                                                             ;----------------------- FILE READ--------------
                                                                                                         ;----------------------- FILE READ--------------
    call crlf                                                                                            ;----------------------- FILE READ--------------
                                                                                                         ;----------------------- FILE READ--------------
; close file                                                                                             ;----------------------- FILE READ--------------
    mov eax,fileHandle                                                                                   ;----------------------- FILE READ--------------
    call CloseFile                                                                                       ;----------------------- FILE READ--------------
                                                                                                         ;----------------------- FILE READ--------------
quit:                                                                                                    ;----------------------- FILE READ--------------
pop edx                                                                                                  ;----------------------- FILE READ--------------
pop eax                                                                                                  ;----------------------- FILE READ--------------
pop ecx                                                                                                  ;----------------------- FILE READ--------------
pop esi                                                                                                  ;----------------------- FILE READ--------------
                                                                                                         ;----------------------- FILE READ--------------
ENDM                                                                                                     ;----------------------- FILE READ--------------







Mcreate_f Macro lineOut,fileName2                                                                 ;macro to write file
LOCAL string,fileName2,choice,inFile,outFile        

.data        
choice     BYTE 'Enter ( .txt for text file)==>MOST PREFERABLE (.docx for word file) (.ppt for powerpoint file) ',0
outFile     DWORD 0
;fileName2   byte 50 DUP(?)

.code
push edx
push eax
push ecx
call crlf
mWrite<"Enter Filename to be created ">
call crlf

mov edx, offset choice
call writeString
call crlf

mReadStr filename2
call crlf
mWrite<"Enter the text to be written inside a file">                    ;data to me mentioned which will be encrypted
call crlf                                                               ;data to me mentioned which will be encrypted
mReadStr lineOut                                                        ;data to me mentioned which will be encrypted

 lea edx, filename2
  call CreateOutputFile                                                                            ;---------------------FILE WRITTEN-------------
  mov outfile, eax                                                                                 ;---------------------FILE WRITTEN-------------
                                                                                                   ;---------------------FILE WRITTEN-------------
  mov eax, outfile   ; just for illustration - here, eax already contains the handle               ;---------------------FILE WRITTEN-------------
  lea edx, lineOut                                                                                 ;---------------------FILE WRITTEN-------------
  mov ecx, sizeof lineOut                                                                          ;---------------------FILE WRITTEN-------------
  call WriteToFile                                                                                 ;---------------------FILE WRITTEN-------------
                                                                                                   ;---------------------FILE WRITTEN-------------
  mov eax, outfile                                                                                 ;---------------------FILE WRITTEN-------------
  call CloseFile                                                                                   ;---------------------FILE WRITTEN-------------
                                                                                                   ;---------------------FILE WRITTEN-------------
pop edx                                                                                            ;---------------------FILE WRITTEN-------------
pop eax                                                                                            ;---------------------FILE WRITTEN-------------
pop ecx                                                                                            ;---------------------FILE WRITTEN-------------
 call crlf                                                                                         ;---------------------FILE WRITTEN-------------
                                                                                                   ;---------------------FILE WRITTEN-------------
  ; call Clrscr                                                                                    ;---------------------FILE WRITTEN-------------
 ENDM



 Mcreate_file Macro lineOut,temp2                                                                 ;macro to write file
LOCAL string,fileName2,choice,inFile,outFile      

.data        
choice     BYTE '                                                               #file created ',0
outFile     DWORD 0   
fileName2 byte temp2,0

.code
push edx
push eax
push ecx

mov edx, offset choice
call writeString
call crlf
 lea edx, filename2
  call CreateOutputFile                                                                            ;---------------------FILE WRITTEN type 2-------------
  mov outfile, eax                                                                                 ;---------------------FILE WRITTEN type 2-------------
                                                                                                   ;---------------------FILE WRITTEN type 2-------------
  mov eax, outfile   ; just for illustration - here, eax already contains the handle               ;---------------------FILE WRITTEN type 2-------------
  lea edx, lineOut                                                                                 ;---------------------FILE WRITTEN type 2-------------
  mov ecx, sizeof lineOut                                                                          ;---------------------FILE WRITTEN type 2-------------
  call WriteToFile                                                                                 ;---------------------FILE WRITTEN type 2-------------
                                                                                                   ;---------------------FILE WRITTEN type 2-------------
  mov eax, outfile                                                                                 ;---------------------FILE WRITTEN type 2-------------
  call CloseFile                                                                                   ;---------------------FILE WRITTEN type 2-------------
                                                                                                   ;---------------------FILE WRITTEN type 2-------------
pop edx                                                                                            ;---------------------FILE WRITTEN type 2-------------
pop eax                                                                                            ;---------------------FILE WRITTEN type 2-------------
pop ecx                                                                                            ;---------------------FILE WRITTEN type 2-------------
 call crlf                                                                                         ;---------------------FILE WRITTEN type 2-------------
                                                                                                   ;---------------------FILE WRITTEN type 2-------------
  ; call Clrscr                                                                                    ;---------------------FILE WRITTEN type 2-------------
 ENDM



 Mcheck MACRO val
 
 push eax
 mov eax,0
 call crlf
 call ReadInt
 mov val,al
 pop eax

 ENDM



                                                                                ;----------------------------------------------------------------
                                                                                ;----------------------------------------------------------------
                                                                                ;----------------------------------------------------------------
                                                                                ;----------------------------------------------------------------                                                                                ;----------------------------------------------------------------
                                                                                ;----------------------------------------------------------------
                                                                                ;----------------------------------------------------------------
                                                                                ;----------------------------------------------------------------
                                                                                ;----------------------------------------------------------------

                                                                                ;--------------------MAIN FUNCTION START;------------------------
                                                                                ;----------------------------------------------------------------
                                                                                ;----------------------------------------------------------------
                                                                                ;----------------------------------------------------------------
                                                                                ;----------------------------------------------------------------
                                                                                ;----------------------------------------------------------------
                                                                                ;----------------------------------------------------------------



                                ;------------ TO BE MERGED FROM HERE-------

.data
enckey_file BYTE "Encryption_Key.txt"
filehandle_enc DWORD ?
filename byte 100 DUP(?)
filename1 byte 30 DUP(?)
slength= 50
k SBYTE -2, 4, 1, 0, -3, 5, 2, -4, -4, 6 
s byte  slength DUP(?)
td byte 30 DUP(?)
msg byte   '  ',0
counter dword ?

FUNC2key SBYTE -2,4,1,0,-3,5,2,-4,-4,6
FUNC3key word 1010101010101010b
FUNC3sensedbits byte lengthof s - 1 DUP(0)
FUNC3rsensedbits byte lengthof s - 1 DUP(0)
FUNC3rcrc byte lengthof s - 1 DUP(0)
FUNC3tester word 1000000000000000b
FUNC3rtester word 0000000000000001b 
keyyy SBYTE 12 DUP(?)

encryption_bundle01 PROTO X: PTR DWORD, Y: SDWORD
decryption_bundle01 PROTO X: PTR DWORD, Y: SDWORD, Z: SBYTE
encryption_bundle02 PROTO X: PTR DWORD, Y: SDWORD
decryption_bundle02 PROTO X: PTR DWORD, Y: SDWORD, Z: SBYTE
encryption_random PROTO X: PTR DWORD, Y: DWORD
decryption_random PROTO X: PTR DWORD, Y: DWORD

prompt1 BYTE "Encryption key 01:" , 0
prompt2 BYTE "Encrypted Text:" , 0
prompt3 BYTE "Decrypted Text:" , 0
prompt5 BYTE "Enter Decryption Key:" , 0
prompt6 BYTE "Incorrect key. Enter again." , 0
prompt7 BYTE "Decryption key:" , 0


textsize SDWORD ?
key_arr SDWORD 10 DUP(?)
inputarr1 SBYTE 12 DUP(?)
temp SDWORD ?

        ;-----Flagship----
flag1 byte ?
flag2 byte ?
flag3 byte ?


.code


main proc

mWrite<"          Welcome to the program">
call crlf
call crlf
mWrite<" Enter ">
call crlf
mWrite<"          1 to ---->encrypt/decrypt">
call crlf
 mWrite<"          2 to ---->read file">
call crlf
Mcheck flag1
mgotox  40,5
cmp flag1,1
je other_part


justr:
Mread_f   filename1
Mspacing
call crlf
call crlf
mov edx, offset enckey_file
call openinputfile
mov filehandle_enc,eax
mov edx,offset keyyy
mov ecx, 12
call readfromfile
mov ecx,12
mov esi,0
mov edx,offset prompt7
call writestring
READ_KEY:
	movsx eax,keyyy[esi]
	call writeint
	mov edx,offset msg
	call writestring
	inc esi
loop READ_KEY
jmp FORWARD 
;-------------------FILING PART ABOVE -------------------
other_part:
Mspacing
mWrite<"Enter the String to be Encrypted :">
call crlf
mReadStr s
mwaits
Mspacing


inc eax
mov textsize , eax
mov eax,textsize


INVOKE encryption_bundle01, ADDR s,textsize


INVOKE encryption_bundle02, ADDR s,textsize


;random key generation for function3
call randomize
mov ecx,10
mov edi , 2          
key1:
	call Random32
	mov eax,20
	call randomrange
	sub eax , 10
	mov keyyy[edi], al
	add edi , 1
loop key1

INVOKE encryption_random, ADDR s, textsize

Mcreate_file s,'Encrypted_Text.txt'
Mcreate_file keyyy,'Encryption_Key.txt'
Mspacing

mov edx,offset prompt2
call writestring
mov edx, offset s
call writestring
call crlf
call crlf
call crlf

;;displaying key
mov ecx,12
mov esi,0
display_key:
	movsx eax,keyyy[esi]
	call writeint
	mov edx,offset msg
	call writestring
	add esi,1
loop display_key
call crlf
call crlf
call crlf

;read decryption key
READ_INPUT:
	mov edx, offset prompt5
	call writestring
	call crlf
	call crlf
	mov ecx, 12
	mov esi,0
	input_key:
		call readint
		mov inputarr1[esi],al
		add esi,1
	loop input_key

CHECK_THE_KEY:
;check input key with decryption key
mov ecx,12
mov esi,0
mov edi,0
check1:
	movzx eax,keyyy[esi]
	cmp al,inputarr1[edi]
	jne AGAIN
	add esi,1
	add edi,1
loop check1
mWrite<" Key Matched!">
jmp FORWARD
AGAIN:
	mov edx,offset prompt6
	call writestring
	call crlf
	jmp READ_INPUT

FORWARD:
INVOKE decryption_random, ADDR s, textsize

INVOKE decryption_bundle02, ADDR s,textsize,keyyy[1]

INVOKE decryption_bundle01, ADDR s,textsize,keyyy[0]
mov edx,offset prompt3
call writestring
mov edx, offset s
call writestring
call crlf

exit
main ENDP

encryption_bundle01 PROC, X: PTR DWORD, Y: SDWORD

mov edi,X
mov esi,0
call randomize
call random32
mov eax,3
call randomrange
inc eax
mov keyyy[esi],al
cmp eax,1
je FUNC1
cmp eax,2
je FUNC2
cmp eax,3
je FUNC3
cmp eax,4
je FUNC4
FUNC1:
    mov esi,X
    mov edi, X
	add edi,y
	sub edi,2
    mov eax,Y
	sub eax,1
    mov edx,0
    mov ebx,2
    div ebx
    mov ecx,eax
    FUNC1_L1:
	    mov al,[esi]
	    mov bl,[edi]
	    mov [esi],bl
	    mov [edi],al
	    inc esi
	    dec edi
    loop FUNC1_L1
    mov ecx,Y
	sub ecx,1
    mov esi,X
    FUNC1_L2:
	    mov al,[esi]
	    xor al, 03h
	    mov [esi],al
	    inc esi
    loop FUNC1_L2
    ret
FUNC2:
    mov edi, X
    mov esi, 0
    mov ecx, Y
    mov ebx, lengthof FUNC2key
	sub ebx,1
    FUNC2_L1:
	    push ecx
	    mov cl, FUNC2key[esi]
	    cmp cl, 0
	    je CASE_ZERO
	    jne ENCC

	    CASE_ZERO:
		    cmp esi, ebx
		    je next1
		    jmp FUNC2_L2

	    ENCC:
		    mov al,[edi]
		    add al,cl
		    mov [edi],al
		    jmp CASE_ZERO

	    next1:
		    mov esi, 0

	    FUNC2_L2:
		    inc esi
		    inc edi
		    pop ecx
    LOOP FUNC2_L1
    ret
FUNC3:
	mov bx, FUNC3key
	mov ecx, Y
	sub ecx,1
	mov esi, 0
	mov edi, X
	FUNC3_L1:
		push ecx
		mov edx,0
		mov dl, [edi]
		FUNC3_L2:
			test FUNC3tester, dx
			inc FUNC3sensedbits[esi]
			shr FUNC3tester, 1
		jz FUNC3_L2
		FUNC3_L3:
			test FUNC3rtester, dx
			inc FUNC3rsensedbits[esi]
			shl FUNC3tester, 1
		jz FUNC3_L3
		mov FUNC3tester, 1000000000000000b
		mov FUNC3rtester, 0000000000000001b
		mov cl, FUNC3sensedbits[esi]
		shld dx, bx, cl
		mov cl, FUNC3rsensedbits[esi]
		dec cl
		sar dx, cl
		rol dl, 4
		clc
		mov cl, 0
		FUNC3_L4:
			rcr dl, 1
			inc cl
		jnc FUNC3_L4
		mov FUNC3rcrc[esi], cl
		mov [edi], dl
		inc esi
		inc edi
		pop ecx
	loop FUNC3_L1
	ret
FUNC4:
    mov edi,X
    mov ecx, Y
	sub ecx,1
    FUNC4_L1:
	    push ecx
	    mov ecx,eax
	    mov bl,[edi]
	    not bl
	    add bl,1
	    ror bl,cl
	    mov [edi],bl
	    inc edi
	    pop ecx
    loop FUNC4_L1
    ret
encryption_bundle01 ENDP


encryption_bundle02 PROC, X: PTR DWORD, Y: SDWORD

mov edi,X
mov esi,1
call randomize
call random32
mov eax,2
call randomrange
inc eax
mov keyyy[esi],al
cmp eax,1
je FUNC1
cmp eax,2
je FUNC2
cmp eax,3
je FUNC3
FUNC1:
    mov ecx, Y
	mov esi, X
	FUNC1_L1:
		mov eax,0
		push ecx
		mov al,[esi]
		mov ecx,4
		FUNC1_L2:
			TEST al,10000000b
			jz SHIFT
			rol al,1
		loop FUNC1_L2
			jmp BACK 
			SHIFT:
				shl al,1
		loop FUNC1_L2
	BACK:
		NOT al
		mov [esi],al
		pop ecx
		inc esi
	loop FUNC1_L1
	ret
FUNC2:
    mov esi, X
	mov ecx, Y
	sub ecx, 1
	FUNC2_L1:
		mov al,[esi]
		ROL al,4
		inc al
		xor al,04h
		DEC al
		mov [esi],al
		inc esi
	loop FUNC2_L1
	ret
FUNC3:
	mov esi, X
	mov ecx, Y
	sub ecx,2
	FUNC3_L1:
		mov al,[esi]
		xor al,[esi+1]
		mov [esi],al
		inc esi
	loop FUNC3_L1
	mov al,[esi]
	not al
	mov [esi],al
	ret
encryption_bundle02 ENDP


encryption_random PROC, X: PTR DWORD, Y: DWORD

mov edi, X
mov esi, 2
mov ecx, Y
sub ecx,1
mov ebx, lengthof keyyy
dec ebx
L1:
	push ecx
	movzx ecx, keyyy[esi]
	cmp ecx, 0
	je CASE_ZERO
	jg Rotate_Right
	jl Rotate_Left

	CASE_ZERO:
		cmp esi, ebx
		je next1
		jmp L2

	Rotate_Right:
		mov al,[edi]
		ror al, cl
		mov[edi],al
		jmp CASE_ZERO

	Rotate_Left:
		neg cl
		mov al,[edi]
		rol al, cl
		mov[edi],al
		jmp CASE_ZERO

	next1:
		mov esi, 2

	L2:
		inc esi
		inc edi
		pop ecx
LOOP L1
ret
encryption_random ENDP


decryption_bundle01 PROC, X: PTR DWORD, Y: SDWORD, Z: SBYTE

movzx eax,Z
cmp eax,1
je FUNC1
cmp eax,2
je FUNC2
cmp eax,3
je FUNC3
cmp eax,4
je FUNC4
FUNC1:
    mov esi,X
	mov ecx,Y
	sub ecx,1
    FUNC1_L2:
	    mov al,[esi]
	    xor al, 03h
	    mov [esi],al
	    inc esi
    loop FUNC1_L2
	mov esi,X
	mov edi,X
	add edi,Y
	sub edi,2
    mov eax,Y
	sub eax,1
    mov edx,0
    mov ebx,2
    div ebx
    mov ecx,eax
    FUNC1_L1:
	    mov al,[esi]
	    mov bl,[edi]
	    mov [esi],bl
	    mov [edi],al
	    inc esi
	    dec edi
    loop FUNC1_L1
    ret
FUNC2:
    mov edi, X
    mov esi, 0
    mov ecx, Y
    mov ebx, lengthof FUNC2key
	sub ebx,1
    FUNC2_L1:
	    push ecx
	    mov cl, FUNC2key[esi]
	    cmp cl, 0
	    je CASE_ZERO
	    jne ENCC

	    CASE_ZERO:
		    cmp esi, ebx
		    je next1
		    jmp FUNC2_L2

	    ENCC:
		    mov al,[edi]
		    sub al,cl
		    mov [edi],al
		    jmp CASE_ZERO

	    next1:
		    mov esi, 0

	    FUNC2_L2:
		    inc esi
		    inc edi
		    pop ecx
    LOOP FUNC2_L1
    ret
FUNC3:
	mov bx, FUNC3key
	mov ecx, Y
	sub ecx, 1
	mov esi, 0
	mov edi, X
	FUNC3_L1:
		push ecx
		mov edx,0
		mov dl, [edi]
		stc
		mov cl, FUNC3rcrc[esi]
		rcl dl, cl
		ror dl, 4
		mov cl, FUNC3rsensedbits[esi]
		dec cl
		sal dx, cl
		mov cl, FUNC3sensedbits[esi]
		shrd dx, bx, cl
		mov [edi], dl
		inc esi
		inc edi
		pop ecx
	loop FUNC3_L1
	ret
FUNC4:
    mov edi,X
    mov ecx, Y
	sub ecx,1
    FUNC4_L1:
	    push ecx
	    mov ecx,eax
	    mov bl,[edi]
		rol bl,cl
	    not bl
	    add bl,1
	    mov [edi],bl
	    inc edi
	    pop ecx
    loop FUNC4_L1
    ret
decryption_bundle01 ENDP


decryption_bundle02 PROC, X: PTR DWORD, Y: SDWORD, Z: SBYTE

movzx eax,Z
cmp eax,1
je FUNC1
cmp eax,2
je FUNC2
cmp eax,3
je FUNC3
FUNC1:
    mov ecx, Y
	mov esi, X
	L1:
		mov eax,0
		push ecx
		mov al,[esi]
		NOT al
		mov ecx,4
		L2:
			TEST al,00000001b
			jz SHIFT
			ror al,1
		loop L2
			jmp BACK 
			SHIFT:
				shr al,1
		loop L2
	BACK:
		mov [esi],al
		pop ecx
		inc esi
	loop L1
	ret
FUNC2:
    mov esi, X
	mov ecx, Y
	sub ecx, 1
	FUNC2_L1:
		mov al,[esi]
		inc al
		xor al,04h
		dec al
		ROR al,4
		mov [esi],al
		inc esi
	loop FUNC2_L1
	ret
FUNC3:
	mov esi, X
	add esi, Y
	sub esi, 2
	mov al,[esi]
	not al
	mov [esi],al
	dec esi
	mov ecx, Y
	sub ecx, 2
	FUNC3_L1:
		mov al,[esi]
		xor al,[esi+1]
		mov [esi],al
		dec esi
	loop FUNC3_L1
	ret	
decryption_bundle02 ENDP

decryption_random PROC, X: PTR DWORD, Y: DWORD
mov edi, X
mov esi, 2
mov ecx, Y
sub ecx,1
mov ebx, lengthof keyyy
dec ebx
L1:
	push ecx
	movzx ecx, keyyy[esi]
	cmp ecx, 0
	je CASE_ZERO
	jg Rotate_Left
	jl Rotate_Right

	CASE_ZERO:
		cmp esi, ebx
		je next1
		jmp L2

	Rotate_Left:
		mov al,[edi]
		rol al, cl
		mov[edi],al
		jmp CASE_ZERO

	Rotate_Right:
		neg cl
		mov al,[edi]
		ror al, cl
		mov[edi],al
		jmp CASE_ZERO

	next1:
		mov esi, 2

	L2:
		inc esi
		inc edi
		pop ecx
LOOP L1
ret
decryption_random ENDP

END main