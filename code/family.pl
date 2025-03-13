hombre(juan).
hombre(carlos).
hombre(luis).
hombre(pedro).
hombre(alejandro).
hombre(roberto).
hombre(fernando).
hombre(raul).
hombre(diego).
hombre(eduardo).
mujer(maria).
mujer(ana).
mujer(luisa).
mujer(sofia).
mujer(diana).
mujer(elena).
mujer(carmen).
mujer(laura).
mujer(paula).
mujer(monica).

padre(juan, carlos).
padre(juan, ana).
padre(luis, pedro).
padre(luis, sofia).
padre(carlos, alejandro).
padre(carlos, diana).
padre(fernando, roberto).
padre(fernando, elena).
padre(raul, laura).
padre(raul, carmen).
padre(pedro, diego).
padre(pedro, paula).

madre(maria, carlos).
madre(maria, ana).
madre(luisa, pedro).
madre(luisa, sofia).
madre(ana, alejandro).
madre(ana, diana).
madre(sofia, roberto).
madre(sofia, elena).
madre(carmen, laura).
madre(paula, monica).
madre(elena, eduardo).

padre_de(X, Y) :- padre(X, Y).
madre_de(X, Y) :- madre(X, Y).

hijo_de(X, Y) :- padre(Y, X); madre(Y, X).
hija_de(X, Y) :- mujer(X), hijo_de(X, Y).

hermano_de(X, Y) :- padre(Z, X), padre(Z, Y), madre(W, X), madre(W, Y), X \= Y.

abuelo_de(X, Y) :- padre(X, Z), padre(Z, Y).
abuelo_de(X, Y) :- padre(X, Z), madre(Z, Y).
abuela_de(X, Y) :- madre(X, Z), padre(Z, Y).
abuela_de(X, Y) :- madre(X, Z), madre(Z, Y).

nieto_de(X, Y) :- hombre(X), abuelo_de(Y, X).
nieto_de(X, Y) :- hombre(X), abuela_de(Y, X).
nieta_de(X, Y) :- mujer(X), abuelo_de(Y, X).
nieta_de(X, Y) :- mujer(X), abuela_de(Y, X).

tio_de(X, Y) :- hermano_de(X, Z), padre(Z, Y).
tio_de(X, Y) :- hermano_de(X, Z), madre(Z, Y).
tia_de(X, Y) :- mujer(X), tio_de(X, Y).

primo_de(X, Y) :- padre(Z, X), hermano_de(Z, W), padre(W, Y).
primo_de(X, Y) :- madre(Z, X), hermano_de(Z, W), madre(W, Y).
prima_de(X, Y) :- mujer(X), primo_de(X, Y).
