% FACTS
%Metodo de ganar cambiar entero, siguiente turno, metodo disponible?
% Comprobación movimiento legal, movlegal(poner(F,X,Y)) :- turno(F), \+ casilla(_F2,X,Y). 

:- dynamic lista/1.
:- dynamic turno/1.
gana(Letra):- 
		ganafila(Letra);
		ganacolumna(Letra);
		ganadiagonal(Letra),
		!.

ganafila(Letra) :-
			lista(M),
			(member((1,Letra),M),member((2,Letra),M),member((3,Letra),M),!);
			(member((4,Letra),M),member((5,Letra),M),member((6,Letra),M),!);
			(member((7,Letra),M),member((8,Letra),M),member((9,Letra),M),!).
		 

ganacolumna(Letra) :-
			lista(M),
			(member((1,Letra),M),member((4,Letra),M),member((7,Letra),M),!);
			(member((2,Letra),M),member((5,Letra),M),member((8,Letra),M),!);
			(member((3,Letra),M),member((6,Letra),M),member((9,Letra),M),!).

ganadiagonal(Letra) :-
			lista(M),
			(member((1,Letra),M),member((5,Letra),M),member((9,Letra),M),!);
			(member((3,Letra),M),member((5,Letra),M),member((7,Letra),M),!).

siguienteturno(x) :-
			retractall(turno(_T)),
			assert(turno(o)).
siguienteturno(o) :-
			retractall(turno(_T)),
                        assert(turno(x)).
			
colocar(Letra,Fila,Columna) :-
				turno(Letra),
				movlegal(Fila,Columna),
				numero(Fila,Columna,Posicion),
				insertar(Posicion,Letra),
				siguienteturno(Letra).			
			
insertar(Posicion,Letra):-
				lista(M),
				retractall(lista(M)),
				assert(lista([(Posicion,Letra)|M])).
	
movlegal(Fila,Columna):- 
				lista(L),
				numero(Fila,Columna,Posicion),
				\+ member((Posicion,_),L).
numero(1,1,1).
numero(1,2,2).
numero(1,3,3).
numero(2,1,4).
numero(2,2,5).
numero(2,3,6).
numero(3,1,7).
numero(3,2,8).
numero(3,3,9).		
turno(x).
lista([]).


