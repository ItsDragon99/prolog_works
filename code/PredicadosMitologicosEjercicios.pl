% 1 Aplanar una lista anidadas

flatten([], []).
flatten([H|T], R) :-
    flatten(H, RH),
    flatten(T, RT),
    append(RH, RT, R).
flatten(X, [X]) :-
    X \= [],
    X \= [_|_].

?- flatten( [1, [2, [3, 4], 5], [6]], Resultado).

% 2 Encontrar todas las permutaciones de una lista
permutacion([], []).
permutacion([H|T], P) :-
    permutacion(T, R),
    insertar(H, R, P).

insertar(X, L, [X|L]).
insertar(X, [H|T], [H|R]) :- insertar(X, T, R).

?- permutacion([a,b,c], P).

% 3 Genera subconjutnos de una lista

subconjunto([], []).
subconjunto([H|T], [H|R]) :-
    subconjunto(T, R).
subconjunto([_|T], R) :-
    subconjunto(T, R).

?- subconjunto([1,2,3], S).


% 4. Encontrar todos los números en un rango que cumplen una condición

?- findall(X, (between(1, 20, X), X mod 2 =:= 1), L).

% 5 Concatenar dos listas
append([], L, L).
append([H|T], L, [H|R]) :-
    append(T, L, R).

?- append([1,2], [3,4], R).

% 6 Encontrar elemenetos unicos en una lista
?- findall()