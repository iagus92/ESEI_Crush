// Agent player in project conecta4.mas2j

/* Initial beliefs and rules */
player(0).

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
especial5H(C,X,Y,X1,Y1) :- especial(C,X,Y,_)|especial(C,X+1,Y,_)|especial(C,X+3,Y,_)|especial(C,X+4,Y,_)|especial(C,X1,Y1-1,_)|especial(C,X1,Y1+1,_).
especial5V(C,X,Y,X1,Y1) :- especial(C,X,Y,_)|especial(C,X,Y+1,_)|especial(C,X,Y+3,_)|especial(C,X,Y+4,_)|especial(C,X1-1,Y1,_)|especial(C,X1+1,Y1,_).
especial4H(C,X,Y,X1,Y1) :- (especial(C,X,Y,_)|especial(C,X+1,Y,_)|especial(C,X+3,Y,_))|(especial(C,X,Y,_)|especial(C,X+2,Y,_)|especial(C,X+3,Y,_))|(especial(C,X1,Y1-1,_)|especial(C,X1,Y1+1,_)).
especial4V(C,X,Y,X1,Y1) :- (especial(C,X,Y,_)|especial(C,X,Y+1,_)|especial(C,X,Y+3,_))|(especial(C,X,Y,_)|especial(C,X,Y+2,_)|especial(C,X,Y+3,_))|(especial(C,X1-1,Y1,_)|especial(C,X1+1,Y1,_)).
especial3HI(C,X,Y) :- especial(C,X,Y,_) | especial(C,X+1,Y,_) | especial(C,X-1,Y-1,_) | especial(C,X-2,Y,_) | especial(C,X-1,Y+1,_).
especial3HD(C,X,Y) :- especial(C,X,Y,_) | especial(C,X+1,Y,_) | especial(C,X+2,Y-1,_) | especial(C,X+2,Y+1,_) | especial(C,X+3,Y,_).
especial3VAr(C,X,Y) :- especial(C,X,Y,_) | especial(C,X,Y+1,_) | especial(C,X-1,Y-1,_) | especial(C,X+1,Y-1,_) | especial(C,X,Y-2,_).
especial3VAb(C,X,Y) :- especial(C,X,Y,_) | especial(C,X,Y+1,_) | especial(C,X-1,Y+2,_) | especial(C,X+1,Y+2,_) | especial(C,X,Y+3,_).
especialTeV(C,X,Y) :- especial(C,X,Y,_) | especial(C,X,Y+1,_) | especial(C,X,Y+3,_) | especial(C,X-1,Y+2,_) | especial(C,X+1,Y+2,_).
especialTeV(C,X,Y) :- especial(C,X,Y,_) | especial(C,X,Y+2,_) | especial(C,X,Y+3,_) | especial(C,X-1,Y+1,_) |  especial(C,X+1,Y+1,_).
especialTH(C,X,Y) :- especial(C,X,Y,_) | especial(C,X+2,Y,_) | especial(C,X+3,Y,_) | especial(C,X+1,Y-1,_) | especial(C,X+1,Y+1,_).
especialTeH(C,X,Y) :- especial(C,X,Y,_) | especial(C,X+1,Y,_) | especial(C,X+3,Y,_) | especial(C,X+2,Y-1,_) | especial(C,X+2,Y+1,_).
cuadradoEsp1(C,X,Y) :- especial(C,X,Y,_) | especial(C,X+1,Y,_) | especial(C,X+1,Y+1,_) | especial(C,X-1,Y+1,_) | especial(C,X,Y+2,_).
cuadradoEsp2(C,X,Y) :- especial(C,X,Y,_) | especial(C,X+1,Y,_) | especial(C,X,Y+1,_) | especial(C,X+2,Y+1,_) | especial(C,X+1,Y+2,_).
cuadradoEsp3(C,X,Y) :- especial(C,X,Y,_) | especial(C,X,Y-1,_) | especial(C,X+1,Y,_) | especial(C,X+1,Y-2,_) | especial(C,X+2,Y-1,_).
cuadradoEsp4(C,X,Y) :- especial(C,X,Y,_) | especial(C,X+1,Y,_) | especial(C,X+1,Y-1,_) | especial(C,X-1,Y-1,_) | especial(C,X,Y-2,_).


/* Initial goals */

/* Plans 
// Intercambio con especial para T horizontal.
+!intercambiar : teH(C,X,Y,X1,X2) & steak(_,X2,Y) & especialTeH(C,X,Y)
	<- .print("-----SOLICITA intercambio ESP T horizontal------",C,", ",X2,", ",Y);
	   .send(judge,tell,exchange(X1,Y,X2,Y)).

// Intercambio con especial para T vertical.
+!intercambiar : teV(C,X,Y,Y1,Y2) & steak(_,X,Y2) & especialTeV(C,X,Y)
	<- .print("-----SOLICITA intercambio ESP T vertical------",C,", ",X,", ",Y2);
	   .send(judge,tell,exchange(X,Y1,X,Y2)).	

// Intercambio con especial para fila de 5.
+!intercambiar : contiguas5H(C,X,Y,X1,Y1) & steak(_,X1,Y1) & filMasTres(C,X1,Y1,NewX,NewY) & especial5H(C,X,Y)
	<- .print("-----SOLICITA intercambio ESP 5 vertical------",C,", ",NewX,", ",NewY);
		if((especial(C,X1-1,Y1,_) & NewX=X1-1)|(especial(C,X1+1,Y1,_)) & NewX=X1+1){
			.send(judge,tell,exchange(X1,Y1,NewX,NewY));	
		}else{
			.send(judge,tell,exchange(X1,Y1,NewX,NewY));
		}.	

// Intercambio con especial para columna de 5.
+!intercambiar : contiguas5V(C,X,Y,X1,Y1) & steak(_,X1,Y1) & colMasTres(C,X1,Y1,NewX,NewY) & especial5V(C,X,Y)
	<- .print("-----SOLICITA intercambio ESP 5 vertical------",C,", ",NewX,", ",NewY);
	   if((especial(C,X1,Y1-1,_) & NX=X1 & NY=Y1-1)|(especial(C,X1,Y1+1,_)) & NX=X1 & NY=Y1+1){
			.send(judge,tell,exchange(X1,Y1,NX,NY));	
		}else{
			.send(judge,tell,exchange(X1,Y1,NewX,NewY));
		}.	 

// Intercambio con especial para columna de 4.
+!intercambiar : contiguas4V(C,X,Y,X1,Y1) & steak(_,X1,Y1) & colMasTres(C,X1,Y1,NewX,NewY) & especial4V(C,X,Y)
	<- .print("-----SOLICITA intercambio ESP 4 vertical------",C,", ",NewX,", ",NewY);
	   if((especial(C,X1,Y1-1,_) & NX=X1 & NY=Y1-1)|(especial(C,X1,Y1+1,_)) & NX=X1 & NY=Y1+1){
			.send(judge,tell,exchange(X1,Y1,NX,NY));	
		}else{
			.send(judge,tell,exchange(X1,Y1,NewX,NewY));
		}.

// Intercambio con especial para fila de 4.
+!intercambiar : contiguas4H(C,X,Y,X1,Y1) & steak(_,X1,Y1) & filMasTres(C,X1,Y1,NewX,NewY) & especial4H(C,X,Y)
	<- .print("-----SOLICITA intercambio ESP 4 horizontal------",C,", ",NewX,", ",NewY);
	   if((especial(C,X1-1,Y1,_) & NX=X1-1 & NY=Y1)|(especial(C,X1+1,Y1,_)) & NX=X1+1 & NY=Y1){
			.send(judge,tell,exchange(X1,Y1,NX,NY));	
		}else{
			.send(judge,tell,exchange(X1,Y1,NewX,NewY));
		}.

// Intercambio con especial para fila de 3 por la izquierda.
+!intercambiar : contiguas3H(C,X1,X2,Y,Y) & steak(_,X1-1,Y) & tresIzda(C,X1,Y,NewX,NewY) & especial3HI(C,X1,Y)
	<- .print("-----SOLICITA intercambio ESP 3 izquierda------",C,", ",NewX,", ",NewY);
	   if((especial(C,X1-1,Y-1,_) & NX=X1-1 & NY=Y-1)|(especial(C,X1-1,Y+1,_) & NX=X1-1 & NY=Y+1)|(especial(C,X1-2,Y,_) & NX=X1-2 & NY=Y)){
	   		.send(judge,tell,exchange(X1-1,Y,NX,NY));
	   }else{
			.send(judge,tell,exchange(X1-1,Y,NewX,NewY));
	   }.

// Intercambio con especial para fila de 3 por la derecha.
+!intercambiar : contiguas3H(C,X1,X2,Y,Y) & steak(_,X2+1,Y) & tresDcha(C,X2,Y,NewX,NewY) & especial3HD(C,X1,Y)
	<- .print("-----SOLICITA intercambio ESP 3 derecha------",C,", ",NewX,", ",NewY);
	   if((especial(C,X2+1,Y-1,_) & NX=X2+1 & NY=Y-1)|(especial(C,X2+1,Y+1,_) & NX=X2+1 & NY=Y+1)|(especial(C,X2+2,Y,_) & NX=X2+2 & NY=Y)){
	   		.send(judge,tell,exchange(X2+1,Y,NX,NY));
	   }else{
			.send(judge,tell,exchange(X2+1,Y,NewX,NewY));
	   }.

// Intercambio con especial para columna de 3 por abajo.
+!intercambiar : contiguas3V(C,X,X,Y1,Y2) & steak(_,X,Y2+1) & tresAbajo(C,X,Y2,NewX,NewY) & especial3VAb(C,X,Y1)
	<-	.print("-----SOLICITA intercambio ESP 3 abajo------",C,", ",NewX,", ",NewY);
		if((especial(C,X-1,Y2+1,_) & NX = X-1 & NY = Y2+1) | (especial(C,X,Y2+2,_) & NX = X & NY = Y2+2) | (especial(C,X+1,Y2+1,_) & NX = X+1 & NY = Y2+1)){
			.send(judge,tell,exchange(X,Y2+1,NX,NY));
		}else{		
			.send(judge,tell,exchange(X,Y2+1,NewX,NewY));
		}.
		
// Intercambio con especial para columna de 3 por arriba.
+!intercambiar : contiguas3V(C,X,X,Y1,Y2) & steak(_,X2,Y1-1) & tresArriba(C,X,Y1,NewX,NewY) & especial3VAr(C,X,Y1)
	<-	.print("-----SOLICITA intercambio ESP 3 arriba------",C,", ",NewX,", ",NewY);
		if((especial(C,X2-1,Y1-1,_) & NX = X2-1 & NY = Y1-1) | (especial(C,X2,Y1-2,_) & NX = X2 & NY = Y1-2) | (especial(C,X1+1,Y1-1,_) & NX = X2+1 & NY = Y1-1)){
			.send(judge,tell,exchange(X,Y1-1,NX,NY));
		}else{
			.send(judge,tell,exchange(X,Y1-1,NewX,NewY));
		}.

// Intercambio cuadrado especial.
+!intercambiar : cuadradoAbajo1(C,X,Y,X1,Y1,X2,Y2) & steak(_,X1,Y1) & cuadradoEsp1(C,X,Y)
	<- .print("-----SOLICITA intercambio cuadrado abajo izq------",C,", ",X2,", ",Y2);
		if((especial(C,X-1,Y+1,_) & NX=X-1 & NY=Y+1)|(especial(C,X,Y+2,_) & NX=X & NY=Y+2)){
			.send(judge,tell,exchange(X1,Y1,NX,NY));
		}else{
			.send(judge,tell,exchange(X1,Y1,X2,Y2));
		}.	   

// Intercambio cuadrado especial.
+!intercambiar : cuadradoAbajo2(C,X,Y,X1,Y1,X2,Y2) & steak(_,X1,Y1) & cuadradoEsp2(C,X,Y)
	<- .print("-----SOLICITA intercambio cuadrado abajo der------",C,", ",X2,", ",Y2);
	   if((especial(C,X+2,Y+1,_) & NX=X+2 & NY=Y+1)|(especial(C,X+1,Y+2,_) & NX=X+1 & NY=Y+2)){
			.send(judge,tell,exchange(X1,Y1,NX,NY));
		}else{
			.send(judge,tell,exchange(X1,Y1,X2,Y2));
		}.
	   
// Intercambio cuadrado especial.
+!intercambiar : cuadradoArriba1(C,X,Y,X1,Y1,X2,Y2) & steak(_,X1,Y1) & cuadradoEsp3(C,X,Y)
	<- .print("-----SOLICITA intercambio cuadrado arriba der------",C,", ",X2,", ",Y2);
	   if((especial(C,X+2,Y-1,_) & NX=X+2 & NY=Y-1)|(especial(C,X+1,Y-2,_) & NX=X+1 & NY=Y-2)){
			.send(judge,tell,exchange(X1,Y1,NX,NY));
		}else{
			.send(judge,tell,exchange(X1,Y1,X2,Y2));
		}.	
	 
// Intercambio cuadrado especial.
+!intercambiar : cuadradoArriba2(C,X,Y,X1,Y1,X2,Y2) & steak(_,X1,Y1) & cuadradoEsp4(C,X,Y)
	<- .print("-----SOLICITA intercambio cuadrado arriba izq------",C,", ",X2,", ",Y2);
	   if((especial(C,X-1,Y-1,_) & NX=X-1 & NY=Y-1)|(especial(C,X,Y-2,_) & NX=X & NY=Y-2)){
			.send(judge,tell,exchange(X1,Y1,NX,NY));
		}else{
			.send(judge,tell,exchange(X1,Y1,X2,Y2));
		}.	
		
// Intercambio para columna de 5.
+!intercambiar : contiguas5V(C,X,Y,X1,Y1) & steak(_,X1,Y1) & colMasTres(C,X1,Y1,NewX,NewY)
	<- .print("-----SOLICITA intercambio 5 vertical------",C,", ",NewX,", ",NewY);
	   .send(judge,tell,exchange(X1,Y1,NewX,NewY)).

// Intercambio para fila de 5.
+!intercambiar : contiguas5H(C,X,Y,X1,Y1) & steak(_,X1,Y1) & filMasTres(C,X1,Y1,NewX,NewY)
	<- .print("-----SOLICITA intercambio 5 horizontal------",C,", ",NewX,", ",NewY);
	   .send(judge,tell,exchange(X1,Y1,NewX,NewY)).

// Intercambio para T horizontal.
+!intercambiar : teH(C,X,Y,X1,X2) & steak(_,X2,Y)
	<- .print("-----SOLICITA intercambio T horizontal------",C,", ",X2,", ",Y);
	   .send(judge,tell,exchange(X1,Y,X2,Y)).

// Intercambio para T vertical.
+!intercambiar : teV(C,X,Y,Y1,Y2) & steak(_,X,Y2)
	<- .print("-----SOLICITA intercambio T vertical------",C,", ",X,", ",Y2);
	   .send(judge,tell,exchange(X,Y1,X,Y2)).	   
	   
// Intercambio para columna de 4.
+!intercambiar : contiguas4V(C,X,Y,X1,Y1) & steak(_,X1,Y1) & colMasTres(C,X1,Y1,NewX,NewY)
	<- .print("-----SOLICITA intercambio 4 vertical------",C,", ",NewX,", ",NewY);
	   .send(judge,tell,exchange(X1,Y1,NewX,NewY)).

// Intercambio para fila de 4.
+!intercambiar : contiguas4H(C,X,Y,X1,Y1) & steak(_,X1,Y1) & filMasTres(C,X1,Y1,NewX,NewY)
	<- .print("-----SOLICITA intercambio 4 horizontal------",C,", ",NewX,", ",NewY);
	   .send(judge,tell,exchange(X1,Y1,NewX,NewY)).

// Intercambio para fila de 3 por la izquierda.
+!intercambiar : contiguas3H(C,X1,X2,Y,Y) & steak(_,X1-1,Y) & tresIzda(C,X1,Y,NewX,NewY)
	<- .print("-----SOLICITA intercambio 3 izquierda------",C,", ",NewX,", ",NewY);
	   .send(judge,tell,exchange(X1-1,Y,NewX,NewY)).
	
// Intercambio para fila de 3 por la derecha.
+!intercambiar : contiguas3H(C,X1,X2,Y,Y) & steak(_,X2+1,Y) & tresDcha(C,X2,Y,NewX,NewY)
	<- .print("-----SOLICITA intercambio 3 derecha------",C,", ",NewX,", ",NewY);
	   .send(judge,tell,exchange(X2+1,Y,NewX,NewY)).
	   
// Intercambio para columna de 3 por abajo.
+!intercambiar : contiguas3V(C,X,X,Y1,Y2) & steak(_,X,Y2+1) & tresAbajo(C,X,Y2,NewX,NewY)
	<- .print("-----SOLICITA intercambio 3 abajo------",C,", ",NewX,", ",NewY);
	   .send(judge,tell,exchange(X,Y2+1,NewX,NewY)).
	
// Intercambio para columna de 3 por arriba.
+!intercambiar : contiguas3V(C,X,X,Y1,Y2) & steak(_,X2,Y1-1) & tresArriba(C,X,Y1,NewX,NewY)
	<- .print("-----SOLICITA intercambio 3 arriba------",C,", ",NewX,", ",NewY);
	   .send(judge,tell,exchange(X,Y1-1,NewX,NewY)).

// Intercambio cuadrado.
+!intercambiar : cuadradoAbajo1(C,X,Y,X1,Y1,X2,Y2) & steak(_,X1,Y1)
	<- .print("-----SOLICITA intercambio cuadrado abajo izq------",C,", ",X2,", ",Y2);
	   .send(judge,tell,exchange(X1,Y1,X2,Y2)).	   

// Intercambio cuadrado.
+!intercambiar : cuadradoAbajo2(C,X,Y,X1,Y1,X2,Y2) & steak(_,X1,Y1)
	<- .print("-----SOLICITA intercambio cuadrado abajo der------",C,", ",X2,", ",Y2);
	   .send(judge,tell,exchange(X1,Y1,X2,Y2)).	
	   
// Intercambio cuadrado.
+!intercambiar : cuadradoArriba1(C,X,Y,X1,Y1,X2,Y2) & steak(_,X1,Y1)
	<- .print("-----SOLICITA intercambio cuadrado arriba der------",C,", ",X2,", ",Y2);
	   .send(judge,tell,exchange(X1,Y1,X2,Y2)).	
	 
// Intercambio cuadrado.
+!intercambiar : cuadradoArriba2(C,X,Y,X1,Y1,X2,Y2) & steak(_,X1,Y1)
	<- .print("-----SOLICITA intercambio cuadrado arriba izq------",C,", ",X2,", ",Y2);
	   .send(judge,tell,exchange(X1,Y1,X2,Y2)).		   
*/	   
// En último caso intercambio aleatorio.
+!intercambiar 
	<- .findall(steak(Color,X,Y),steak(Color,X,Y),SteaksList);
	.length(SteaksList,SteaksLen);
	.nth(math.floor(math.random(SteaksLen)),SteaksList,steak(C,Cx,Cy));		
	?contiguas(C,Cx,Cy,NewX,NewY);
	.print("-----SOLICITA intercambio de (",Cx,",",Cy,")");
	.send(judge,tell,exchange(Cx,Cy,NewX,NewY)).

// Percepción obstáculos.	
+steak(4,X,Y)[source(S)] <- -steak(4,X,Y)[source(S)];
	+obstacle(X,Y).

// Percepción fichas especiales.
+special(X,Y,C,T)[source(S)] <- -special(X,Y,C,T)[source(S)];
	+especial(C,X,Y,T).

// Llama al plan intercambiar.
+canExchange(N) : player(N) <- +especial(32,3,0,4);
	-canExchange[source(S)]; !intercambiar.	
+tryAgain <- 
	-tryAgain[source(S)]; !intercambiar.
			
+pos(Ag,X,Y)[source(S)] <- -pos(Ag,X,Y)[source(S)].
