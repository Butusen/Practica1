
%declaramos la lista & el turno ya que van cambiando durante la ejecución
:- dynamic lista/1.
:- dynamic turno/1.

%en el método gana incluimos las tres formas de ganar que tenemos
gana(Letra):- 
		ganafila(Letra);
		ganacolumna(Letra);
		ganadiagonal(Letra).
		
		
%función para ganar mediante la fila
ganafila(Letra) :-
			lista(M),
			((member((1,Letra),M),member((2,Letra),M),member((3,Letra),M),!);
			(member((4,Letra),M),member((5,Letra),M),member((6,Letra),M),!);
			(member((7,Letra),M),member((8,Letra),M),member((9,Letra),M),!)).
		 
%función para ganar mediante la columna
ganacolumna(Letra) :-
			lista(M),
			((member((1,Letra),M),member((4,Letra),M),member((7,Letra),M),!);
			(member((2,Letra),M),member((5,Letra),M),member((8,Letra),M),!);
			(member((3,Letra),M),member((6,Letra),M),member((9,Letra),M),!)).
			
%función para ganar mediante la diagonal
ganadiagonal(Letra) :-
			lista(M),
			((member((1,Letra),M),member((5,Letra),M),member((9,Letra),M),!);
			(member((3,Letra),M),member((5,Letra),M),member((7,Letra),M),!)).
			
%en esta función borramos los turnos anteriores decimos que le toca a x u o con el assert
siguienteturno(x) :-
			retractall(turno(_T)),
			assert(turno(o)).
siguienteturno(o) :-
			retractall(turno(_T)),
                        assert(turno(x)).
			
%Aquí se comprueba si te permite colocar o no, es decir, si es tu turno o no lo es. En caso de que lo sea,
%entonces podrás pasar a la función de insertar, en otro caso dará false
colocar(Letra,Fila,Columna) :-
				turno(Letra),
				movlegal(Fila,Columna),
				numero(Fila,Columna,Posicion),
				insertar(Posicion,Letra),
				siguienteturno(Letra).	
				
%En esta función insertamos el turno en el tablero(lista) en caso de que sea nuestro turno 		
insertar(Posicion,Letra):-
				lista(M),
				retractall(lista(M)),
				assert(lista([(Posicion,Letra)|M])).
				
%Aquí comprobaremos si se permite ese movimiento o no, esto se hace gracias a la comprobación de member con la que 
%comprobaremos que no está ocupada la posición
movlegal(Fila,Columna):- 
				lista(L),
				numero(Fila,Columna,Posicion),
				\+ member((Posicion,_),L).
				
%Facts
%en número se declararán las posiciones del tablero, tomando como la primera posición la 1,1 hasta la 3,3
numero(1,1,1).
numero(1,2,2).
numero(1,3,3).
numero(2,1,4).
numero(2,2,5).
numero(2,3,6).
numero(3,1,7).
numero(3,2,8).
numero(3,3,9).		
%comienza siempre la x 
turno(x). 
%lista donde aparecerá el tablero
lista([]). 

