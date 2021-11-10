# Tres en raya

## Descripción
En esta práctica vamos a realizar comprobaciones sobre el juego tres en raya tales como el turno actual, si un movimiento es legal, los movimientos que ya hemos realizado o la acción de colocar en el tablero una "x" u "o". 
En nuestro juego comenzará siempre la "x" a jugar. Para colocar hemos utilizado coordenadas "x" e "y", por ejemplo si quieres colocar en la esquina superior izquierda del tablero pondrás (1,1) que se refiere a la primera fila y la primera columna.Si quieres colocar en el centro del tablero sería (2,2). Por ello en la función colocar deberás pasar como parámetro la letra, fila y columna donde deseas colocar y si es tu turno y está libre, es decir, el movimiento es legal devolverá True. En caso de que no sea tu turno o que esa casilla ya esté ocupada devolverá False.  
## Funcionamiento
Para ejecutar el programa debemos hacer:
	swipl Practica1/tresenraya.pl 
Una vez estamos en la consola de prolog podemos empezar a hacer las consultas, que serían:
Consultar el turno:	
```
turno(M).
```
Consultar si una casilla está libre:	
```
movlegal(1,1).
```
Colocar la letra "x" en la posición (1,1):
```	
colocar(x,1,1).
```
Consultar si se ha ganado la partida:
```
gana(x).
```
## Realizado con 

* [Prolog](https://www.swi-prolog.org) - Lenguaje de programación lógica

## Autores ✒️

* **José Morán Nebot** - [Butusen](https://github.com/Butusen)
* **Miguel Melero Bernal** -[mikimb99](https://github.com/mikimb99)

## Licencias 

Copyright [2021] [José Morán Nebot y Miguel Melero Bernal]
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
[apache](http://www.apache.org/licenses/LICENSE-2.0)
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
