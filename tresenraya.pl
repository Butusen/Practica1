%Copyright [2021] [José Morán Nebot &  Miguel Melero Bernal] Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at apache Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

%declaramos la lista & el turno ya que van cambiando durante la ejecución
:- dynamic lista/1.
:- dynamic turno/1.

%en la regla gana incluimos las tres formas de posibles de ganar (fila, columna o diagonal), además de mostrar por pantalla con que letra ha ganado.
gana(Letra):-
                (ganafila(Letra);
                ganacolumna(Letra);
                ganadiagonal(Letra)),
                write("Has ganado con la letra:"),
		write(Letra).


%se empatará en caso de que no se haya ganado &  se hayan colocado todas las fichas en el tablero
empate(Letra):-
                (lista(M),
                length(M,9),
                \+gana(x),
                \+gana(o)),
                write("Has empatado").

		
%regla para ganar mediante la fila
ganafila(Letra) :-
			lista(M),
			((member((1,Letra),M),member((2,Letra),M),member((3,Letra),M),!);
			(member((4,Letra),M),member((5,Letra),M),member((6,Letra),M),!);
			(member((7,Letra),M),member((8,Letra),M),member((9,Letra),M),!)).
		 
%regla para ganar mediante la columna
ganacolumna(Letra) :-
			lista(M),
			((member((1,Letra),M),member((4,Letra),M),member((7,Letra),M),!);
			(member((2,Letra),M),member((5,Letra),M),member((8,Letra),M),!);
			(member((3,Letra),M),member((6,Letra),M),member((9,Letra),M),!)).
			
%regla para ganar mediante la diagonal
ganadiagonal(Letra) :-
			lista(M),
			((member((1,Letra),M),member((5,Letra),M),member((9,Letra),M),!);
			(member((3,Letra),M),member((5,Letra),M),member((7,Letra),M),!)).			

%en esta reglas borramos los turnos anteriores, decimos que le toca a x u o con el assert
siguienteturno(x) :-
			retractall(turno(_T)),
			assert(turno(o)).
siguienteturno(o) :-
			retractall(turno(_T)),
                        assert(turno(x)).
			
%Aquí se comprueba si te permite colocar o no, es decir, si es tu turno & la casilla está vacía entonces insertará la Posición (se extrae de la fila & columna) & finalmente cambiará
%de turno. En caso de que no se cumpla el turno o que la casilla esté vacía devolverá False.
colocar(Letra,Fila,Columna) :-
				turno(Letra),
				movlegal(Fila,Columna),
				numero(Fila,Columna,Posicion),
				insertar(Posicion,Letra),
				siguienteturno(Letra).	
				
%En esta regla borramos la anterior lista & metemos en una nueva lista la Posicion & Letra junto con los elementos de la antigua lista.		
insertar(Posicion,Letra):-
				lista(M),
				retractall(lista(M)),
				assert(lista([(Posicion,Letra)|M])).
				
%Aquí comprobaremos si se permite ese movimiento o no, esto se hace con la función member, para ver si esa Posición ya se encuentra en la lista por lo que no se podría colocar o en
%caso de que no pertenezca a la lista te devuelva True. 
movlegal(Fila,Columna):- 
				lista(L),
				numero(Fila,Columna,Posicion),
				\+ member((Posicion,_),L).
				
%Facts
%en número se declararán las posiciones del tablero, tomando la fila & columna como coordenadas & asignandoles un número para cada tupla.
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

