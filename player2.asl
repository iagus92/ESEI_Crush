// Agent player in project conecta4.mas2j

/* Initial beliefs and rules */
player(1).
flag(0).

contiguas(C,X,Y,X1,Y1) :- steak(C,X,Y) & steak(C1,X+1,Y) & not(C==C1) & X1=X+1 & Y1=Y.
contiguas(C,X,Y,X1,Y1) :- steak(C,X,Y) & steak(C1,X-1,Y) & not(C==C1) & X1=X-1 & Y1=Y.
contiguas(C,X,Y,X1,Y1) :- steak(C,X,Y) & steak(C1,X,Y+1) & not(C==C1) & X1=X & Y1=Y+1.
contiguas(C,X,Y,X1,Y1) :- steak(C,X,Y) & steak(C1,X,Y-1) & not(C==C1) & X1=X & Y1=Y-1.

// Reglas para encontrar agrupaciones de steaks del mismo color.
contiguas5H(C,X,Y,X1,Y) :- steak(C,X,Y) & steak(C,X+1,Y) & steak(C,X+3,Y) & steak(C,X+4,Y) & X1=X+2.
contiguas5V(C,X,Y,X,Y1) :- steak(C,X,Y) & steak(C,X,Y+1) & steak(C,X,Y+3) & steak(C,X,Y+4) & Y1=Y+2.
contiguas4H(C,X,Y,X1,Y) :- (steak(C,X,Y) & steak(C,X+1,Y) & steak(C,X+3,Y) & X1=X+2)|(steak(C,X,Y) & steak(C,X+2,Y) & steak(C,X+3,Y) & X1=X+1).
contiguas4V(C,X,Y,X,Y1) :- (steak(C,X,Y) & steak(C,X,Y+1) & steak(C,X,Y+3) & Y1=Y+2)|(steak(C,X,Y) & steak(C,X,Y+2) & steak(C,X,Y+3) & Y1=Y+1).
contiguas3V(C,X,X,Y1,Y2) :- steak(C,X,Y1) & steak(C,X,Y2) &  Y2==Y1+1.
contiguas3H(C,X1,X2,Y,Y) :- steak(C,X1,Y) & steak(C,X2,Y) &  X2==X1+1.
teV(C,X,Y,Y1,Y2) :- steak(C,X,Y) & steak(C,X,Y+1) &  steak(C,X,Y+3) & steak(C,X-1,Y+2) & steak(C,X+1,Y+2) & Y1=Y+2 & Y2=Y+3.
teV(C,X,Y,Y,Y2) :- steak(C,X,Y) & steak(C,X,Y+2) & steak(C,X,Y+3) & steak(C,X-1,Y+1) &  steak(C,X+1,Y+1) & Y2=Y+1.
teH(C,X,Y,X,X2) :- steak(C,X,Y) & steak(C,X+2,Y) & steak(C,X+3,Y) & steak(C,X+1,Y-1) & steak(C,X+1,Y+1) & X2=X+1.
teH(C,X,Y,X1,X2) :- steak(C,X,Y) & steak(C,X+1,Y) & steak(C,X+3,Y) &  steak(C,X+2,Y-1) & steak(C,X+2,Y+1) & X2=X+2 & X1=X+3.
cuadradoAbajo1(C,X,Y,X1,Y1,X2,Y2) :- steak(C,X,Y) & steak(C,X+1,Y) & steak(C,X+1,Y+1) & X1=X & Y1=Y+1 & ((steak(C,X-1,Y+1) & X2=X-1 & Y2=Y+1)|(steak(C,X,Y+2) & X2=X & Y2=Y+2)).
cuadradoAbajo2(C,X,Y,X1,Y1,X2,Y2) :- steak(C,X,Y) & steak(C,X+1,Y) & steak(C,X,Y+1) & X1=X+1 & Y1=Y+1 & ((steak(C,X+2,Y+1) & X2=X+2 & Y2=Y+1)|(steak(C,X+1,Y+2) & X2=X+1 & Y2=Y+2)).
cuadradoArriba1(C,X,Y,X1,Y1,X2,Y2) :- steak(C,X,Y) & steak(C,X,Y-1) & steak(C,X+1,Y) & X1=X+1 & Y1=Y-1 & ((steak(C,X+1,Y-2) & X2=X+1 & Y2=Y-2)|(steak(C,X+2,Y-1) & X2=X+2 & Y2=Y-1)).
cuadradoArriba2(C,X,Y,X1,Y1,X2,Y2) :- steak(C,X,Y) & steak(C,X+1,Y) & steak(C,X+1,Y-1) & X1=X & Y1=Y-1 & ((steak(C,X-1,Y-1) & X2=X-1 & Y2=Y-1)|(steak(C,X,Y-2) & X2=X & Y2=Y-2)).

// Reglas para encontrar steak a intercambiar con (X,Y) que genere una combinación valida.
filMasTres(C,X,Y,X,Y1) :- (steak(C,X,Y-1) & Y1=Y-1)|(steak(C,X,Y+1) & Y1=Y+1).
colMasTres(C,X,Y,X1,Y) :- (steak(C,X-1,Y) & X1=X-1)|(steak(C,X+1,Y) & X1=X+1).
tresIzda(C,X,Y,X1,Y1) :- (steak(C,X-1,Y-1) & X1 = X-1 & Y1 = Y-1)| (steak(C,X-2,Y) & X1 = X-2 & Y1 = Y) | (steak(C,X-1,Y+1) & X1 = X-1 & Y1 = Y+1).
tresDcha(C,X,Y,X1,Y1) :- (steak(C,X+1,Y-1) & X1 = X+1 & Y1 = Y-1 )|( steak(C,X+2,Y) & X1 = X+2 & Y1 = Y )|( steak(C,X+1,Y+1) & X1 = X+1 & Y1 = Y+1).
tresArriba(C,X,Y,X1,Y1) :- (steak(C,X-1,Y-1) & X1 = X-1 & Y1 = Y-1)| (steak(C,X+1,Y-1) & X1 = X+1 & Y1 = Y-1) | (steak(C,X,Y-2) & X1 = X & Y1 = Y-2).
tresAbajo(C,X,Y,X1,Y1) :- (steak(C,X-1,Y+1) & X1 = X-1 & Y1 = Y+1 )|( steak(C,X+1,Y+1) & X1 = X+1 & Y1 = Y+1)|( steak(C,X,Y+2) & X1 = X & Y1 = Y+2).

// Reglas para especiales.
especial5H(C,T,X,Y,X1,Y1) :- special(X,Y,C,T)|special(X+1,Y,C,T)|special(X+3,Y,C,T)|special(X+4,Y,C,T)|special(X1,Y1-1,C,T)|special(X1,Y1+1,C,T).
especial5V(C,T,X,Y,X1,Y1) :- special(X,Y,C,T)|special(X,Y+1,C,T)|special(X,Y+3,C,T)|special(X,Y+4,C,T)|special(X1-1,Y1,C,T)|special(X1+1,Y1,C,T).
especial4H(C,T,X,Y,X1,Y1) :- (special(X,Y,C,T)|special(X+1,Y,C,T)|special(X+3,Y,C,T))|(special(X,Y,C,T)|special(X+2,Y,C,T)|special(X+3,Y,C,T))|(special(X1,Y1-1,C,T)|special(X1,Y1+1,C,T)).
especial4V(C,T,X,Y,X1,Y1) :- (special(X,Y,C,T)|special(X,Y+1,C,T)|special(X,Y+3,C,T))|(special(X,Y,C,T)|special(X,Y+2,C,T)|special(X,Y+3,C,T))|(special(X1-1,Y1,C,T)|special(X1+1,Y1,C,T)).
especial3HI(C,T,X,Y) :- special(X,Y,C,T) | special(X+1,Y,C,T) | special(X-1,Y-1,C,T) | special(X-2,Y,C,T) | special(X-1,Y+1,C,T).
especial3HD(C,T,X,Y) :- special(X,Y,C,T) | special(X+1,Y,C,T) | special(X+2,Y-1,C,T) | special(X+2,Y+1,C,T) | special(X+3,Y,C,T).
especial3VAr(C,T,X,Y) :- special(X,Y,C,T) | special(X,Y+1,C,T) | special(X-1,Y-1,C,T) | special(X+1,Y-1,C,T) | special(X,Y-2,C,T).
especial3VAb(C,T,X,Y) :- special(X,Y,C,T) | special(X,Y+1,C,T) | special(X-1,Y+2,C,T) | special(X+1,Y+2,C,T) | special(X,Y+3,C,T).
especialTeV(C,T,X,Y) :- special(X,Y,C,T) | special(X,Y+1,C,T) | special(X,Y+3,C,T) | special(X-1,Y+2,C,T) | special(X+1,Y+2,C,T).
especialTeV(C,T,X,Y) :- special(X,Y,C,T) | special(X,Y+2,C,T) | special(X,Y+3,C,T) | special(X-1,Y+1,C,T) |  special(X+1,Y+1,C,T).
especialTH(C,T,X,Y) :- special(X,Y,C,T) | special(X+2,Y,C,T) | special(X+3,Y,C,T) | special(X+1,Y-1,C,T) | special(X+1,Y+1,C,T).
especialTeH(C,T,X,Y) :- special(X,Y,C,T) | special(X+1,Y,C,T) | special(X+3,Y,C,T) | special(X+2,Y-1,C,T) | special(X+2,Y+1,C,T).
cuadradoEsp1(C,T,X,Y) :- special(X,Y,C,T) | special(X+1,Y,C,T) | special(X+1,Y+1,C,T) | special(X-1,Y+1,C,T) | special(X,Y+2,C,T).
cuadradoEsp2(C,T,X,Y) :- special(X,Y,C,T) | special(X+1,Y,C,T) | special(X,Y+1,C,T) | special(X+2,Y+1,C,T) | special(X+1,Y+2,C,T).
cuadradoEsp3(C,T,X,Y) :- special(X,Y,C,T) | special(X,Y-1,C,T) | special(X+1,Y,C,T) | special(X+1,Y-2,C,T) | special(X+2,Y-1,C,T).
cuadradoEsp4(C,T,X,Y) :- special(X,Y,C,T) | special(X+1,Y,C,T) | special(X+1,Y-1,C,T) | special(X-1,Y-1,C,T) | special(X,Y-2,C,T).

/* Initial goals */

/* Plans */

// Selecciona la mejor combinación.
+!buscarCombinacion
	<-  -+flag(0);
	!intercambiarEsp(4);
	!intercambiarEsp(2);
	!intercambiarEsp(1);
	!intercambiarEsp(3);
	!intercambiar.

// Intercambio con especial para T horizontal.
+!intercambiarEsp(T) : flag(0) & teH(C,X,Y,X1,X2) & steak(_,X2,Y) & especialTeH(C,T,X,Y)
	<- .print("-----SOLICITA intercambio ESP T horizontal------",C,", ",X2,", ",Y);
	   .send(judge,tell,exchange(X1,Y,X2,Y)); -+flag(1).

// Intercambio con especial para T vertical.
+!intercambiarEsp(T) : flag(0) & teV(C,X,Y,Y1,Y2) & steak(_,X,Y2) & especialTeV(C,T,X,Y)
	<- .print("-----SOLICITA intercambio ESP T vertical------",C,", ",X,", ",Y2);
	   .send(judge,tell,exchange(X,Y1,X,Y2)); -+flag(1).	

// Intercambio con especial para fila de 5.
+!intercambiarEsp(T) : flag(0) & contiguas5H(C,X,Y,X1,Y1) & steak(_,X1,Y1) & filMasTres(C,X1,Y1,NewX,NewY) & especial5H(C,T,X,Y)
	<- .print("-----SOLICITA intercambio ESP 5 vertical------",C,", ",NewX,", ",NewY);
		if((special(X1-1,Y1,C,T) & NewX=X1-1)|(special(X1+1,Y1,C,T)) & NewX=X1+1){
			.send(judge,tell,exchange(X1,Y1,NewX,NewY)); -+flag(1);	
		}else{
			.send(judge,tell,exchange(X1,Y1,NewX,NewY)); -+flag(1);
		}.	

// Intercambio con especial para columna de 5.
+!intercambiarEsp(T) : flag(0) & contiguas5V(C,X,Y,X1,Y1) & steak(_,X1,Y1) & colMasTres(C,X1,Y1,NewX,NewY) & especial5V(C,T,X,Y)
	<- .print("-----SOLICITA intercambio ESP 5 vertical------",C,", ",NewX,", ",NewY);
	   if((special(X1,Y1-1,C,T) & NX=X1 & NY=Y1-1)|(special(X1,Y1+1,C,T)) & NX=X1 & NY=Y1+1){
			.send(judge,tell,exchange(X1,Y1,NX,NY)); -+flag(1);	
		}else{
			.send(judge,tell,exchange(X1,Y1,NewX,NewY)); -+flag(1)
		}.	 

// Intercambio con especial para columna de 4.
+!intercambiarEsp(T) : flag(0) & contiguas4V(C,X,Y,X1,Y1) & steak(_,X1,Y1) & colMasTres(C,X1,Y1,NewX,NewY) & especial4V(C,T,X,Y)
	<- .print("-----SOLICITA intercambio ESP 4 vertical------",C,", ",NewX,", ",NewY);
	   if((special(X1,Y1-1,C,T) & NX=X1 & NY=Y1-1)|(special(X1,Y1+1,C,T)) & NX=X1 & NY=Y1+1){
			.send(judge,tell,exchange(X1,Y1,NX,NY)); -+flag(1)	
		}else{
			.send(judge,tell,exchange(X1,Y1,NewX,NewY)); -+flag(1)
		}.

// Intercambio con especial para fila de 4.
+!intercambiarEsp(T) : flag(0) & contiguas4H(C,X,Y,X1,Y1) & steak(_,X1,Y1) & filMasTres(C,X1,Y1,NewX,NewY) & especial4H(C,T,X,Y)
	<- .print("-----SOLICITA intercambio ESP 4 horizontal------",C,", ",NewX,", ",NewY);
	   if((special(X1-1,Y1,C,T) & NX=X1-1 & NY=Y1)|(special(X1+1,Y1,C,T)) & NX=X1+1 & NY=Y1){
			.send(judge,tell,exchange(X1,Y1,NX,NY)); -+flag(1)	
		}else{
			.send(judge,tell,exchange(X1,Y1,NewX,NewY)); -+flag(1)
		}.

// Intercambio cuadrado especial.
+!intercambiarEsp(T) : flag(0) & cuadradoAbajo1(C,X,Y,X1,Y1,X2,Y2) & steak(_,X1,Y1) & cuadradoEsp1(C,T,X,Y)
	<- .print("-----SOLICITA intercambio cuadrado abajo izq------",C,", ",X2,", ",Y2);
		if((special(X-1,Y+1,C,T) & NX=X-1 & NY=Y+1)|(special(X,Y+2,C,T) & NX=X & NY=Y+2)){
			.send(judge,tell,exchange(X1,Y1,NX,NY)); -+flag(1)
		}else{
			.send(judge,tell,exchange(X1,Y1,X2,Y2)); -+flag(1)
		}.	   

// Intercambio cuadrado especial.
+!intercambiarEsp(T) : flag(0) & cuadradoAbajo2(C,X,Y,X1,Y1,X2,Y2) & steak(_,X1,Y1) & cuadradoEsp2(C,T,X,Y)
	<- .print("-----SOLICITA intercambio cuadrado abajo der------",C,", ",X2,", ",Y2);
	   if((special(X+2,Y+1,C,T) & NX=X+2 & NY=Y+1)|(special(X+1,Y+2,C,T) & NX=X+1 & NY=Y+2)){
			.send(judge,tell,exchange(X1,Y1,NX,NY)); -+flag(1)
		}else{
			.send(judge,tell,exchange(X1,Y1,X2,Y2)); -+flag(1)
		}.
	   
// Intercambio cuadrado especial.
+!intercambiarEsp(T) : flag(0) & cuadradoArriba1(C,X,Y,X1,Y1,X2,Y2) & steak(_,X1,Y1) & cuadradoEsp3(C,T,X,Y)
	<- .print("-----SOLICITA intercambio cuadrado arriba der------",C,", ",X2,", ",Y2);
	   if((special(X+2,Y-1,C,T) & NX=X+2 & NY=Y-1)|(special(X+1,Y-2,C,T) & NX=X+1 & NY=Y-2)){
			.send(judge,tell,exchange(X1,Y1,NX,NY)); -+flag(1)
		}else{
			.send(judge,tell,exchange(X1,Y1,X2,Y2)); -+flag(1)
		}.	
	 
// Intercambio cuadrado especial.
+!intercambiarEsp(T) : flag(0) & cuadradoArriba2(C,X,Y,X1,Y1,X2,Y2) & steak(_,X1,Y1) & cuadradoEsp4(C,T,X,Y)
	<- .print("-----SOLICITA intercambio cuadrado arriba izq------",C,", ",X2,", ",Y2);
	   if((special(X-1,Y-1,C,T) & NX=X-1 & NY=Y-1)|(special(X,Y-2,C,T) & NX=X & NY=Y-2)){
			.send(judge,tell,exchange(X1,Y1,NX,NY)); -+flag(1)
		}else{
			.send(judge,tell,exchange(X1,Y1,X2,Y2)); -+flag(1)
		}.			
	
// Intercambio con especial para fila de 3 por la izquierda.
+!intercambiarEsp(T) : flag(0) & contiguas3H(C,X1,X2,Y,Y) & steak(_,X1-1,Y) & tresIzda(C,X1,Y,NewX,NewY) & especial3HI(C,T,X1,Y)
	<- .print("-----SOLICITA intercambio ESP 3 izquierda------",C,", ",NewX,", ",NewY);
	   if((special(X1-1,Y-1,C,T) & NX=X1-1 & NY=Y-1)|(special(X1-1,Y+1,C,T) & NX=X1-1 & NY=Y+1)|(special(X1-2,Y,C,T) & NX=X1-2 & NY=Y)){
	   		.send(judge,tell,exchange(X1-1,Y,NX,NY)); -+flag(1)
	   }else{
			.send(judge,tell,exchange(X1-1,Y,NewX,NewY)); -+flag(1)
	   }.

// Intercambio con especial para fila de 3 por la derecha.
+!intercambiarEsp(T) : flag(0) & contiguas3H(C,X1,X2,Y,Y) & steak(_,X2+1,Y) & tresDcha(C,X2,Y,NewX,NewY) & especial3HD(C,T,X1,Y)
	<- .print("-----SOLICITA intercambio ESP 3 derecha------",C,", ",NewX,", ",NewY);
	   if((special(X2+1,Y-1,C,T) & NX=X2+1 & NY=Y-1)|(special(X2+1,Y+1,C,T) & NX=X2+1 & NY=Y+1)|(special(X2+2,Y,C,T) & NX=X2+2 & NY=Y)){
	   		.send(judge,tell,exchange(X2+1,Y,NX,NY)); -+flag(1)
	   }else{
			.send(judge,tell,exchange(X2+1,Y,NewX,NewY)); -+flag(1)
	   }.

// Intercambio con especial para columna de 3 por abajo.
+!intercambiarEsp(T) : flag(0) & contiguas3V(C,X,X,Y1,Y2) & steak(_,X,Y2+1) & tresAbajo(C,X,Y2,NewX,NewY) & especial3VAb(C,T,X,Y1)
	<-	.print("-----SOLICITA intercambio ESP 3 abajo------",C,", ",NewX,", ",NewY);
		if((special(X-1,Y2+1,C,T) & NX = X-1 & NY = Y2+1) | (special(X,Y2+2,C,T) & NX = X & NY = Y2+2) | (special(X+1,Y2+1,C,T) & NX = X+1 & NY = Y2+1)){
			.send(judge,tell,exchange(X,Y2+1,NX,NY)); -+flag(1)
		}else{		
			.send(judge,tell,exchange(X,Y2+1,NewX,NewY)); -+flag(1)
		}.
		
// Intercambio con especial para columna de 3 por arriba.
+!intercambiarEsp(T) : flag(0) & contiguas3V(C,X,X,Y1,Y2) & steak(_,X,Y1-1) & tresArriba(C,X,Y1,NewX,NewY) & especial3VAr(C,T,X,Y1)
	<-	.print("-----SOLICITA intercambio ESP 3 arriba------",C,", ",NewX,", ",NewY);
		if((special(X2-1,Y1-1,C,T) & NX = X2-1 & NY = Y1-1) | (special(X2,Y1-2,C,T) & NX = X2 & NY = Y1-2) | (special(X1+1,Y1-1,C,T) & NX = X2+1 & NY = Y1-1)){
			.send(judge,tell,exchange(X,Y1-1,NX,NY)); -+flag(1)
		}else{
			.send(judge,tell,exchange(X,Y1-1,NewX,NewY)); -+flag(1)
		}.

+!intercambiarEsp(T).
	
// Intercambio para columna de 5.
+!intercambiar : flag(0) & contiguas5V(C,X,Y,X1,Y1) & steak(_,X1,Y1) & colMasTres(C,X1,Y1,NewX,NewY)
	<- .print("-----SOLICITA intercambio 5 vertical------",C,", ",NewX,", ",NewY);
	   .send(judge,tell,exchange(X1,Y1,NewX,NewY)); -+flag(1).

// Intercambio para fila de 5.
+!intercambiar : flag(0) & contiguas5H(C,X,Y,X1,Y1) & steak(_,X1,Y1) & filMasTres(C,X1,Y1,NewX,NewY)
	<- .print("-----SOLICITA intercambio 5 horizontal------",C,", ",NewX,", ",NewY);
	   .send(judge,tell,exchange(X1,Y1,NewX,NewY)); -+flag(1).

// Intercambio para T horizontal.
+!intercambiar : flag(0) & teH(C,X,Y,X1,X2) & steak(_,X2,Y)
	<- .print("-----SOLICITA intercambio T horizontal------",C,", ",X2,", ",Y);
	   .send(judge,tell,exchange(X1,Y,X2,Y)); -+flag(1).

// Intercambio para T vertical.
+!intercambiar : flag(0) & teV(C,X,Y,Y1,Y2) & steak(_,X,Y2)
	<- .print("-----SOLICITA intercambio T vertical------",C,", ",X,", ",Y2);
	   .send(judge,tell,exchange(X,Y1,X,Y2)); -+flag(1).	   
	   
// Intercambio para columna de 4.
+!intercambiar : flag(0) & contiguas4V(C,X,Y,X1,Y1) & steak(_,X1,Y1) & colMasTres(C,X1,Y1,NewX,NewY)
	<- .print("-----SOLICITA intercambio 4 vertical------",C,", ",NewX,", ",NewY);
	   .send(judge,tell,exchange(X1,Y1,NewX,NewY)); -+flag(1).

// Intercambio para fila de 4.
+!intercambiar : flag(0) & contiguas4H(C,X,Y,X1,Y1) & steak(_,X1,Y1) & filMasTres(C,X1,Y1,NewX,NewY)
	<- .print("-----SOLICITA intercambio 4 horizontal------",C,", ",NewX,", ",NewY);
	   .send(judge,tell,exchange(X1,Y1,NewX,NewY)); -+flag(1).

// Intercambio cuadrado.
+!intercambiar : flag(0) & cuadradoAbajo1(C,X,Y,X1,Y1,X2,Y2) & steak(_,X1,Y1)
	<- .print("-----SOLICITA intercambio cuadrado abajo izq------",C,", ",X2,", ",Y2);
	   .send(judge,tell,exchange(X1,Y1,X2,Y2)); -+flag(1).	   

// Intercambio cuadrado.
+!intercambiar : flag(0) & cuadradoAbajo2(C,X,Y,X1,Y1,X2,Y2) & steak(_,X1,Y1)
	<- .print("-----SOLICITA intercambio cuadrado abajo der------",C,", ",X2,", ",Y2);
	   .send(judge,tell,exchange(X1,Y1,X2,Y2)); -+flag(1).	
	   
// Intercambio cuadrado.
+!intercambiar : flag(0) & cuadradoArriba1(C,X,Y,X1,Y1,X2,Y2) & steak(_,X1,Y1)
	<- .print("-----SOLICITA intercambio cuadrado arriba der------",C,", ",X2,", ",Y2);
	   .send(judge,tell,exchange(X1,Y1,X2,Y2)); -+flag(1).	
	 
// Intercambio cuadrado.
+!intercambiar : flag(0) & cuadradoArriba2(C,X,Y,X1,Y1,X2,Y2) & steak(_,X1,Y1)
	<- .print("-----SOLICITA intercambio cuadrado arriba izq------",C,", ",X2,", ",Y2);
	   .send(judge,tell,exchange(X1,Y1,X2,Y2)); -+flag(1).		   
	   
// Intercambio para fila de 3 por la izquierda.
+!intercambiar : flag(0) & contiguas3H(C,X1,X2,Y,Y) & steak(_,X1-1,Y) & tresIzda(C,X1,Y,NewX,NewY)
	<- .print("-----SOLICITA intercambio 3 izquierda------",C,", ",NewX,", ",NewY);
	   .send(judge,tell,exchange(X1-1,Y,NewX,NewY)); -+flag(1).
	
// Intercambio para fila de 3 por la derecha.
+!intercambiar : flag(0) & contiguas3H(C,X1,X2,Y,Y) & steak(_,X2+1,Y) & tresDcha(C,X2,Y,NewX,NewY)
	<- .print("-----SOLICITA intercambio 3 derecha------",C,", ",NewX,", ",NewY);
	   .send(judge,tell,exchange(X2+1,Y,NewX,NewY)); -+flag(1).
	   
// Intercambio para columna de 3 por abajo.
+!intercambiar : flag(0) & contiguas3V(C,X,X,Y1,Y2) & steak(_,X,Y2+1) & tresAbajo(C,X,Y2,NewX,NewY)
	<- .print("-----SOLICITA intercambio 3 abajo------",C,", ",NewX,", ",NewY);
	   .send(judge,tell,exchange(X,Y2+1,NewX,NewY)); -+flag(1).
	
// Intercambio para columna de 3 por arriba.
+!intercambiar : flag(0) & contiguas3V(C,X,X,Y1,Y2) & steak(_,X,Y1-1) & tresArriba(C,X,Y1,NewX,NewY)
	<- .print("-----SOLICITA intercambio 3 arriba------",C,", ",NewX,", ",NewY);
	   .send(judge,tell,exchange(X,Y1-1,NewX,NewY)); -+flag(1).	   

// En último caso intercambio aleatorio.
+!intercambiar : flag(0)
	<- .findall(steak(Color,X,Y),steak(Color,X,Y),SteaksList);
	.length(SteaksList,SteaksLen);
	.nth(math.floor(math.random(SteaksLen)),SteaksList,steak(C,Cx,Cy));		
	if(contiguas(C,Cx,Cy,NewX,NewY)){
		.print("-----SOLICITA intercambio de (",Cx,",",Cy,")");
		.send(judge,tell,exchange(Cx,Cy,NewX,NewY)); -+flag(1)
	}else{
		!intercambiar;
	}.

+!intercambiar.	
	
// Percepción obstáculos.	
+steak(4,X,Y)[source(S)] <- -steak(4,X,Y)[source(S)];
	+obstacle(X,Y).

// Llama al plan intercambiar.
+canExchange(M) : player(N) <- .wait(100);
	if(special(X,Y,C,T)){
		.abolish(special(_,_,_,_));
	}
	-canExchange(M)[source(S)]; 
	if(N==M){ !buscarCombinacion }.

	
+tryAgain <- .wait(100);
	 -tryAgain[source(S)]; !buscarCombinacion.
			
+pos(Ag,X,Y)[source(S)] <- -pos(Ag,X,Y)[source(S)].
