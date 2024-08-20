;MATRIZ 3X3 CON FUNCION 02 Y 06 DE INT 10H
;8,-6,4,-5,6,-8,8,-4,8 - matriz de ejemplo para ingresar
;Arizmendi Michel 

mov ah,02         
mov dl,bh
int 21h          
           
mov ah, 06    ;funcion
mov bh, 90h   ;color
mov cx, 0101h ;primera coordenada
mov dx, 030Bh ;segunda coordenada
int 10h     

;limpie para que no me afecte en mis operaciones
sub ax,ax
sub bx,bx
sub cx,cx
sub dx,dx


;----Primer fila------
mov ah,02 
;mov bh,00  ;color
mov dx,0101h ;posicion 
int 10h

;Ingresar valores de la primer fila     

mov ah,02         ;imprimir linea vertical
mov dl,0b3h
int 21h 

mov ah,02       
mov dl,020h
int 21h
        
;1er valor
mov ah,01         
int 21h
sub al,30h
mov cl,al  ;cl  
 
;espacios 
mov ah,02        
mov dl,020h
int 21h 

mov ah,02
mov dl,020h
int 21h 

;signo menos
mov ah,02       
mov dl,'-'
int 21h  

;2do valor
mov ah,01         
int 21h
sub al,30h 
neg al
mov bl,al  ;bl

;espacios  
mov ah,02
mov dl,020h
int 21h
 
mov ah, 02   
mov dl, 020h
int 21h
 
;3er valor 
mov ah, 01
int 21h
sub al, 30h
mov ch, al   
           
;barra
mov ah,02        
mov dl,0b3h
int 21h  


;------2da fila-----  

mov ah,02 
;mov bh,00  ;color
mov dx,0201h ;posicion 
int 10h  


;Ingresar valores 

;barra 
mov ah,02         
mov dl,0b3h                     
int 21h
 
mov ah,02       
mov dl,'-'
int 21h

;4to valor 
mov ah,01      
int 21h
sub al,30h
mov ch,al   ;ch

;espacios
mov ah,02        
mov dl,020h
int 21h 

mov ah,02
mov dl,020h
int 21h  

mov ah,02       
mov dl,020h
int 21h
 
;5to 
mov ah,01      
int 21h
sub al,30h
mov bh,al ;bh 

;espacios
mov ah,02
mov dl, 020h
int 21h
 
mov ah,02       
mov dl,'-'
int 21h
    
;6to
mov ah,01
int 21h
sub al,30h
mov bl,al
 
;barra
mov ah,02        
mov dl,0b3h      
int 21h

;-----3er fila----- 

mov ah,02 
mov bh,00  ;color
mov dx,0301h ;posicion 
int 10h    

;barra
mov ah,02       
mov dl,0b3h      
int 21h

;valores
 
mov ah,02       
mov dl,020h
int 21h      

;7mo 
mov ah,01
int 21h
sub al,30h
mov cl,al   
 
mov ah,02
mov dl,020h
int 21h
  
mov ah,02
mov dl,020h
int 21h        
 
mov ah,02       
mov dl,'-'
int 21h

;8vo
mov ah,01 
int 21h
sub al,30h
mov cl,al
  
mov ah,02
mov dl,020h
int 21h
 
mov ah, 02
mov dl, 020h
int 21h
 
;9no
mov ah, 01
int 21h
sub al,30h
mov ch, al  
 
mov ah,02        
mov dl,0b3h      
int 21h


;-----MULTIPLICACIONES------   

;1er diagonal: 

mov ah,02 
mov bh,00  ;color
mov dx,0501h ;posicion 
int 10h 

mov ah, 02
mov dl, 020h
int 21h
   
 

sub al,al

mov ah, 01
int 21h
sub al,30h
mov bh, al 
;BH
 
mov ah,02      
mov dl,9eh ;signo de mul en ascii
int 21h
 

mov ah,01
int 21h
sub al,30h
mov dh,al      ;ingresa el segundo valor de la diagonal 
;DH
 
mov ah,02      
mov dl,9eh
int 21h
 
mov ah,01
int 21h
sub al,30h
mov ch,al       ;ingresa el tercer valor de la diagonal    
;CH
 
;mul el primer resultado parcial
 
mov al,bh
mul dh
mul ch
mov cx,ax  
 
;Primer queda en **CX**

;2da diagonal
 
mov ah,02 
mov bh,00  ;color
mov dx,0701h ;posicion 
int 10h
sub al,al
 
mov ah,02      
mov dl,'-'
int 21h    

mov ah, 01 ;Primer valor
int 21h
sub al,30h
mov bh, al
;BH
 
mov ah,02      
mov dl,9eh
int 21h
 
mov ah,02      
mov dl,'-'
int 21h    

mov ah,01
int 21h
sub al,30h
mov dh,al      ;reingresamos segundo valor      
;DH
 
mov ah,02      
mov dl,9eh
int 21h
 
mov ah,01
int 21h
sub al,30h
mov bl,al
;BL  

 
;2DA MULTIPLICACION 
neg bh
mov al,bh 
neg dh
mul dh
mul bl
mov dh,al 
;queda en**DH**  

;Como es menor de 99 mostramos por pantalla 

aam    ;ajuste para separa decenas y unidades 

add ax,3030h
mov bx, ax   

mov ah, 02
mov dl, '='
int 21h       

;Para mostrar decenas 
mov ah, 02
mov dl,bh
int 21h     

;Para mostrar unidades
mov ah, 02
mov dl,bl
int 21h   


;suma 1er y 2do
sub dl,dl
mov dl,dh  
sub dh,dh
add cx,dx

 
;3RA DIAGONAL 

mov ah,02 
mov bh,00  ;color
mov dx,0901h ;posicion 
int 10h   

mov ah, 02
mov dl, 020h
int 21h
 
 
sub al,al  

mov ah, 01 
int 21h
sub al,30h
mov bh, al 
;BH
 
mov ah,02      
mov dl,9eh
int 21h  
 
mov ah,02      
mov dl,'-'
int 21h
mov ah,01 

int 21h
sub al,30h
mov bl,al       
;BL
 
mov ah,02      
mov dl,9eh
int 21h  
 
mov ah,02      
mov dl,'-'
int 21h
 
mov ah,01
int 21h
sub al,30h
mov dl,al 
;DL
 
;3RA MULTIPLICACION 
mov al,bh 
;neg bl
imul bl 
;neg dl
imul dl 
;sub bx,bx
;mov bx,ax 
;queda en**AX**
 
;SUMA DE LAS PRIMERAS DIAGONALES
sub dl,dl
mov dl,dh 
sub dh,dh 

add cx, ax
;sub ax,ax 
;mov ax,cx


sub ax,ax
sub bx,bx
sub dx,dx  

;Al final el resultado de la suma de las 3 diagonales es igual a 848d ->350h
;y este resultado queda en CX 


                                                                                            
;-----DIAGONALES INVERSAS------  


mov ah,02 
mov bh,00  ;color
mov dx,0C01h ;posicion 
int 10h   
sub bh,bh    

mov ah, 02
mov dl, 020h
int 21h
 
mov ah, 01
int 21h
sub al,30h
mov bh, al 
;BH
 
mov ah,02      
mov dl,9eh ;signo de mul en ascii
int 21h
 

mov ah,01
int 21h
sub al,30h
mov dh,al      ;ingresa el segundo valor de la diagonal 
;DH
 
mov ah,02      
mov dl,9eh
int 21h
 
mov ah,01
int 21h
sub al,30h
mov bl,al       ;ingresa el tercer valor de la diagonal    
;bl
 
;mul el primer resultado parcial  
sub ax,ax
 
mov al,bh
mul dh
mul bl   


;1er resta
sub cx,ax 


;2da diagonal inversa   

mov ah,02 
mov bh,00  ;color
mov dx,0E01h ;posicion 
int 10h
sub al,al
 
mov ah,02      
mov dl,'-'
int 21h    

mov ah, 01 ;Primer valor
int 21h
sub al,30h
mov bh, al
;BH
 
mov ah,02      
mov dl,9eh
int 21h
 
mov ah,02      
mov dl,'-'
int 21h    

mov ah,01
int 21h
sub al,30h
mov dh,al      ;reingresamos segundo valor      
;DH
 
mov ah,02      
mov dl,9eh
int 21h
 
mov ah,01
int 21h
sub al,30h
mov bl,al
;BL  

 
;2DA MULTIPLICACION 
neg bh
mov al,bh 
neg dh
mul dh
mul bl  


;2da resta
sub cx,ax    



;----3ra diagonal 


mov ah,02 
mov bh,00  ;color
mov dx,1001h ;posicion 
int 10h        

mov ah, 02
mov dl, 020h
int 21h
 
 
sub al,al  

mov ah, 01 
int 21h
sub al,30h
mov bh, al 
;BH
 
mov ah,02      
mov dl,9eh
int 21h  
 
mov ah,02      
mov dl,'-'
int 21h
mov ah,01 

int 21h
sub al,30h
mov bl,al       
;BL
 
mov ah,02      
mov dl,9eh
int 21h  
 
mov ah,02      
mov dl,'-'
int 21h

 
mov ah,01
int 21h
sub al,30h
mov dl,al 
;DL   

sub ax,ax
 
;3RA MULTIPLICACION 
mov al,bh 
;neg bl
imul bl 
;neg dl
imul dl  
;queda en**AX** 


;3ra resta
sub cx, ax 
            
            
;EL RESULTADO QUE ES 160 ->A0 QUEDA EN CL    






                                 
                                                 

 

          

