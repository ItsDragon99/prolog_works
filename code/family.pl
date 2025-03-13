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

padrede(juan, maria).
padrede(luis, luisa).
padrede(carlos, ana).
padrede(fernando, sofia).
padrede(raul, carmen).
padrede(pedro, paula).

madrede(maria, juan).
madrede(luisa, luis).
madrede(ana, carlos).
madrede(sofia, fernando).
madrede(carmen, raul).
madrede(paula, pedro).

#Abuelo
abuelode(X, Y) :- padre(X, W), padre(W, Y).

#Abuela
abuelade(X, Y) :- madre(X, W), madre(W, Y).
#Nieto
nietode(X, Y) :- abuelode(Y, X).
#Nieta
nietade(X, Y) :- abuelade(Y, X).
#Hermano
hermanode(X, Y) :- padre(Z, X), padre(Z, Y);
#Hermana
hermande(X, Y) :- madre(Z, X), madre(Z, Y);
#Tio
tiode(X, Y) :- hermanode(X, Z), padre(Z, Y);.
#Tia
tiade(X, Y) :- hermanode(X, Z), madre(Z, Y).
#Primo
primode(X, Y) :- padre(Z, X), padre(W, Y), hermanode(Z, W).
#Prima
primode(X, Y) :- padre(Z, X), padre(W, Y), hermande(Z, W).
#Sobrino
sobrinode(X, Y) :- tiode(Y, X).
#Sobrina
sobrinade(X, Y) :- tiade(Y, X).

