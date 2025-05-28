Hechos, Átomos y Reglas
En Prolog, los programas se construyen mediante hechos, átomos y reglas. Estos elementos son la base de la programación lógica en Prolog y permiten representar el conocimiento y definir relaciones entre distintos elementos.

1. Hechos
Los hechos representan afirmaciones o declaraciones que se consideran verdaderas en el programa. Los hechos se utilizan para describir propiedades o relaciones entre elementos. Un hecho es una sentencia simple que no requiere ser probada, ya que se asume que es verdadera en el contexto de la base de datos.

Ejemplos de hechos:

   % Representa que "Juan es un hombre"
   hombre(juan).

   % Representa que "María es mujer"
   mujer(maria).

   % Representa una relación de parentesco "Juan es padre de María"
   padre(juan, maria).
En estos ejemplos:

`hombre(juan)` es un hecho que indica que Juan es un hombre.
`mujer(maria)` indica que María es una mujer.
`padre(juan, maria)` indica que Juan es el padre de María.
Los hechos se escriben en minúsculas y sin variables, ya que simplemente representan afirmaciones que se consideran verdaderas.

2. Átomos
Un átomo es un tipo de dato básico en Prolog que representa una constante simbólica, similar a un nombre o una etiqueta. Los átomos son entidades indivisibles, y Prolog los usa para identificar hechos, valores o constantes simbólicas.

Los átomos pueden ser:

Palabras en minúsculas sin espacios (`juan`, `maria`, `perro`).
Cadenas de caracteres entre comillas simples (`'Juan Pérez'`, `'esto es un átomo'`).
Secuencias especiales con caracteres como `@`, `#`, etc. (`@ejemplo`, `#dato`).
Ejemplos de átomos:

   % Nombres simples
   hombre(juan).
   color(rojo).

   % Nombres con caracteres especiales
   gato('Amichi').
   palabra('#clave').

   % Nombres con comillas
   nombre('Juan Pérez').
Importante: Los átomos se diferencian de las variables porque los átomos están en minúscula y representan constantes, mientras que las variables están en mayúscula y representan valores que pueden cambiar.

3. Reglas
Las reglas permiten definir relaciones lógicas entre hechos y se utilizan para derivar nueva información. Una regla consiste en una cabeza y un cuerpo, y su estructura general es:

   cabeza :- cuerpo.
La cabeza es el resultado o conclusión de la regla, mientras que el cuerpo es una combinación de condiciones que deben cumplirse para que la cabeza sea verdadera. Las reglas en Prolog son como "si-entonces"; si se cumplen las condiciones en el cuerpo, entonces la cabeza también es cierta.

Ejemplos de reglas:

   % Definición de "padre" y "abuelo" mediante reglas
   padre(juan, maria).                  % Hecho: Juan es padre de María
   padre(jose, juan).                   % Hecho: José es padre de Juan

   abuelo(X, Y) :- padre(X, Z), padre(Z, Y).
En este ejemplo:

`padre(juan, maria)` y `padre(jose, juan)` son hechos que definen relaciones directas de parentesco.
La regla `abuelo(X, Y) :- padre(X, Z), padre(Z, Y).` define que `X` es abuelo de `Y` si `X` es padre de `Z` y `Z` es padre de `Y`.
Explicación de la regla:

`abuelo(X, Y)` es la cabeza de la regla.
`padre(X, Z), padre(Z, Y)` es el cuerpo de la regla, que indica que para que `X` sea abuelo de `Y`, debe existir un `Z` tal que `X` sea padre de `Z` y `Z` sea padre de `Y`.
4. Ejemplos adicionales para comprender hechos, átomos y reglas
Hecho: `esamigo(juan, maria).` – Juan es amigo de María.
Átomo: `rojo` en `color(rojo).` – Un color específico.
Regla: `esfeliz(X) :- esrico(X), tienesalud(X).` – Una persona `X` es feliz si es rica y tiene salud.
5. Ejecución de consultas en Prolog
Las consultas en Prolog se utilizan para obtener información a partir de hechos y reglas. Cuando haces una consulta, Prolog intenta unificar la consulta con los hechos y reglas disponibles para determinar si la consulta es verdadera o para encontrar valores de las variables que hagan que sea verdadera.

Ejemplo de consulta:

   ?- abuelo(jose, maria).
   true.

   ?- padre(X, maria).
   X = juan.
En la primera consulta, Prolog verifica si `jose` es abuelo de `maria` usando la regla definida. En la segunda consulta, Prolog busca el valor de `X` que hace que `padre(X, maria)` sea verdadero, unificando `X` con `juan`.

Hechos: Declaraciones de relaciones o propiedades que se consideran verdaderas.
Átomos: Constantes simbólicas que representan nombres o valores específicos en Prolog.
Reglas: Estructuras que permiten inferir nueva información mediante condiciones lógicas.
Unificación en Prolog
La unificación es uno de los conceptos fundamentales en Prolog y es el proceso mediante el cual el lenguaje determina si dos términos pueden hacerse iguales. Este proceso es esencial para el funcionamiento de las consultas y reglas en Prolog, ya que permite enlazar variables con valores específicos y evaluar la compatibilidad entre términos.

1. ¿Qué es la unificación?
La unificación en Prolog ocurre cuando intentamos "igualar" dos términos. Si los términos pueden unirse o emparejarse siguiendo las reglas de Prolog, decimos que se "unifican" y el intérprete establece correspondencias entre variables y valores que cumplen con la igualdad.

Por ejemplo:

?- X = 5.
X = 5.
Aquí, Prolog unifica la variable X con el valor 5, es decir, establece que X ahora representa el valor 5.

2. Reglas de unificación
La unificación en Prolog sigue ciertas reglas:

Dos constantes se unifican si y solo si son idénticas. Ejemplo:

     ?- 3 = 3.
     true.
     
     ?- 3 = 4.
     false.
Una variable se puede unificar con cualquier valor. Si una variable no tiene un valor asignado, Prolog puede unirla con cualquier término.

     ?- X = 5.
     X = 5.
Dos variables pueden unificarse entre sí. Cuando dos variables se unifican, ambas quedan enlazadas y cualquier valor que se asigne a una también afectará a la otra.

     ?- X = Y.
     X = Y.
Unificamos listas y estructuras término a término. Las listas y estructuras (también llamadas compuestos) se unifican si tienen la misma cantidad de elementos y cada elemento correspondiente también se unifica.
3. Ejemplos de unificación
a) Unificación de constantes
   ?- hola = hola.
   true.

   ?- hola = adios.
   false.
Aquí, solo la primera consulta unifica porque ambos términos son idénticos.

b) Unificación de variables
Las variables en Prolog pueden unificarse con cualquier valor que no contradiga otros enlaces:

   ?- X = 42.
   X = 42.

   ?- X = Y.
   X = Y.
c) Unificación de listas
Para listas, Prolog trata de unificar cada elemento individualmente:

   ?- [1, 2, 3] = [1, X, Y].
   X = 2.
En este caso, `X` se unifica con `2` para que ambas listas sean iguales.

d) Unificación de estructuras o términos compuestos
Prolog permite trabajar con estructuras que siguen una sintaxis de "functor(argumento1, argumento2, …)".

   ?- punto(X, Y) = punto(3, 4).
   X = 3,
   Y = 4.
Aquí, `X` y `Y` se unifican con `3` y `4`, respectivamente, haciendo que ambas estructuras sean idénticas.

a*** 4. Casos en los que la unificación falla

La unificación falla cuando:

Los términos son distintos y no tienen variables que puedan unificarse con otros valores.
Los términos tienen estructuras diferentes (diferente número de argumentos o diferentes functors).
Ejemplo de fallos en la unificación:

   ?- perro(orejas, cola) = gato(orejas, cola).
   false.

   ?- [1, 2, 3] = [1, 2].
   false.
5. Importancia de la unificación en Prolog
La unificación es la base de la búsqueda de soluciones en Prolog, ya que permite enlazar valores con variables dentro de las consultas y reglas. Gracias a la unificación, Prolog puede "probar" términos y hacer coincidencias, lo que es esencial en la resolución de problemas lógicos.

6. Ejemplo práctico
Supongamos que queremos consultar si un punto `(3, 4)` coincide con un término `punto(X, Y)`:

padre(juan, maria).

?padre(juan, X).

padre(juan, X) = padre(juan, maria)

juan = juan X = maria

maria

   ?- punto(X, Y) = punto(3, 4).
   X = 3,
   Y = 4.
Aquí, la unificación permite asignar `X = 3` y `Y = 4`, logrando que ambos términos sean idénticos.

Resumen
La unificación en Prolog es el proceso de hacer iguales dos términos, enlazando variables con valores específicos cuando es posible. Este proceso es fundamental para las consultas y reglas, permitiendo que Prolog resuelva problemas y encuentre soluciones.

Corte
El corte es un predicado predefinido que no recibe argumentos. Se representa mediante un signo de admiración (!). Sin duda, es el predicado más difícil de entender. El corte tiene la espantosa propiedad de eliminar los puntos de elección del predicado que lo contiene.

Es decir, cuando se ejecuta el corte, el resultado del objetivo (no sólo la cláusula en cuestión) queda comprometido al éxito o fallo de los objetivos que aparecen a continuación. Es como si a Prolog "se le olvidase" que dicho objetivo puede tener varias soluciones.

Otra forma de ver el efecto del corte es pensar que solamente tiene la propiedad de detener el backtracking cuando éste se produce. Es decir, en la ejecución normal el corte no hace nada. Pero cuando el programa entra en backtracking y los objetivos se recorren marcha atrás, al llegar al corte el backtracking se detiene repentinamente forzando el fallo del objetivo.

Para entender de manera simple el uso del corte vamos a comparar dos predicados que solamente se diferencian en un corte:

 % Sin corte. 
 p(X,Y) :- X > 15, Y > 50. 
 p(X,Y) :- X > Y, 

 % Con corte.
 q(X,Y) :- X > 15, !, Y > 50. 
 q(X,Y) :- X > Y, 

Veamos que ocurre si ejecutamos el objetivo p(25,12):

Obsérve que ambas cláusulas unifican con la cabeza, luego existen dos puntos de elección que se anotan.
Prolog entra por el primer punto de elección (primera cláusula) eliminandolo.
Prolog ejecuta el primer objetivo del cuerpo (X>15), que tiene éxito.
Prolog ejecuta el segundo objetivo del cuerpo (X>50), que falla.
Empieza el backtracking.
Se recorren ambos objetivos hacia atrás pero no hay variables que se hayan ligado en ellos.
Encontramos el segundo punto de elección (segunda cláusula) que detiene el backtracking eliminandolo en el proceso. La ejecución continúa hacia delante.
Prolog ejecuta el cuerpo de la segunda cláusula que consiste en X>Y. Este objetivo tiene éxito.
El objetivo p(25,12) tiene éxito.
Ahora comprobamos lo que ocurre cuando éxiste el corte, ejecutamos q(25,12):

Ambas cláusulas unifican con la cabeza, luego existen dos puntos de elección que se anotan.
Prolog entra por el primer punto de elección (primera cláusula) eliminandolo.
Prolog ejecuta el primer objetivo del cuerpo (X>15), que tiene éxito.
Se ejecuta el segundo objetivo del cuerpo que es el corte. Por tanto, se eliminan todos los puntos de elección anotados que son debidos al objetivo q(25,12). Solamente teníamos uno, que se elimina.
Prolog ejecuta el tercer objetivo del cuerpo (X>50), que falla.
Empieza el backtracking.
Se recorren ambos objetivos hacia atrás pero no hay variables que se hayan ligado en ellos.
No encontramos ningún punto de elección porque fueron eliminados por el corte.
El objetivo p(25,12) falla.
Como puede comprobar, los resultados son sustacialmente diferentes. La segunda cláusula del predicado q/2 ni siquiera ha llegado a ejecutarse porque el corte ha comprometido el resultado del objetivo al resultado de Y>15 en la primera cláusula.

Usos del corte
El corte se utiliza muy frecuentemente, cuanto más diestro es el programador más lo suele usar. Los motivos por los que se usa el corte son, por orden de importancia, los siguientes:

Para optimizar la ejecución. El corte sirve para evitar que por culpa del backtracking se exploren puntos de elección que, con toda seguridad, no llevan a otra solución (fallan). Para los entendidos, esto es podar el árbol de búsqueda de posibles soluciones.
Para facilitar la legibilidad y comprensión del algoritmo que está siendo programado. A veces se situan cortes en puntos donde, con toda seguridad, no van a existir puntos de elección para eliminar, pero ayuda a entender que la ejecución sólo depende de la cláusula en cuestión.
Para implementar algoritmos diferentes según la combinación de argumentos de entrada. Algo similar al comportamiento de las sentencias case en los lenguajes imperativos.
Para conseguir que un predicado solamente tenga una solución. Esto nos puede interesar en algún momento. Una vez que el programa encuentra una solución ejecutamos un corte. Así evitamos que Prolog busque otras soluciones aunque sabemos que éstas existen.
Corte y fallo
Es muy habitual encontrar la secuencia de objetivos corte-fallo: !,fail. El predicado fail/0 es un predicado predefinido que siempre falla. Se utiliza para detectar prematuramente combinaciones de los argumentos que no llevan a solución, evitando la ejecución de un montón de código que al final va a fallar de todas formas.

fib(0, 1) :- !.
fib(1, 1) :- !.
fib(N, F) :- N > 1, N1 is N-1,  N2 is N-2, fib(N1, F1), fib(N2, F2),
        F is F1+F2.
Definición matemática del factorial
Matemáticamente, el factorial de N
 (denotado como N!
) se define como:

Caso base: 0!=1
Caso recursivo: N!=N×(N−1)!
 para N>0
Implementación en Prolog
La implementación en Prolog sigue esta definición. Usamos una regla recursiva donde el caso base define que el factorial de 0 es 1, y el caso recursivo multiplica N
 por el factorial de N−1
.

   % Caso base: el factorial de 0 es 1
   factorial(0, 1) = !.

   % Caso recursivo: factorial de N es N * factorial de (N-1)
   factorial(N, F) :-
       N > 0,                           % Comprobación para asegurar que N es positivo
       N1 is N - 1,                     % Calcular N - 1
       factorial(N1, F1),               % Llamada recursiva para obtener factorial de N - 1
       F is N * F1.                     % Calcular el factorial de N
Ejemplo de uso
Para calcular el factorial de 5, usamos una consulta que unifica la variable `F` con el resultado:

   ?- factorial(5, F).  F = 120.
Prolog realiza la recursión de la siguiente manera:

Calcula `factorial(5, F)`.
Llama recursivamente a `factorial(4, F1)`, `factorial(3, F2)`, etc., hasta llegar a `factorial(0, 1)`.
Luego, cada llamada recursiva se resuelve multiplicando el valor, acumulando el resultado y regresando el valor final.
Explicación paso a paso del proceso recursivo
Para entender cómo se realiza la recursión, observa la secuencia de llamadas al calcular `factorial(3, F)`:

`factorial(3, F)` llama a `factorial(2, F1)`.
`factorial(2, F1)` llama a `factorial(1, F2)`.
`factorial(1, F2)` llama a `factorial(0, 1)`.
Al retornar, Prolog realiza las multiplicaciones:
`F2 = 1 * 1 = 1` para `factorial(1, 1)`.
`F1 = 2 * 1 = 2` para `factorial(2, 2)`.
`F = 3 * 2 = 6` para `factorial(3, 6)`.
Resumen
Caso base: Define el factorial de 0 como 1.
Caso recursivo: Define el factorial de N
 multiplicando N
 por el factorial de N−1
.
Esta implementación es un ejemplo clásico de recursión en Prolog y muestra cómo se usa el concepto de llamada recursiva para calcular valores acumulativos.

Factorial en Prolog
factorial(0, 1).  
factorial(N, F) :-  
    N > 0,  
    N1 is N - 1,  
    factorial(N1, F1),  
    F is N * F1.
Prueba de escritorio para factorial(3, F)
Llamada	N	N1	F1	F
factorial(3, F)	3	2	?	?
factorial(2, F1)	2	1	?	?
factorial(1, F1)	1	0	?	?
factorial(0, 1)	0	-	1	-
factorial(1, 1)	1	0	1	1
factorial(2, 2)	2	1	1	2
factorial(3, 6)	3	2	2	6
Resultado final: factorial(3,6)
Unificación en cada paso

Se llama factorial(3, F), N=3, unifica con la segunda regla.

Se calcula N1 is 3-1, unifica N1=2, se llama factorial(2, F1).

Se calcula N1 is 2-1, unifica N1=1, se llama factorial(1, F1).

Se calcula N1 is 1-1, unifica N1=0, se llama factorial(0, 1).

factorial(0,1) unifica con la primera regla, retorna F1=1.

Retrocede, F is 1*1, unifica F=1 para factorial(1,1).

Retrocede, F is 2*1, unifica F=2 para factorial(2,2).

Retrocede, F is 3*2, unifica F=6 para factorial(3,6).

Resultado final: factorial(3,6).

Fibonacci en Prolog
fibonacci(0, 0).  
fibonacci(1, 1).  
fibonacci(N, F):- N > 1, N1 is N - 1,  N2 is N - 2, fibonacci(N1, F1),fibonacci(N2, F2),
                  F is F1 + F2.
Prueba de escritorio para fibonacci(4, F)
Llamada	N	N1	N2	F1	F2	F
fibonacci(4, F)	4	3	2	?	?	?
fibonacci(3, F1)	3	2	1	?	?	?
fibonacci(2, F1)	2	1	0	?	?	?
fibonacci(1, 1)	1	-	-	1	-	1
fibonacci(0, 0)	0	-	-	0	-	0
fibonacci(2, 1)	2	1	0	1	0	1
fibonacci(3, 2)	3	2	1	1	1	2
fibonacci(4, 3)	4	3	2	2	1	3
Resultado final: fibonacci(4,3)
Unificación en cada paso fibonacci(4, F), unifica con la tercera regla.

N1 is 4-1=3, N2 is 4-2=2, llama fibonacci(3, F1), fibonacci(2, F2).

fibonacci(3, F1), N1 is 3-1=2, N2 is 3-2=1, llama fibonacci(2, F1), fibonacci(1, F2).

fibonacci(2, F1), N1 is 2-1=1, N2 is 2-2=0, llama fibonacci(1, 1), fibonacci(0, 0).

fibonacci(1, 1) y fibonacci(0, 0) unifican con las primeras reglas.

Retrocede, F is 1+0=1 en fibonacci(2,1).

Retrocede, F is 1+1=2 en fibonacci(3,2).

Retrocede, F is 2+1=3 en fibonacci(4,3).

Resultado final: fibonacci(4,3).

Listas en Prolog
1. Definición y construcción de listas
En Prolog, una lista se representa como una secuencia de elementos entre corchetes. Algunos ejemplos de listas son:

   []             % Lista vacía
   [1, 2, 3]      % Lista de números
   [a, b, c]      % Lista de átomos
   [H | T]        % Lista con cabeza `H` y cola `T`
La lista `[H | T]` indica que `H` es el primer elemento (cabeza) y `T` es la cola (el resto de los elementos de la lista).

2. Operaciones básicas en listas
a) Concatenación de listas
Para concatenar dos listas en Prolog, puedes definir una regla recursiva llamada `concatenar`:

    concatenar([], L, L).                        
    concatenar([H | T], L, [H | R]) :- concatenar(T, L, R).
Ejemplo de uso:

    ?- concatenar([1, 2], [3, 4], L).
    L = [1, 2, 3, 4].
b) Encontrar el tamaño de una lista
Para encontrar el tamaño de una lista, usamos una regla `tamano`:

    tamano([], 0).                               
    tamano([_ | T], N) :-tamano(T, N1), N is N1 + 1.                             
Ejemplo de uso:

    ?- tamano([1, 2, 3], N).
    N = 3.
** Explicación del funcionamiento del contador La regla `tamano` cuenta el número de elementos en la lista usando recursión y un contador acumulativo.

En el caso base `tamano([], 0).`, la lista vacía tiene un tamaño de `0`.
En la cláusula recursiva `tamano([_ | T], N) :- tamano(T, N1), N is N1 + 1.`:
Primero, se llama a `tamano(T, N1)` para contar el tamaño de la cola `T`.
Al volver de la recursión, `N1` contiene el tamaño de `T`, al cual se suma `1` para contar el elemento de la cabeza.
Esta suma (`N is N1 + 1`) es el nuevo tamaño de la lista completa `[H | T]`.
c) Obtener el último elemento de una lista
Para obtener el último elemento de una lista, usamos la regla `ultimo`:

    ultimo([X], X).                              
    ultimo([_ | T], X) :- ultimo(T, X).
Ejemplo de uso:

    ?- ultimo([1, 2, 3], X).
    X = 3.
d) Obtener el primer elemento de una lista
El primer elemento de una lista es simplemente la cabeza de la lista, que se puede obtener así:

    primer_elemento([H | _], H).
Ejemplo de uso:

    ?- primer_elemento([1, 2, 3], X).
    X = 1.
e) Invertir una lista
Para invertir una lista, utilizamos una regla `invertir` que emplea acumuladores para construir la lista invertida:

    invertir(L, R) :-
        invertir_acum(L, [], R).

    invertir_acum([], Acc, Acc).                 
    invertir_acum([H | T], Acc, R) :-            
        invertir_acum(T, [H | Acc], R).
Ejemplo de uso:

    ?- invertir([1, 2, 3], L).
    L = [3, 2, 1].
3. Otras operaciones comunes
a) Verificar si un elemento pertenece a una lista
Para verificar si un elemento está en una lista, usamos la regla `miembro`:

    miembro(X, [X | _]).                         
    miembro(X, [_ | T]) :- miembro(X, T).
Ejemplo de uso:

    ?- miembro(2, [1, 2, 3]).
    true.
    ?- miembro(4, [1, 2, 3]).
    false.
b) Eliminar un elemento de una lista
La siguiente regla `eliminar` elimina una ocurrencia de un elemento de una lista:

    eliminar(X, [X | T], T).                     
    eliminar(X, [H | T], [H | R]) :-             
        eliminar(X, T, R).
Ejemplo de uso:

    ?- eliminar(2, [1, 2, 3], L).
    L = [1, 3].
c) Insertar un elemento en una lista
Para insertar un elemento en cualquier posición de una lista, definimos una regla `insertar`:

    insertar(X, L, [X | L]).                     
    insertar(X, [H | T], [H | R]) :-             
        insertar(X, T, R).
Ejemplo de uso:

    ?- insertar(4, [1, 2, 3], L).
    L = [4, 1, 2, 3].
d) Verificar si una lista es un sublista de otra
Para verificar si una lista `Sub` es sublista de `L`, usamos la regla `sublista`:

    sublista([], _).                             
    sublista([H | T], [H | T2]) :-               
        sublista(T, T2).
    sublista(Sub, [_ | T]) :-                    
        sublista(Sub, T).
Ejemplo de uso:

    ?- sublista([2, 3], [1, 2, 3, 4]).
    true.
4. Ejemplos adicionales y casos de uso
Prolog permite expresar fácilmente otras operaciones sobre listas, como el filtrado de elementos que cumplen una condición específica o el uso de listas en combinaciones y permutaciones.

a) Filtrar elementos mayores a un valor
Definamos `filtrarmayores` para obtener elementos mayores a un valor `N`:

    filtrar_mayores(_, [], []).                         
    filtrar_mayores(N, [H | T], [H | R]) :-             
        H > N,
        filtrar_mayores(N, T, R).
    filtrar_mayores(N, [_ | T], R) :-                   
        filtrar_mayores(N, T, R).
Ejemplo de uso:

    ?- filtrar_mayores(2, [1, 3, 5, 2], L).
    L = [3, 5].
Cálculo del factorial en Prolog
El cálculo del factorial de un número N
 se define como el producto de todos los números enteros positivos desde 1
 hasta N
. En Prolog, podemos implementar esta operación utilizando una regla recursiva.

Ejercicios
Problema: Los hermanos y sus mascotas
Cuatro hermanos (Ana, Bruno, Carla y Daniel) tienen cada uno una mascota diferente (perro, gato, loro y pez). Sabemos que:

Ana no tiene un perro ni un pez.
Bruno no tiene un gato.
Carla tiene un animal que no es el pez.
Daniel tiene un loro o un pez.
Pregunta: ¿Qué mascota tiene cada hermano?
Representación en Prolog: Define los hermanos y las mascotas como individuos. Utiliza reglas y hechos basados en las pistas para determinar qué mascota tiene cada hermano.

Objetivo: Escribir un programa en Prolog que determine la asignación correcta de mascotas para cada hermano en función de las pistas dadas.

Solución
% Definimos los hermanos y las mascotas posibles
hermano(ana).
hermano(bruno).
hermano(carla).
hermano(daniel).

mascota(perro).
mascota(gato).
mascota(loro).
mascota(pez).

% Regla que establece que cada hermano tiene una mascota única
tiene_mascota(Hermano, Mascota) :-
    hermano(Hermano),
    mascota(Mascota).

% Restricciones específicas según las pistas
restricciones :-
    tiene_mascota(ana, MascotaAna),
    MascotaAna \= perro,
    MascotaAna \= pez,

    tiene_mascota(bruno, MascotaBruno),
    MascotaBruno \= gato,

    tiene_mascota(carla, MascotaCarla),
    MascotaCarla \= pez,

    tiene_mascota(daniel, MascotaDaniel),
    (MascotaDaniel = loro ; MascotaDaniel = pez).

% Regla para asegurar que todos tienen mascotas distintas
todos_diferentes(MascotaAna, MascotaBruno, MascotaCarla, MascotaDaniel) :-
    MascotaAna \= MascotaBruno,
    MascotaAna \= MascotaCarla,
    MascotaAna \= MascotaDaniel,
    MascotaBruno \= MascotaCarla,
    MascotaBruno \= MascotaDaniel,
    MascotaCarla \= MascotaDaniel.

% Mostrar resultados
mostrar_resultados(MascotaAna, MascotaBruno, MascotaCarla, MascotaDaniel) :-
    format('Ana tiene un ~w~n', [MascotaAna]),
    format('Bruno tiene un ~w~n', [MascotaBruno]),
    format('Carla tiene un ~w~n', [MascotaCarla]),
    format('Daniel tiene un ~w~n', [MascotaDaniel]).

% Regla principal que resuelve el problema
resolver :-
    tiene_mascota(ana, MascotaAna),
    tiene_mascota(bruno, MascotaBruno),
    tiene_mascota(carla, MascotaCarla),
    tiene_mascota(daniel, MascotaDaniel),
    restricciones,
    todos_diferentes(MascotaAna, MascotaBruno, MascotaCarla, MascotaDaniel),
    mostrar_resultados(MascotaAna, MascotaBruno, MascotaCarla, MascotaDaniel).

Problema: Los investigadores y sus descubrimientos
Cinco investigadores (Alonso, Beatriz, Carlos, Diana y Eduardo) han hecho descubrimientos importantes en cinco áreas diferentes de la ciencia (astronomía, biología, química, física y geología) y cada uno es originario de un país distinto (México, España, Canadá, Japón y Alemania). Cada investigador tiene un instrumento favorito (microscopio, telescopio, acelerador, sismógrafo y espectrómetro) y una especialidad secundaria (botánica, genética, oceanografía, paleontología y vulcanología).

Las siguientes pistas te ayudarán a deducir qué descubrimiento hizo cada investigador, su país de origen, su instrumento favorito y su especialidad secundaria:

Carlos no es de México ni de Canadá, y no estudia biología.
La persona que usa el telescopio es de Japón y trabaja en astronomía, pero no es Diana.
Beatriz es experta en botánica y no es de España ni de Japón.
La persona que usa el microscopio trabaja en biología y no es de Alemania ni de España.
El investigador de física es de México y utiliza el acelerador.
El especialista en genética usa el espectrómetro y no es Eduardo.
El investigador de Canadá se dedica a la geología.
Eduardo estudia vulcanología y no utiliza el telescopio.
Alonso es el experto en oceanografía.
El investigador de Alemania utiliza un sismógrafo.
Pregunta: ¿Cuál es el descubrimiento de cada investigador, su país de origen, su instrumento favorito y su especialidad secundaria?

Variables Anónimas en Prolog
En Prolog, las variables anónimas se representan mediante el guion bajo ( _ ). Estas variables son útiles cuando no necesitamos almacenar un valor específico y solo queremos que el predicado se ejecute sin importar el valor de esa variable.

Características de las Variables Anónimas
Una variable anónima ( _ ) es una variable "sin nombre".
No almacena ningún valor.
Cada vez que aparece en una expresión, se trata como una variable completamente nueva.
Es útil cuando una parte del predicado no es relevante y solo queremos que coincida.
Ejemplo
Supongamos que tenemos un predicado `padre/2`, que indica una relación entre un padre y su hijo:

padre(juan, maria).
padre(carlos, pedro).
padre(juan, jose).
Si queremos encontrar todos los hijos de Juan, podemos usar una consulta de esta forma:

?- padre(juan, Hijo).
Sin embargo, si solo queremos verificar si Juan tiene algún hijo, sin importar quién sea, podemos utilizar la variable anónima:

?- padre(juan, _).
Esta consulta devolverá `true` si Juan tiene al menos un hijo, ya que no necesitamos el valor del hijo específico.

Casos Comunes de Uso
Ignorar ciertos argumentos en un predicado.
Simplificar consultas en las que solo se desea verificar la existencia de alguna condición.
Evitar que Prolog almacene valores innecesarios en la consulta.
Ejercicio
Intenta ejecutar las siguientes consultas para entender el uso de variables anónimas:

% 1. Consulta para verificar si Carlos tiene algún hijo.  ?-
padre(carlos, _).

% 2. Consulta para verificar si existe alguna relación padre-hijo en
la base de datos.  ?- padre(_, _).
Cada una de estas consultas ignorará los valores específicos y solo verificará la existencia de la relación.

Predicados Mitológicos en Programación Lógica
Introducción
En programación lógica, los predicados mitológicos son aquellos que destacan por su utilidad, flexibilidad y elegancia en la solución de problemas comunes o complejos. Estos predicados pueden resolver múltiples casos con reglas generales, lo que les otorga un carácter "mágico". Su uso es común en lenguajes como Prolog.

Ejemplos Detallados de Predicados Mitológicos
1. maplist
El predicado maplist aplica un predicado a cada elemento de una lista y genera una lista transformada.

maplist(_, [], []).
maplist(Predicado, [H1|T1], [H2|T2]) :- call(Predicado, H1, H2), maplist(Predicado, T1, T2).
Ejemplo: Calcular el cuadrado de cada número en una lista.

cuadrado(X, Y) :- Y is X * X.
?- maplist(cuadrado, [1, 2, 3], Resultados).
% Resultados = [1, 4, 9].
2. permutacion
Genera todas las permutaciones posibles de una lista.

permutacion([], []).
permutacion([H|T], P) :- permutacion(T, R), insertar(H, R, P).
insertar(X, L, [X|L]).
insertar(X, [H|T], [H|R]) :- insertar(X, T, R).
Ejemplo: Enumerar las permutaciones de una lista.

?- permutacion([1, 2, 3], P).
% P = [1, 2, 3];
% P = [1, 3, 2];
% P = [2, 1, 3];
% ...
3. append
El predicado append combina dos listas en una o las divide en dos partes.

append([], L, L).
append([H|T], L, [H|R]) :-
    append(T, L, R).
Ejemplo 1: Concatenar listas.

?- append([1, 2], [3, 4], Resultado).
% Resultado = [1, 2, 3, 4].
Ejemplo 2: Dividir una lista en dos partes.

?- append(L1, L2, [1, 2, 3]).
% L1 = [];
% L2 = [1, 2, 3];
% L1 = [1];
% L2 = [2, 3];
% ...
4. subconjunto
Genera todos los subconjuntos posibles de una lista, útil en problemas combinatorios.

subconjunto([], []).
subconjunto([H|T], [H|R]) :-
subconjunto(T, R).
subconjunto([_|T], R) :-
    subconjunto(T, R).
Ejemplo: Generar subconjuntos.

?- subconjunto([1, 2, 3], S).
% S = [];
% S = [1];
% S = [2];
% S = [1, 2];
% ...
5. reverse
Invierte los elementos de una lista.

reverse([], []).
reverse([H|T], R) :-
    reverse(T, RevT),
    append(RevT, [H], R).
Ejemplo: Invertir una lista.

?- reverse([1, 2, 3], R).
% R = [3, 2, 1].
6. flatten
Convierte una lista con estructuras anidadas en una lista plana.

flatten([], []).
flatten([H|T], R) :-
    flatten(H, RH),
    flatten(T, RT),
    append(RH, RT, R).
flatten(X, [X]) :-
    X \= [],
    X \= [_|_].
Ejemplo: Aplanar una lista.

?- flatten([1, [2, [3, 4]], 5], R).
% R = [1, 2, 3, 4, 5].
Aplanar una lista vacía simplemente devuelve otra lista vacía.

?- flatten([], R).
% R = [].
Los elementos atómicos y las listas vacías no se modifican en el resultado.

?- flatten([1, [], [2, [3, []], 4]], R).
% R = [1, 2, 3, 4].
Aplanar múltiples niveles de anidación.

?- flatten([[a, [b, c]], [d, [e, f]], g], R).
% R = [a, b, c, d, e, f, g].
7. findall
El predicado findall recolecta todas las soluciones posibles de un predicado y las devuelve en una lista. Es útil para realizar consultas y almacenar resultados.

Ejemplo: Recolectar miembros de una lista.

?- findall(X, member(X, [1, 2, 3]), Soluciones).
% Soluciones = [1, 2, 3].
Ejemplo: Recuperar todos los elementos de una lista utilizando el predicado `member`.

?- findall(X, member(X, [1, 2, 3]), Resultados).
% Resultados = [1, 2, 3].
Ejemplo : Recolectar pares ordenados donde el segundo elemento es el doble del primero.

doble(X, Y) :- Y is X * 2.
?- findall((X, Y), (member(X, [1, 2, 3]), doble(X, Y)), Pares).
% Pares = [(1, 2), (2, 4), (3, 6)].
Ejemplo: Usar el predicado permutacion para generar y recolectar permutaciones de una lista.

?- findall(P, permutacion([1, 2, 3], P), Permutaciones).
% Permutaciones = [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]].
Ejemplo: Recolectar los números en una lista que están en un rango definido.

en_rango(X) :- X >= 10, X =< 20.
?- findall(X, (member(X, [5, 10, 15, 20, 25]), en_rango(X)), Filtrados).
% Filtrados = [10, 15, 20].
Ejemplo: Usar findall junto con length para contar cuántas soluciones tiene un predicado.

?- findall(X, member(X, [a, b, c, d]), Soluciones), length(Soluciones, Total).
% Soluciones = [a, b, c, d],
% Total = 4.
Ejemplo: Ejemplo 6: Uso combinado con flatten Recolectar listas anidadas y luego aplanarlas.

?- findall(SubLista, member(SubLista, [[1, 2], [3, [4, 5]], 6]), Listas),
   flatten(Listas, R).
% Listas = [[1, 2], [3, [4, 5]], 6],
% R = [1, 2, 3, 4, 5, 6].
Ejemplo: Recolectar todas las soluciones que cumplen una condición, como encontrar números primos en un rango.

es_primo(N) :- N > 1, \+ (between(2, N1, N), N1 < N, N mod N1 =:= 0).
?- findall(Primo, (between(1, 20, Primo), es\_primo(Primo)), Primos).
% Primos = [2, 3, 5, 7, 11, 13, 17, 19].
Estos predicados mitológicos destacan en programación lógica por su capacidad para abordar una amplia variedad de problemas. Al dominar estos predicados, los programadores pueden escribir código más elegante y eficiente, aprovechando la potencia de lenguajes como Prolog para resolver problemas complejos de manera declarativa.

Problemas con Predicados Mitológicos
1. Aplanar una lista de listas anidadas
Utiliza el predicado flatten para transformar una estructura anidada en una lista plana.

Problema: Dada una lista como [1, [2, [3, 4], 5], [6]], genera [1, 2, 3, 4, 5, 6].

Predicado: `flatten`.

2. Encontrar todas las permutaciones de una lista
Utiliza *permutacion*` para generar todas las permutaciones posibles de una lista.

Problema: Dada la lista [a, b, c], genera las permutaciones:

[a, b, c]
[a, c, b]
[b, a, c]
[b, c, a]
[c, a, b]
[c, b, a]
Predicado: `permutacion/2`.

3. Generar subconjuntos de una lista
Utiliza subconjunto para encontrar todos los subconjuntos posibles de una lista.

Problema: Dada la lista [1, 2, 3], genera:

[]
[1]
[2]
[3]
[1, 2]
[1, 3]
[2, 3]
[1, 2, 3]
Predicado: subconjunto.

4. Encontrar todos los números en un rango que cumplen una condición
Usa findall para encontrar números que cumplan una propiedad específica, como ser pares o primos.

Problema: Encuentra todos los números primos entre 1 y 20.

Predicados: findall, es\primo.

5. Concatenar dos listas
Usa append para combinar dos listas en una sola.

Problema: Combina `[1, 2]` y `[3, 4]` en `[1, 2, 3, 4]`.

Predicado: append.

6. Encontrar elementos únicos en una lista
Usa findall y member para eliminar duplicados.

Problema: Dada la lista [1, 2, 2, 3, 3, 3, 4], genera [1, 2, 3, 4].

Predicados: findall, member.

7. Calcular la potencia de un número
Usa un predicado recursivo y `findall/3` para calcular todas las potencias de un número hasta un límite.

Problema: Dado el número 2, calcula sus potencias hasta 25
:

[1, 2, 4, 8, 16, 32]
Predicado: findall.

8. Alinear equipos en un torneo
Usa *permutacion*` para generar todas las alineaciones posibles de equipos en un torneo.

Problema: Dado un conjunto de equipos [A, B, C], genera todas las combinaciones posibles de enfrentamientos.

Predicado: permutacion

9. Resolver problemas de caminos
Encuentra todas las rutas posibles entre dos nodos en un grafo utilizando `findall/3`.

Problema: Dado un grafo representado como:

arco(a, b).
arco(b, c).
arco(c, d).
arco(a, d).
Encuentra todas las rutas de a a d.

Predicados: findall, predicado recursivo para buscar caminos.

10. Generar combinaciones con repetición
Usa findall para generar combinaciones posibles de elementos de una lista con repetición.

Problema: Dada la lista [a, b] y un tamaño 2, genera:

[a, a]
[a, b]
[b, a]
[b, b]
Predicado: findall.