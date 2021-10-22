% FACTS

Jugador('X').
Jugador('O').


gana(Tabla,Jugador):- 
		ganafila(Tabla,Jugador);
		ganacolumna(Tabla,Jugador);
		ganadiagonal(Tabla,Jugador).

ganafila(Tabla,Jugador) :-
		Tabla = [Jugador,Jugador,Jugador,_,_,_,_,_,_];
		Tabla = [_,_,_,Jugador,Jugador,Jugador,_,_,_];
		Tabla = [_,_,_,_,_,_,Jugador,Jugador,Jugador]. 

ganacolumna(Tabla,Jugador) :-
		Tabla = [Jugador,_,_,Jugador,_,_,Jugador,_,_];
		Tabla = [_,Jugador,_,_,Jugador,_,_,Jugador,_];
		Tabla = [_,_,Jugador,_,_,Jugador,_,_,Jugador].

ganadiagonal(Tabla,Jugador) :-
		Tabla = [Jugador,_,_,_,Jugador,_,_,_,Jugador];
		Tabla = [_,_,Jugador,_,Jugador,_,Jugador,_,_].


  
