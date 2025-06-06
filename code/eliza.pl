eliza:-	writeln('Hola , mi nombre es  Eliza tu  chatbot,
	por favor ingresa tu consulta,
	usar solo minúsculas sin . al final:'),
	readln(Input),
	eliza(Input),!.
eliza(Input):- Input == ['Adios'],
	writeln('Adios. espero poder verte ayudado.'), !.
eliza(Input):- Input == ['Adios', '.'],
	writeln('Adios. espero poder verte ayudado.'), !.

% Aqui estan los pequeños cambios
eliza(Input):- Input == ['adios'],
	writeln('Adios padre cuidate.'), !.

eliza(Input):- Input == ['adios', '.'],
	writeln('Adios padre cuidate.'), !.

eliza(Input):- Input == ['adios', 'eliza'],
	writeln('Camara apa te cuidas'), !.

eliza(Input):- Input == ['adios', 'eliza', '.'],
	writeln('Camara apa te cuidas'), !.

eliza(Input) :- Input == [bye, eliza], writeln('Upsi dupsi padre te vas'), !.

eliza(Input) :- Input == [bye, perro], writeln('Bye bye perro'), !.



eliza(Input) :-
	template(Stim, Resp, IndStim),
	match(Stim, Input),
	% si he llegado aquí es que he
	% hallado el template correcto:
	replace0(IndStim, Input, 0, Resp, R),
	writeln(R),
	readln(Input1),
	eliza(Input1), !.


template([hola, mi, nombre, es, s(_), '.'], ['Hola', 0, 'Como', estas, tu, '?'], [4]).
template([buendia, mi, nombre, es, s(_), '.'], ['buen dia', 'Como', estas, tu, 0, '?'], [4]).

template([hola, ',', mi, nombre, es, s(_), '.'], ['Hola', 0, 'Como', estas, tu, '?'], [5]).
template([buendia, ',', mi, nombre, es, s(_), '.'], ['Buendia', 'Como', estas, tu, 0, '?'], [5]).

template([hola, eliza, te, estoy, saludando, soy, s(_)], ['Hola', 0, 'estoy', 'para', 'ayudarte que ocupas apa', '?'], [6]).
template([buenas, noches, eliza, soy, s(_)], ['Buenas', 'noches', 0, 'en', 'que', 'puedo', 'ayudarte', '?'], [4]).
template([buenas, noches, soy, s(_)], ['Hola', 0, 'buenas', 'noches', 'como', 'estas', '?'], [3]).
template([que, onda, eliza, soy, s(_)], ['Que', 'onda', 0, 'como', 'te', 'puedo', 'ayudar', '?'], [4]).
template([que, rollo, eliza, soy, s(_)], ['Que', 'rollo', 0, 'en', 'que', 'andas haciendo carnal', '?'], [4]).
template([wasap, eliza, soy, s(_)], ['Que', 'pasa', 0, 'como', 'te', 'sientes', '?'], [3]).
template([vamos, a, pistear, eliza, soy, s(_)], ['amos', 0, 'yo', 'pongo', 'un', 'six', 'carnal'], [5]).
template([hola, eliza, que, onda, soy, s(_)], ['Hola', 0, 'que', 'onda', 'como', 'estas', '?'], [5]).
template([buenas, noches, eliza, que, tal, soy, s(_)], ['Buenas', 'noches', 0, 'que', 'tal', 'como', 'te', 'va', '?'], [6]).
template([que, onda, buenas, noches, soy, s(_)], ['Que', 'onda', 0, 'buenas', 'noches', 'como', 'te', 'encuentras', '?'], [5]).
template([que, rollo, buenas, noches, soy, s(_)], ['Que', 'rollo', 0, 'buenas', 'noches', 'en', 'que', 'te', 'puedo', 'ayudar', '?'], [5]).
template([hola, eliza, vamos, a, pistear, soy, s(_)], ['Hola', 0, 'mejor', 'platiquemos', 'un', 'rato', 'que', 'te', 'parece', '?'], [5]).
template([buenas, noches, que, onda, soy, s(_)], ['Buenas', 'noches', 0, 'que', 'onda', 'como', 'te', 'sientes', '?'], [4]).
template([que, pasa, buenas, noches, soy, s(_)], ['Que', 'pasa', 0, 'buenas', 'noches', 'en', 'que', 'te', 'puedo', 'ayudar', '?'], [5]).
template([hola, eliza, que, rollo, soy, s(_)], ['Hola', 0, 'que', 'rollo', 'como', 'te', 'va', '?'], [5]).

% Estos son de comodines 
template([hola, _], ['Hola', 'como', estas, tu, '?'], []).
template([buendia, _], ['Buendia', 'Como', estas, tu, '?'], []).

template([yo, s(_), yo, soy, s(_),'.'], [por, que, 0, eres, 1, '?'], [1, 4]).
template([yo, s(_), tu, '.'], [why, do, you, 0, me ,'?'], [1]).
template([yo, soy, s(_),'.'], [porque, eres, tu, 0, '?'], [2]).

% pregunta algo que le gusta a eliza
template([te, gustan, las, s(_), _], [flagLike], [3]).
template([te, gustan, los, s(_), _], [flagLike], [3]).

		 % pregunta algo que hace eliza
template([tu, eres, s(_), _], [flagDo], [2]).
% pregunta algo que es eliza
template([que, eres, tu, s(_)], [flagIs], [2]).
template([eres, s(_), '?'], [flagIs], [2]).

template([como, estas, tu, '?'], [yo, estoy, bien, ',', gracias, por, preguntar, '.'], []).

template([yo, pienso, que, _], [bueno, esa, es, tu, opinion], []).
template([porque, _], [esa, no, es, una, buena, razon, '.'], []).
template([i, have, s(_), with, s(_), '.'], ['You', have, to, deal, with, your, 0, and, your, 1, in, a, mature, way, '.'], [2, 4]).
template([i, s(_),  _], [i, can, recommend, you, a, book, about, that, issue], []).
template([please, s(_), _], ['No', i, can, not, help, ',', i, am, just, a, machine], []). 
		 template([tell, me, a, s(_), _], ['No', i, can, not, ',', i, am, bad, at, that], []).

				  
template(_, ['Please', explain, a, little, more, '.'], []). 
% Lo que le gusta a eliza : flagLike
elizaLikes(X, R):- likes(X), R = ['Yeah', i, like, X].
elizaLikes(X, R):- \+likes(X), R = ['Nope', i, do, not, like, X].
likes(apples).
likes(ponies).
likes(zombies).
likes(penes).
likes(manzanas).
likes(computadoras).
like(carros).



% lo que hace eliza: flagDo
elizaDoes(X, R):- does(X), R = ['Yes', i, X, and, i, love, it].
elizaDoes(X, R):- \+does(X), R = ['No', i, do, not, X ,'.', it, is, too, hard, for, me].
does(study).
does(cook).
does(work).

% lo que es eliza: flagIs
elizaIs(X, R):- is0(X), R = ['Yes', yo, soy, X].
elizaIs(X, R):- \+is0(X), R = ['No', i, am, not, X].
is0(dumb).
is0(weird).
is0(nice).
is0(fine).
is0(happy).
is0(redundant).

match([],[]).
match([], _):- true.

match([S|Stim],[I|Input]) :-
	atom(S), % si I es un s(X) devuelve falso
	S == I,
	match(Stim, Input),!.

match([S|Stim],[_|Input]) :-
% I es un s(X), lo ignoro y continúo con el resto de la lista
	\+atom(S),
	match(Stim, Input),!.

replace0([], _, _, Resp, R):- append(Resp, [], R),!.

% Eliza likes:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagLike,
	elizaLikes(Atom, R).

% Eliza does:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagDo,
	elizaDoes(Atom, R).

% Eliza is:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagIs,
	elizaIs(Atom, R).

replace0([I|Index], Input, N, Resp, R):-
	length(Index, M), M =:= 0,
	nth0(I, Input, Atom),
	select(N, Resp, Atom, R1), append(R1, [], R),!.

replace0([I|Index], Input, N, Resp, R):-
	nth0(I, Input, Atom),
	length(Index, M), M > 0,
	select(N, Resp, Atom, R1),
	N1 is N + 1,
	replace0(Index, Input, N1, R1, R),!.
