docbot :-
	writeln('Hola, soy DocBot, tu asistente para detección de posibles enfermedades.'),
	writeln('Por favor, describe tus síntomas o haz una pregunta sobre alguna enfermedad.'),
	writeln('(usa minúsculas sin punto al final)'),
	readln(Input),
	procesar(Input),!.

% en esta parte me ayuda a acabar el programa o el bot 
procesar(Input):- Input == ['adios'],
	writeln('Gracias por consultar. Recuerda que esto no reemplaza la visita a un médico. ¡Hasta luego!'), !.
procesar(Input):- Input == ['adios', '.'],
	writeln('Gracias por consultar. Recuerda que esto no reemplaza la visita a un médico. ¡Hasta luego!'), !.

% aqui deberia de evaluar la interaccon del uusuario
procesar(Input) :-
	template(Patron, Respuesta, IndPatron),
	match(Patron, Input),
	% Si se encuentra un patrón que coincida
	replace0(IndPatron, Input, 0, Respuesta, R),
	writeln(R),
	readln(NuevaEntrada),
	procesar(NuevaEntrada), !.

% en efecto contrario que no encuentre ningun template se imprime esto
procesar(_) :-
	writeln('Lo siento, no entiendo. ¿Puedes reformular tu pregunta o consultar sobre síntomas específicos?'),
	readln(NuevaEntrada),
	procesar(NuevaEntrada), !.



enfermedad(cancer_prostata).
enfermedad(bocio).

sintoma(dificultad_orinar).
sintoma(flujo_orina_debil).
sintoma(sangre_orina_semen).
sintoma(dolor_pelvis).
sintoma(disfuncion_erectil).
sintoma(hinchazon_cuello).
sintoma(dificultad_tragar).
sintoma(dificultad_respirar).
sintoma(tos).
sintoma(ronquera).

causa(edad_avanzada).
causa(antecedentes_familiares).
causa(factores_geneticos).
causa(dieta_alta_grasas).
causa(deficiencia_yodo).
causa(enfermedad_graves).
causa(enfermedad_hashimoto).
causa(nodulos_tiroideos).

especialista(urologo).
especialista(oncologo).
especialista(endocrinologo).

region(norteamerica).
region(europa_occidental).
region(australia).
region(asia).
region(africa).
region(sudamerica).
region(asia_central).
region(zonas_montanas).
region(regiones_sin_mar).

genero(hombre).
genero(mujer).

grupo_edad(mayor_50).
grupo_edad(mayor_40).

tiene_sintoma(cancer_prostata, dificultad_orinar).
tiene_sintoma(cancer_prostata, flujo_orina_debil).
tiene_sintoma(cancer_prostata, sangre_orina_semen).
tiene_sintoma(cancer_prostata, dolor_pelvis).
tiene_sintoma(cancer_prostata, disfuncion_erectil).

tiene_sintoma(bocio, hinchazon_cuello).
tiene_sintoma(bocio, dificultad_tragar).
tiene_sintoma(bocio, dificultad_respirar).
tiene_sintoma(bocio, tos).
tiene_sintoma(bocio, ronquera).


tiene_causa(cancer_prostata, edad_avanzada).
tiene_causa(cancer_prostata, antecedentes_familiares).
tiene_causa(cancer_prostata, factores_geneticos).
tiene_causa(cancer_prostata, dieta_alta_grasas).

tiene_causa(bocio, deficiencia_yodo).
tiene_causa(bocio, enfermedad_graves).
tiene_causa(bocio, enfermedad_hashimoto).
tiene_causa(bocio, nodulos_tiroideos).
tiene_causa(bocio, factores_geneticos).

tratado_por(cancer_prostata, urologo).
tratado_por(cancer_prostata, oncologo).
tratado_por(bocio, endocrinologo).

prevalente_en(cancer_prostata, norteamerica).
prevalente_en(cancer_prostata, europa_occidental).
prevalente_en(cancer_prostata, australia).

prevalente_en(bocio, africa).
prevalente_en(bocio, sudamerica).
prevalente_en(bocio, asia_central).
prevalente_en(bocio, zonas_montanas).
prevalente_en(bocio, regiones_sin_mar).

afecta_a_genero(cancer_prostata, hombre).
afecta_a_genero(bocio, mujer).
afecta_a_genero(bocio, hombre).

afecta_a_edad(cancer_prostata, mayor_50).
afecta_a_edad(bocio, mayor_40).


posible_enfermedad(Enfermedad, Sintoma) :-
	enfermedad(Enfermedad),
	sintoma(Sintoma),
	tiene_sintoma(Enfermedad, Sintoma).

causa_de(Causa, Enfermedad) :-
	enfermedad(Enfermedad),
	causa(Causa),
	tiene_causa(Enfermedad, Causa).

consultar_especialista(Especialista, Sintoma) :-
	sintoma(Sintoma),
	posible_enfermedad(Enfermedad, Sintoma),
	tratado_por(Enfermedad, Especialista).

puede_afectar(Enfermedad, Genero) :-
	enfermedad(Enfermedad),
	genero(Genero),
	afecta_a_genero(Enfermedad, Genero).


template([tengo, s(_), '.'], [flagSintoma], [1]).
template([presento, s(_), '.'], [flagSintoma], [1]).
template([me, duele, s(_), '.'], [flagSintoma], [2]).
template([siento, s(_), '.'], [flagSintoma], [1]).

template([que, es, el, s(_), '?'], [flagEnfermedad], [3]).
template([que, es, la, s(_), '?'], [flagEnfermedad], [3]).
template([informacion, sobre, s(_), '.'], [flagEnfermedad], [2]).
template([dime, sobre, s(_), '.'], [flagEnfermedad], [2]).

template([que, causa, el, s(_), '?'], [flagCausa], [3]).
template([que, causa, la, s(_), '?'], [flagCausa], [3]).
template([por, que, da, s(_), '?'], [flagCausa], [3]).

template([que, especialista, trata, el, s(_), '?'], [flagEspecialista], [4]).
template([que, especialista, trata, la, s(_), '?'], [flagEspecialista], [4]).
template([quien, trata, el, s(_), '?'], [flagEspecialista], [3]).
template([quien, trata, la, s(_), '?'], [flagEspecialista], [3]).

template([a, quien, afecta, el, s(_), '?'], [flagAfectados], [4]).
template([a, quien, afecta, la, s(_), '?'], [flagAfectados], [4]).
template([quien, sufre, de, s(_), '?'], [flagAfectados], [3]).

template([donde, es, comun, el, s(_), '?'], [flagRegion], [4]).
template([donde, es, comun, la, s(_), '?'], [flagRegion], [4]).
template([en, que, regiones, aparece, s(_), '?'], [flagRegion], [4]).

template([hola], ['Hola, soy DocBot. ¿En qué puedo ayudarte?'], []).
template([ayuda], ['Puedes preguntarme sobre síntomas, causas, especialistas, regiones o personas afectadas por ciertas enfermedades.'], []).


respuesta_sintoma(Sintoma, R) :-
	atom_string(AtomSintoma, Sintoma),
	(   sintoma(AtomSintoma),
	    findall(E, tiene_sintoma(E, AtomSintoma), Enfermedades),
	    Enfermedades \= [],
	    atomics_to_string(Enfermedades, ', ', EnfermedadesStr),
	    string_concat('El síntoma que mencionas podría estar relacionado con: ', EnfermedadesStr, Temp),
	    string_concat(Temp, '. Te recomendaría consultar a un médico.', Resp),
	    string_to_atom(Resp, R)
	;   
	    R = 'No tengo información sobre ese síntoma específico. Te recomendaría consultar con un médico.'
	).

respuesta_enfermedad(Enfermedad, R) :-
	atom_string(AtomEnfermedad, Enfermedad),
	(   enfermedad(AtomEnfermedad),
	    findall(S, tiene_sintoma(AtomEnfermedad, S), Sintomas),
	    atomics_to_string(Sintomas, ', ', SintomasStr),
	    findall(C, tiene_causa(AtomEnfermedad, C), Causas),
	    atomics_to_string(Causas, ', ', CausasStr),
	    string_concat('La ', Enfermedad, Temp1),
	    string_concat(Temp1, ' presenta síntomas como: ', Temp2),
	    string_concat(Temp2, SintomasStr, Temp3),
	    string_concat(Temp3, '. Sus causas incluyen: ', Temp4),
	    string_concat(Temp4, CausasStr, Resp),
	    string_to_atom(Resp, R)
	;   
	    R = 'Lo siento, no tengo información sobre esa enfermedad.'
	).

respuesta_causa(Enfermedad, R) :-
	atom_string(AtomEnfermedad, Enfermedad),
	(   enfermedad(AtomEnfermedad),
	    findall(C, tiene_causa(AtomEnfermedad, C), Causas),
	    Causas \= [],
	    atomics_to_string(Causas, ', ', CausasStr),
	    string_concat('Las causas de ', Enfermedad, Temp1),
	    string_concat(Temp1, ' incluyen: ', Temp2),
	    string_concat(Temp2, CausasStr, Resp),
	    string_to_atom(Resp, R)
	;   
	    R = 'Lo siento, no tengo información sobre las causas de esa condición.'
	).

respuesta_especialista(Enfermedad, R) :-
	atom_string(AtomEnfermedad, Enfermedad),
	(   enfermedad(AtomEnfermedad),
	    findall(E, tratado_por(AtomEnfermedad, E), Especialistas),
	    Especialistas \= [],
	    atomics_to_string(Especialistas, ', ', EspecialistasStr),
	    string_concat('Para ', Enfermedad, Temp1),
	    string_concat(Temp1, ' deberías consultar con: ', Temp2),
	    string_concat(Temp2, EspecialistasStr, Resp),
	    string_to_atom(Resp, R)
	;   
	    R = 'No tengo información sobre qué especialista consultar para esa condición.'
	).

respuesta_afectados(Enfermedad, R) :-
	atom_string(AtomEnfermedad, Enfermedad),
	(   enfermedad(AtomEnfermedad),
	    findall(G, afecta_a_genero(AtomEnfermedad, G), Generos),
	    findall(E, afecta_a_edad(AtomEnfermedad, E), Edades),
	    (   Generos \= [], Edades \= [] ->
	        atomics_to_string(Generos, ', ', GenerosStr),
	        atomics_to_string(Edades, ', ', EdadesStr),
	        string_concat(Enfermedad, ' afecta principalmente a ', Temp1),
	        string_concat(Temp1, GenerosStr, Temp2),
	        string_concat(Temp2, ' de ', Temp3),
	        string_concat(Temp3, EdadesStr, Resp),
	        string_to_atom(Resp, R)
	    ;   
	        R = 'No tengo información detallada sobre quiénes son más afectados por esa condición.'
	    )
	;   
	    R = 'No tengo información sobre esa condición.'
	).

respuesta_region(Enfermedad, R) :-
	atom_string(AtomEnfermedad, Enfermedad),
	(   enfermedad(AtomEnfermedad),
	    findall(Reg, prevalente_en(AtomEnfermedad, Reg), Regiones),
	    Regiones \= [],
	    atomics_to_string(Regiones, ', ', RegionesStr),
	    string_concat(Enfermedad, ' es más común en: ', Temp1),
	    string_concat(Temp1, RegionesStr, Resp),
	    string_to_atom(Resp, R)
	;   
	    R = 'No tengo información sobre las regiones donde es común esa condición.'
	).



replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Sintoma),
	nth0(0, Resp, X),
	X == flagSintoma,
	respuesta_sintoma(Sintoma, R).

replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Enfermedad),
	nth0(0, Resp, X),
	X == flagEnfermedad,
	respuesta_enfermedad(Enfermedad, R).

replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Enfermedad),
	nth0(0, Resp, X),
	X == flagCausa,
	respuesta_causa(Enfermedad, R).

replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Enfermedad),
	nth0(0, Resp, X),
	X == flagEspecialista,
	respuesta_especialista(Enfermedad, R).

replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Enfermedad),
	nth0(0, Resp, X),
	X == flagAfectados,
	respuesta_afectados(Enfermedad, R).

replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Enfermedad),
	nth0(0, Resp, X),
	X == flagRegion,
	respuesta_region(Enfermedad, R).

replace0([], _, _, Resp, R):- append(Resp, [], R),!.

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

match([],[]).
match([], _):- true.

match([S|Stim],[I|Input]) :-
	atom(S),
	S == I,
	match(Stim, Input),!.

match([S|Stim],[_|Input]) :-
	\+atom(S),
	match(Stim, Input),!.
