docbot :-
	writeln('Hola, soy DocBot, tu asistente para deteccion de posibles enfermedades.'),
	writeln('Por favor, describe tus sintomas o haz una pregunta sobre alguna enfermedad.'),
	writeln('(usa minusculas sin punto al final)'),
	readln(Input),
	procesar(Input),!.

% en esta parte me ayuda a acabar el programa o el bot 
procesar(Input):- Input == ['adios'],
	writeln('Gracias por consultar. Recuerda que esto no reemplaza la visita a un medico. !Hasta luego!'), !.
procesar(Input):- Input == ['adios', '.'],
	writeln('Gracias por consultar. Recuerda que esto no reemplaza la visita a un medico. !Hasta luego!'), !.

% Fix game command recognition
procesar(Input) :-
	(Input == ['jugar', 'adivinar', 'personaje'] ; 
	 Input == ['jugar', 'adivinar', 'personajes'] ;
	 Input == ['juego', 'personajes'] ;
	 Input == ['juego', 'rick', 'and', 'morty'] ;
	 Input == ['juego', 'rick', 'y', 'morty'] ;
	 Input == ['adivina', 'mi', 'personaje'] ;
	 Input == ['adivina', 'quien', 'soy']),
	writeln('Iniciando juego de adivinar personajes de Rick and Morty...'),
	iniciar_adivinanza, !.

% aqui deberia de evaluar la interaccon del uusuario
procesar(Input) :-
	template(Patron, Respuesta, IndPatron),
	match(Patron, Input),
	% Si se encuentra un patron que coincida
	replace0(IndPatron, Input, 0, Respuesta, R),
	writeln(R),
	readln(NuevaEntrada),
	procesar(NuevaEntrada), !.

% en efecto contrario que no encuentre ningun template se imprime esto
procesar(_) :-
	writeln('Lo siento, no entiendo. ¿Puedes reformular tu pregunta o consultar sobre sintomas especificos?'),
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

has_symptom(cancer_prostata, dificultad_orinar, si).
has_symptom(cancer_prostata, flujo_orina_debil, si).
has_symptom(cancer_prostata, sangre_orina_semen, si).
has_symptom(cancer_prostata, dolor_pelvis, si).
has_symptom(cancer_prostata, disfuncion_erectil, si).
has_symptom(cancer_prostata, hinchazon_cuello, no).
has_symptom(cancer_prostata, dificultad_tragar, no).
has_symptom(cancer_prostata, dificultad_respirar, no).
has_symptom(cancer_prostata, tos, no).
has_symptom(cancer_prostata, ronquera, no).

has_symptom(bocio, dificultad_orinar, no).
has_symptom(bocio, flujo_orina_debil, no).
has_symptom(bocio, sangre_orina_semen, no).
has_symptom(bocio, dolor_pelvis, no).
has_symptom(bocio, disfuncion_erectil, no).
has_symptom(bocio, hinchazon_cuello, si).
has_symptom(bocio, dificultad_tragar, si).
has_symptom(bocio, dificultad_respirar, si).
has_symptom(bocio, tos, si).
has_symptom(bocio, ronquera, si).



medicamento(abiraterona).
medicamento(enzalutamida).
medicamento(docetaxel).
medicamento(prednisona).
medicamento(levotiroxina).
medicamento(metimazol).
medicamento(propiltiouracilo).
medicamento(beta_bloqueantes).

tratado_con(cancer_prostata, abiraterona).
tratado_con(cancer_prostata, enzalutamida).
tratado_con(cancer_prostata, docetaxel).
tratado_con(cancer_prostata, prednisona).
tratado_con(bocio, levotiroxina).
tratado_con(bocio, metimazol).
tratado_con(bocio, propiltiouracilo).
tratado_con(bocio, beta_bloqueantes).

persona(\n).
persona(maria).
persona(pedro).
persona(ana).
persona(luis).
persona(carmen).
persona(miguel).
persona(sofia).
persona(roberto).
persona(elena).
persona(raul).
persona(lucia).

padre(juan, pedro).     
padre(juan, ana).        
padre(luis, roberto).    
padre(miguel, raul).     
padre(roberto, lucia).   

madre(maria, pedro).     
madre(maria, ana).       
madre(carmen, roberto).  
madre(sofia, raul).      
madre(elena, lucia).     

esposo(juan, maria).     
esposo(luis, carmen).    
esposo(miguel, sofia).   
esposo(roberto, elena).  

esposa(X, Y) :- esposo(Y, X).

hermano(X, Y) :- 
    persona(X), persona(Y), X \= Y,
    ((padre(P, X), padre(P, Y)) ; (madre(M, X), madre(M, Y))). 

abuelo(X, Z) :- padre(X, Y), (padre(Y, Z) ; madre(Y, Z)).
abuela(X, Z) :- madre(X, Y), (padre(Y, Z) ; madre(Y, Z)).

tio(X, Z) :- hermano(X, Y), (padre(Y, Z) ; madre(Y, Z)).
tia(X, Z) :- hermana(X, Y), (padre(Y, Z) ; madre(Y, Z)).

hermana(X, Y) :- hermano(X, Y), mujer(X).

hombre(juan).
hombre(pedro).
hombre(luis).
hombre(miguel).
hombre(roberto).
hombre(raul).

mujer(maria).
mujer(ana).
mujer(carmen).
mujer(sofia).
mujer(elena).
mujer(lucia).

concuno(X, Z) :- esposo(Y, Z), hermano(X, Y), hombre(X).
concuno(X, Z) :- esposa(Y, Z), hermano(X, Y), hombre(X).
concuna(X, Z) :- esposo(Y, Z), hermana(X, Y), mujer(X).
concuna(X, Z) :- esposa(Y, Z), hermana(X, Y), mujer(X).



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


personaje_rm(rick_sanchez).
personaje_rm(morty_smith).
personaje_rm(summer_smith).
personaje_rm(beth_smith).
personaje_rm(jerry_smith).
personaje_rm(supernova).
personaje_rm(million_ants).
personaje_rm(crocubot).
personaje_rm(mr_goldenfold).
personaje_rm(principal_vagina).
personaje_rm(abuelita_smith).
personaje_rm(birdperson).
personaje_rm(squanchy).
personaje_rm(krombopulos_michael).
personaje_rm(tammy_guetermann).
personaje_rm(gazorpazorpfield).
personaje_rm(reina_gazorpiana).
personaje_rm(zeep_xanflorp).
personaje_rm(habitante_random).
personaje_rm(abradolf_lincler).
personaje_rm(meeseeks).
personaje_rm(robo_butler).
personaje_rm(unity_drone).
personaje_rm(gearhead).
personaje_rm(robo_asesino).
personaje_rm(cyber_morty).
personaje_rm(evil_morty).
personaje_rm(morty_cyborg).
personaje_rm(morty_doofus).
personaje_rm(rick_primer_ministro).
personaje_rm(rick_robot).
personaje_rm(rick_simple).
personaje_rm(pickle_rick).
personaje_rm(toxic_rick).
personaje_rm(toxic_morty).

especie(rick_sanchez, humano).
especie(morty_smith, humano).
especie(summer_smith, humano).
especie(beth_smith, humano).
especie(jerry_smith, humano).
especie(supernova, humano).
especie(million_ants, alien).
especie(crocubot, hibrido).
especie(mr_goldenfold, humano).
especie(principal_vagina, humano).
especie(abuelita_smith, humano).
especie(birdperson, alien).
especie(squanchy, alien).
especie(krombopulos_michael, alien).
especie(tammy_guetermann, humano).
especie(gazorpazorpfield, alien).
especie(reina_gazorpiana, alien).
especie(zeep_xanflorp, alien).
especie(habitante_random, alien).
especie(abradolf_lincler, experimento).
especie(meeseeks, entidad).
especie(robo_butler, robot).
especie(unity_drone, robot).
especie(gearhead, alien).
especie(robo_asesino, robot).
especie(cyber_morty, robot).
especie(evil_morty, humano_alternativo).
especie(morty_cyborg, hibrido).
especie(morty_doofus, humano_alternativo).
especie(rick_primer_ministro, humano_alternativo).
especie(rick_robot, robot).
especie(rick_simple, humano_alternativo).
especie(pickle_rick, transformacion).
especie(toxic_rick, entidad).
especie(toxic_morty, entidad).

grupo(rick_sanchez, familia_sanchez).
grupo(morty_smith, familia_sanchez).
grupo(summer_smith, familia_sanchez).
grupo(beth_smith, familia_sanchez).
grupo(jerry_smith, familia_sanchez).
grupo(supernova, vindicators).
grupo(million_ants, vindicators).
grupo(crocubot, vindicators).
grupo(mr_goldenfold, ciudadanos_tierra).
grupo(principal_vagina, ciudadanos_tierra).
grupo(abuelita_smith, familia_sanchez).
grupo(birdperson, federacion_galactica).
grupo(squanchy, resistencia).
grupo(krombopulos_michael, asesinos).
grupo(tammy_guetermann, federacion_galactica).
grupo(gazorpazorpfield, planeta_gazorpazorp).
grupo(reina_gazorpiana, planeta_gazorpazorp).
grupo(zeep_xanflorp, microverso).
grupo(habitante_random, microverso).
grupo(abradolf_lincler, creaciones_rick).
grupo(meeseeks, creaciones_rick).
grupo(robo_butler, creaciones_rick).
grupo(unity_drone, controlados_unity).
grupo(gearhead, robots_independientes).
grupo(robo_asesino, exterminadores).
grupo(cyber_morty, robots_independientes).
grupo(evil_morty, citadel).
grupo(morty_cyborg, citadel).
grupo(morty_doofus, citadel).
grupo(rick_primer_ministro, consejo_ricks).
grupo(rick_robot, robots_independientes).
grupo(rick_simple, citadel).
grupo(pickle_rick, realidades_extranas).
grupo(toxic_rick, realidades_extranas).
grupo(toxic_morty, realidades_extranas).

rol(rick_sanchez, cientifico).
rol(morty_smith, estudiante).
rol(summer_smith, estudiante).
rol(beth_smith, cirujana).
rol(jerry_smith, desempleado).
rol(supernova, superheroe).
rol(million_ants, superheroe).
rol(crocubot, superheroe).
rol(mr_goldenfold, profesor).
rol(principal_vagina, director).
rol(abuelita_smith, abuela).
rol(birdperson, guerrero).
rol(squanchy, guerrero).
rol(krombopulos_michael, asesino).
rol(tammy_guetermann, agente).
rol(gazorpazorpfield, mascota).
rol(reina_gazorpiana, gobernante).
rol(zeep_xanflorp, cientifico).
rol(habitante_random, esclavo).
rol(abradolf_lincler, experimento).
rol(meeseeks, ayudante).
rol(robo_butler, sirviente).
rol(unity_drone, sirviente).
rol(gearhead, mecanico).
rol(robo_asesino, exterminador).
rol(cyber_morty, mejorado).
rol(evil_morty, presidente).
rol(morty_cyborg, modificado).
rol(morty_doofus, tonto).
rol(rick_primer_ministro, lider).
rol(rick_robot, inteligencia_artificial).
rol(rick_simple, normal).
rol(pickle_rick, pepino).
rol(toxic_rick, malvado).
rol(toxic_morty, malvado).

caracteristica(rick_sanchez, alcoholico).
caracteristica(morty_smith, nervioso).
caracteristica(summer_smith, aventurera).
caracteristica(beth_smith, alcoholica).
caracteristica(jerry_smith, inseguro).
caracteristica(supernova, manipuladora).
caracteristica(million_ants, colonia).
caracteristica(crocubot, mitad_cocodrilo).
caracteristica(mr_goldenfold, adicto_suenos).
caracteristica(principal_vagina, estricto).
caracteristica(abuelita_smith, amorosa).
caracteristica(birdperson, sabio).
caracteristica(squanchy, adicto).
caracteristica(krombopulos_michael, profesional).
caracteristica(tammy_guetermann, traidora).
caracteristica(gazorpazorpfield, odia_lunes).
caracteristica(reina_gazorpiana, dominante).
caracteristica(zeep_xanflorp, inteligente).
caracteristica(habitante_random, ignorante).
caracteristica(abradolf_lincler, confundido).
caracteristica(meeseeks, existencia_dolorosa).
caracteristica(robo_butler, educado).
caracteristica(unity_drone, controlado).
caracteristica(gearhead, aficionado_engranajes).
caracteristica(robo_asesino, programado_matar).
caracteristica(cyber_morty, cyborg).
caracteristica(evil_morty, calculador).
caracteristica(morty_cyborg, mejorado).
caracteristica(morty_doofus, ingenuo).
caracteristica(rick_primer_ministro, burocrata).
caracteristica(rick_robot, mecanico).
caracteristica(rick_simple, ordinario).
caracteristica(pickle_rick, pepinillo).
caracteristica(toxic_rick, parte_oscura).
caracteristica(toxic_morty, inseguridades).

relacion(rick_sanchez, morty_smith, abuelo).
relacion(rick_sanchez, summer_smith, abuelo).
relacion(rick_sanchez, beth_smith, padre).
relacion(morty_smith, summer_smith, hermano).
relacion(morty_smith, beth_smith, hijo).
relacion(morty_smith, jerry_smith, hijo).
relacion(summer_smith, beth_smith, hija).
relacion(summer_smith, jerry_smith, hija).
relacion(beth_smith, jerry_smith, esposa).
relacion(morty_smith, abuelita_smith, nieto).



:- dynamic personaje_adivinado/1.

iniciar_adivinanza :-
    retractall(personaje_adivinado(_)),
    writeln('¡Vamos a jugar a adivinar personajes de Rick and Morty!'),
    writeln('Piensa en un personaje y yo lo adivinaré.'),
    writeln('Responde a mis preguntas con si, no o no_se.'),
    preguntar_especie.

preguntar_especie :-
    writeln('¿Tu personaje es humano?'),
    readln(Input),
    procesar_respuesta(Input, especie, humano).

preguntar_alien :-
    writeln('¿Tu personaje es un alien?'),
    readln(Input),
    procesar_respuesta(Input, especie, alien).

preguntar_robot :-
    writeln('¿Tu personaje es un robot o tiene partes robóticas?'),
    readln(Input),
    procesar_respuesta(Input, especie, robot).

preguntar_familia :-
    writeln('¿Tu personaje es parte de la familia Smith-Sanchez?'),
    readln(Input),
    procesar_respuesta(Input, grupo, familia_sanchez).

preguntar_cientifico :-
    writeln('¿Tu personaje es un científico?'),
    readln(Input),
    procesar_respuesta(Input, rol, cientifico).

preguntar_estudiante :-
    writeln('¿Tu personaje es un estudiante?'),
    readln(Input),
    procesar_respuesta(Input, rol, estudiante).

preguntar_rick :-
    writeln('¿Tu personaje es una versión de Rick?'),
    readln(Input),
    (Input = [si] -> 
        candidatos_rick;
    Input = [no] ->
        preguntar_morty;
    preguntar_morty).

preguntar_morty :-
    writeln('¿Tu personaje es una versión de Morty?'),
    readln(Input),
    (Input = [si] -> 
        candidatos_morty;
    Input = [no] ->
        preguntar_caracteristica;
    preguntar_caracteristica).

preguntar_caracteristica :-
    writeln('¿Tu personaje tiene alguna habilidad especial o superpoder?'),
    readln(Input),
    (Input = [si] -> 
        candidatos_poderes;
    Input = [no] ->
        candidatos_normales;
    candidatos_finales).

candidatos_rick :-
    writeln('¿Tu personaje es la versión original de Rick (C-137)?'),
    readln(Input),
    (Input = [si] -> 
        concluir(rick_sanchez);
    Input = [no] ->
        writeln('¿Tu personaje es un pepinillo?'),
        readln(Input2),
        (Input2 = [si] -> 
            concluir(pickle_rick);
        adivinar_rick));
    adivinar_rick.

adivinar_rick :-
    findall(P, (personaje_rm(P), rol(P, cientifico)), Cientificos),
    length(Cientificos, L),
    (L =:= 1 -> 
        [Unico|_] = Cientificos,
        concluir(Unico);
    L =:= 0 ->
        writeln('No logro identificar a tu personaje. ¿Quién es?'),
        readln([Nombre|_]),
        writeln(['Oh, era ', Nombre, '. ¡Aprendí algo nuevo!']),
        writeln('¿Jugamos otra vez?');
    writeln('Podría ser Rick Simple, Rick Robot, Rick Primer Ministro o Toxic Rick.'),
    writeln('¿Es malvado tu personaje?'),
    readln(Input),
    (Input = [si] -> 
        concluir(toxic_rick);
    writeln('¿Es un robot?'),
    readln(Input2),
    (Input2 = [si] -> 
        concluir(rick_robot);
    writeln('¿Tiene un cargo político?'),
    readln(Input3),
    (Input3 = [si] -> 
        concluir(rick_primer_ministro);
    concluir(rick_simple))))).

candidatos_morty :-
    writeln('¿Tu personaje es malvado?'),
    readln(Input),
    (Input = [si] -> 
        writeln('¿Es el presidente de la Ciudadela?'),
        readln(Input2),
        (Input2 = [si] -> 
            concluir(evil_morty);
        concluir(toxic_morty));
    writeln('¿Tu personaje tiene partes robóticas?'),
    readln(Input3),
    (Input3 = [si] -> 
        concluir(morty_cyborg);
    writeln('¿Tu personaje es notablemente tonto?'),
    readln(Input4),
    (Input4 = [si] -> 
        concluir(morty_doofus);
    concluir(morty_smith)))).

candidatos_poderes :-
    writeln('¿Tu personaje es parte de los Vindicators?'),
    readln(Input),
    (Input = [si] -> 
        writeln('¿Tu personaje está hecho de hormigas?'),
        readln(Input2),
        (Input2 = [si] -> 
            concluir(million_ants);
        writeln('¿Tu personaje es mitad cocodrilo?'),
        readln(Input3),
        (Input3 = [si] -> 
            concluir(crocubot);
        concluir(supernova)));
    writeln('¿Tu personaje es del espacio?'),
    readln(Input4),
    (Input4 = [si] -> 
        candidatos_aliens;
    candidatos_otros_poderes)).

candidatos_aliens :-
    writeln('¿Tu personaje tiene plumas o características de ave?'),
    readln(Input),
    (Input = [si] -> 
        concluir(birdperson);
    writeln('¿Tu personaje dice "squanch" frecuentemente?'),
    readln(Input2),
    (Input2 = [si] -> 
        concluir(squanchy);
    writeln('¿Tu personaje es un asesino profesional?'),
    readln(Input3),
    (Input3 = [si] -> 
        concluir(krombopulos_michael);
    writeln('¿Tu personaje tiene partes mecánicas?'),
    readln(Input4),
    (Input4 = [si] -> 
        concluir(gearhead);
    candidatos_finales)))).

candidatos_otros_poderes :-
    writeln('¿Tu personaje fue creado por Rick?'),
    readln(Input),
    (Input = [si] -> 
        writeln('¿Tu personaje es azul y aparece cuando alguien pide ayuda?'),
        readln(Input2),
        (Input2 = [si] -> 
            concluir(meeseeks);
        concluir(abradolf_lincler));
    candidatos_finales).

candidatos_normales :-
    writeln('¿Tu personaje es de la familia Smith?'),
    readln(Input),
    (Input = [si] -> 
        writeln('¿Tu personaje es uno de los padres?'),
        readln(Input2),
        (Input2 = [si] -> 
            writeln('¿Es la madre/Beth?'),
            readln(Input3),
            (Input3 = [si] -> 
                concluir(beth_smith);
            concluir(jerry_smith));
        writeln('¿Es la hermana/Summer?'),
        readln(Input4),
        (Input4 = [si] -> 
            concluir(summer_smith);
        writeln('¿Es la abuela?'),
        readln(Input5),
        (Input5 = [si] -> 
            concluir(abuelita_smith);
        concluir(morty_smith))));
    candidatos_secundarios).

candidatos_secundarios :-
    writeln('¿Tu personaje trabaja en la escuela?'),
    readln(Input),
    (Input = [si] -> 
        writeln('¿Es el director?'),
        readln(Input2),
        (Input2 = [si] -> 
            concluir(principal_vagina);
        concluir(mr_goldenfold));
    writeln('¿Tu personaje resultó ser un agente encubierto?'),
    readln(Input3),
    (Input3 = [si] -> 
        concluir(tammy_guetermann);
    candidatos_finales)).

candidatos_finales :-
    writeln('Estoy teniendo problemas para adivinar...'),
    writeln('¿Tu personaje es del microverso (la batería de Rick)?'),
    readln(Input),
    (Input = [si] -> 
        writeln('¿Es un científico?'),
        readln(Input2),
        (Input2 = [si] -> 
            concluir(zeep_xanflorp);
        concluir(habitante_random));
    writeln('¿Tu personaje es un robot o máquina?'),
    readln(Input3),
    (Input3 = [si] -> 
        writeln('¿Está diseñado para matar?'),
        readln(Input4),
        (Input4 = [si] -> 
            concluir(robo_asesino);
        concluir(robo_butler));
    writeln('¿Tu personaje es de Gazorpazorp?'),
    readln(Input5),
    (Input5 = [si] -> 
        writeln('¿Es la reina?'),
        readln(Input6),
        (Input6 = [si] -> 
            concluir(reina_gazorpiana);
        concluir(gazorpazorpfield));
    writeln('No logro identificar a tu personaje. ¿Quién es?'),
    readln([Nombre|_]),
    writeln(['Oh, era ', Nombre, '. ¡Aprendí algo nuevo!']),
    writeln('¿Jugamos otra vez?')))).

procesar_respuesta([si], especie, humano) :- 
    preguntar_familia.
procesar_respuesta([no], especie, humano) :- 
    preguntar_alien.
procesar_respuesta([no_se], especie, humano) :- 
    preguntar_alien.

procesar_respuesta([si], especie, alien) :- 
    candidatos_aliens.
procesar_respuesta([no], especie, alien) :- 
    preguntar_robot.
procesar_respuesta([no_se], especie, alien) :- 
    preguntar_robot.

procesar_respuesta([si], especie, robot) :- 
    writeln('¿Tu personaje fue creado por Rick?'),
    readln(Input),
    (Input = [si] -> 
        candidatos_robots_rick;
    candidatos_otros_robots).
procesar_respuesta([no], especie, robot) :- 
    preguntar_cientifico.
procesar_respuesta([no_se], especie, robot) :- 
    preguntar_cientifico.

procesar_respuesta([si], grupo, familia_sanchez) :- 
    preguntar_rick.
procesar_respuesta([no], grupo, familia_sanchez) :- 
    preguntar_caracteristica.
procesar_respuesta([no_se], grupo, familia_sanchez) :- 
    preguntar_caracteristica.

procesar_respuesta([si], rol, cientifico) :- 
    preguntar_rick.
procesar_respuesta([no], rol, cientifico) :- 
    preguntar_estudiante.
procesar_respuesta([no_se], rol, cientifico) :- 
    preguntar_estudiante.

procesar_respuesta([si], rol, estudiante) :- 
    writeln('¿Tu personaje es el hermano menor (Morty)?'),
    readln(Input),
    (Input = [si] -> 
        concluir(morty_smith);
    concluir(summer_smith)).
procesar_respuesta([no], rol, estudiante) :- 
    candidatos_finales.
procesar_respuesta([no_se], rol, estudiante) :- 
    candidatos_finales.

candidatos_robots_rick :-
    writeln('¿Tu personaje es azul y aparece cuando alguien pide un deseo?'),
    readln(Input),
    (Input = [si] -> 
        concluir(meeseeks);
    writeln('¿Tu personaje es un mayordomo?'),
    readln(Input2),
    (Input2 = [si] -> 
        concluir(robo_butler);
    candidatos_finales)).

candidatos_otros_robots :-
    writeln('¿Tu personaje está programado para matar?'),
    readln(Input),
    (Input = [si] -> 
        concluir(robo_asesino);
    writeln('¿Tu personaje tiene partes de Morty?'),
    readln(Input2),
    (Input2 = [si] -> 
        concluir(morty_cyborg);
    writeln('¿Tu personaje está controlado por Unity?'),
    readln(Input3),
    (Input3 = [si] -> 
        concluir(unity_drone);
    candidatos_finales))).

concluir(Personaje) :-
    atom_string(Personaje, PersonajeStr),
    string_concat('¡Ya sé! Tu personaje es ', PersonajeStr, Temp),
    string_concat(Temp, '.', Resp),
    writeln(Resp),
    writeln('¿Acerté? (si/no)'),
    readln(Input),
    (Input = [si] ->
        writeln('¡Excelente! Me encanta este juego. ¿Quieres jugar de nuevo? (si/no)'),
        readln(Input2),
        (Input2 = [si] ->
            iniciar_adivinanza;
        writeln('De acuerdo. ¡Hasta la próxima!'));
    writeln('Oh, me equivoqué. ¿Quién era tu personaje?'),
    readln([Nombre|_]),
    string_concat('Recordaré que ', Nombre, Temp2),
    string_concat(Temp2, ' tiene esas características para la próxima vez.', Resp2),
    writeln(Resp2),
    writeln('¿Quieres jugar de nuevo? (si/no)'),
    readln(Input3),
    (Input3 = [si] ->
        iniciar_adivinanza;
    writeln('De acuerdo. ¡Hasta la próxima!'))).


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



template([que, medicamentos, se, usan, para, el, s(_), '?'], [flagMedicamentos], [6]).
template([que, medicamentos, se, usan, para, la, s(_), '?'], [flagMedicamentos], [6]).
template([medicamentos, para, s(_), '?'], [flagMedicamentos], [2]).
template([tratamiento, farmacologico, para, s(_), '?'], [flagMedicamentos], [3]).


template([tengo, los, siguientes, sintomas, s(_), s(_), y, s(_), '.'], [flagMultiSintomas], [4, 5, 7]).
template([presento, s(_), s(_), y, s(_), '.'], [flagMultiSintomas], [1, 2, 4]).
template([que, tengo, si, presento, s(_), s(_), s(_), '?'], [flagMultiSintomas], [4, 5, 6]).
template([diagnostico, con, s(_), s(_), s(_), '.'], [flagMultiSintomas], [2, 3, 4]).



template([quien, es, el, padre, de, s(_), '?'], [flagPadre], [5]).
template([quien, es, la, madre, de, s(_), '?'], [flagMadre], [5]).
template([hermanos, de, s(_), '?'], [flagHermanos], [2]).
template([hermanas, de, s(_), '?'], [flagHermanas], [2]).
template([quienes, son, los, tios, de, s(_), '?'], [flagTios], [5]).
template([quienes, son, las, tias, de, s(_), '?'], [flagTias], [5]).
template([quien, es, el, abuelo, de, s(_), '?'], [flagAbuelo], [5]).
template([quien, es, la, abuela, de, s(_), '?'], [flagAbuela], [5]).
template([quien, es, el, concuno, de, s(_), '?'], [flagConcuno], [5]).
template([quien, es, la, concuna, de, s(_), '?'], [flagConcuna], [5]).
template([s(_), es, padre, de, s(_), '?'], [flagEsPadre], [0, 4]).
template([s(_), es, madre, de, s(_), '?'], [flagEsMadre], [0, 4]).
template([s(_), y, s(_), son, hermanos, '?'], [flagSonHermanos], [0, 2]).
template([de, quien, es, s(_), padre, '?'], [flagDePadre], [3]).
template([de, quien, es, s(_), madre, '?'], [flagDeMadre], [3]).


template([jugar, adivinar, personaje], [flagJuego], []).
template([jugar, adivinar, personajes], [flagJuego], []).
template([juego, personajes], [flagJuego], []).
template([juego, rick, and, morty], [flagJuego], []).
template([juego, rick, y, morty], [flagJuego], []).
template([adivina, mi, personaje], [flagJuego], []).
template([adivina, quien, soy], [flagJuego], []).



template([hola], ['Hola, soy DocBot. ¿En qué puedo ayudarte?'], []).
template([ayuda], ['Puedes preguntarme sobre síntomas, causas, especialistas, regiones o personas afectadas por ciertas enfermedades.'], []).


respuesta_sintoma(Sintoma, R) :-
	atom_string(AtomSintoma, Sintoma),
	(   sintoma(AtomSintoma),
	    findall(E, tiene_sintoma(E, AtomSintoma), Enfermedades),
	    Enfermedades \= [],
	    atomics_to_string(Enfermedades, ', ', EnfermedadesStr),
	    string_concat('El sintoma que mencionas podria estar relacionado con: ', EnfermedadesStr, Temp),
	    string_concat(Temp, '. Te recomendaria consultar a un medico.', Resp),
	    string_to_atom(Resp, R)
	;   
	    R = 'No tengo informacion sobre ese sintoma especifico. Te recomendaria consultar con un medico.'
	).

respuesta_enfermedad(Enfermedad, R) :-
	atom_string(AtomEnfermedad, Enfermedad),
	(   enfermedad(AtomEnfermedad),
	    findall(S, tiene_sintoma(AtomEnfermedad, S), Sintomas),
	    atomics_to_string(Sintomas, ', ', SintomasStr),
	    findall(C, tiene_causa(AtomEnfermedad, C), Causas),
	    atomics_to_string(Causas, ', ', CausasStr),
	    string_concat('La ', Enfermedad, Temp1),
	    string_concat(Temp1, ' presenta sintomas como: ', Temp2),
	    string_concat(Temp2, SintomasStr, Temp3),
	    string_concat(Temp3, '. Sus causas incluyen: ', Temp4),
	    string_concat(Temp4, CausasStr, Resp),
	    string_to_atom(Resp, R)
	;   
	    R = 'Lo siento, no tengo informacion sobre esa enfermedad.'
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
	    R = 'Lo siento, no tengo informacion sobre las causas de esa condicion.'
	).

respuesta_especialista(Enfermedad, R) :-
	atom_string(AtomEnfermedad, Enfermedad),
	(   enfermedad(AtomEnfermedad),
	    findall(E, tratado_por(AtomEnfermedad, E), Especialistas),
	    Especialistas \= [],
	    atomics_to_string(Especialistas, ', ', EspecialistasStr),
	    string_concat('Para ', Enfermedad, Temp1),
	    string_concat(Temp1, ' deberias consultar con: ', Temp2),
	    string_concat(Temp2, EspecialistasStr, Resp),
	    string_to_atom(Resp, R)
	;   
	    R = 'No tengo informacion sobre que especialista consultar para esa condicion.'
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
	        R = 'No tengo informacion detallada sobre quienes son mas afectados por esa condicion.'
	    )
	;   
	    R = 'No tengo informacion sobre esa condicion.'
	).

respuesta_region(Enfermedad, R) :-
	atom_string(AtomEnfermedad, Enfermedad),
	(   enfermedad(AtomEnfermedad),
	    findall(Reg, prevalente_en(AtomEnfermedad, Reg), Regiones),
	    Regiones \= [],
	    atomics_to_string(Regiones, ', ', RegionesStr),
	    string_concat(Enfermedad, ' es mas comun en: ', Temp1),
	    string_concat(Temp1, RegionesStr, Resp),
	    string_to_atom(Resp, R)
	;   
	    R = 'No tengo informacion sobre las regiones donde es comun esa condicion.'
	).

respuesta_medicamentos(Enfermedad, R) :-
    atom_string(AtomEnfermedad, Enfermedad),
    (   enfermedad(AtomEnfermedad),
        findall(M, tratado_con(AtomEnfermedad, M), Medicamentos),
        Medicamentos \= [],
        atomics_to_string(Medicamentos, ', ', MedicamentosStr),
        string_concat('Los medicamentos comúnmente utilizados para ', Enfermedad, Temp1),
        string_concat(Temp1, ' son: ', Temp2),
        string_concat(Temp2, MedicamentosStr, Temp3),
        string_concat(Temp3, '. Recuerde que estos medicamentos deben ser prescritos por un médico.', Resp),
        string_to_atom(Resp, R)
    ;   
        R = 'No tengo información sobre medicamentos para esa condición o la condición no está en mi base de datos.'
    ).

count_matching_symptoms(_, [], 0).
count_matching_symptoms(Enfermedad, [Sintoma|Resto], Total) :-
    has_symptom(Enfermedad, Sintoma, si),
    count_matching_symptoms(Enfermedad, Resto, RestTotal),
    Total is RestTotal + 1.
count_matching_symptoms(Enfermedad, [Sintoma|Resto], Total) :-
    has_symptom(Enfermedad, Sintoma, no),
    count_matching_symptoms(Enfermedad, Resto, Total).

suggests_disease(Enfermedad, Sintomas) :-
    count_matching_symptoms(Enfermedad, Sintomas, Count),
    Count >= 3.

diagnose_symptoms(Sintomas, Diagnostico) :-
    findall(Enfermedad, (enfermedad(Enfermedad), suggests_disease(Enfermedad, Sintomas)), Enfermedades),
    (   Enfermedades = [] ->
        Diagnostico = 'No parece haber una clara coincidencia con las enfermedades que conozco.'
    ;   Enfermedades = [E] ->
        atom_string(E, Es),
        string_concat('Los sintomas sugieren una posible ', Es, Temp),
        string_concat(Temp, '. Recuerde consultar con un medico para un diagnostico preciso.', Diagnostico)
    ;   atomics_to_string(Enfermedades, ', ', EnfermedadesStr),
        string_concat('Los sintomas podrian sugerir varias condiciones: ', EnfermedadesStr, Temp),
        string_concat(Temp, '. Consulte con un medico para un diagnostico diferencial.', Diagnostico)
    ).


replace0([I1, I2, I3|_], Input, _, Resp, R):- 
    nth0(I1, Input, Sintoma1),
    nth0(I2, Input, Sintoma2),
    nth0(I3, Input, Sintoma3),
    nth0(0, Resp, X),
    X == flagMultiSintomas,
    atom_string(AtomSintoma1, Sintoma1),
    atom_string(AtomSintoma2, Sintoma2), 
    atom_string(AtomSintoma3, Sintoma3),
    diagnose_symptoms([AtomSintoma1, AtomSintoma2, AtomSintoma3], Diagnostico),
    string_to_atom(Diagnostico, R).

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


replace0([I|_], Input, _, Resp, R):- 
    nth0(I, Input, Persona),
    nth0(0, Resp, X),
    X == flagPadre,
    respuesta_padre(Persona, R).

replace0([I|_], Input, _, Resp, R):- 
    nth0(I, Input, Persona),
    nth0(0, Resp, X),
    X == flagMadre,
    respuesta_madre(Persona, R).

replace0([I|_], Input, _, Resp, R):- 
    nth0(I, Input, Persona),
    nth0(0, Resp, X),
    X == flagHermanos,
    respuesta_hermanos(Persona, R).

replace0([I|_], Input, _, Resp, R):- 
    nth0(I, Input, Persona),
    nth0(0, Resp, X),
    X == flagHermanas,
    respuesta_hermanas(Persona, R).

replace0([I|_], Input, _, Resp, R):- 
    nth0(I, Input, Persona),
    nth0(0, Resp, X),
    X == flagTios,
    respuesta_tios(Persona, R).

replace0([I|_], Input, _, Resp, R):- 
    nth0(I, Input, Persona),
    nth0(0, Resp, X),
    X == flagTias,
    respuesta_tias(Persona, R).

replace0([I|_], Input, _, Resp, R):- 
    nth0(I, Input, Persona),
    nth0(0, Resp, X),
    X == flagAbuelo,
    respuesta_abuelo(Persona, R).

replace0([I|_], Input, _, Resp, R):- 
    nth0(I, Input, Persona),
    nth0(0, Resp, X),
    X == flagAbuela,
    respuesta_abuela(Persona, R).

replace0([I|_], Input, _, Resp, R):- 
    nth0(I, Input, Persona),
    nth0(0, Resp, X),
    X == flagConcuno,
    respuesta_concuno(Persona, R).

replace0([I|_], Input, _, Resp, R):- 
    nth0(I, Input, Persona),
    nth0(0, Resp, X),
    X == flagConcuna,
    respuesta_concuna(Persona, R).

replace0([I1, I2|_], Input, _, Resp, R):- 
    nth0(I1, Input, Padre),
    nth0(I2, Input, Hijo),
    nth0(0, Resp, X),
    X == flagEsPadre,
    respuesta_es_padre(Padre, Hijo, R).

replace0([I|_], Input, _, Resp, R):- 
    nth0(I, Input, Enfermedad),
    nth0(0, Resp, X),
    X == flagMedicamentos,
    respuesta_medicamentos(Enfermedad, R).
    
replace0([I1, I2|_], Input, _, Resp, R):- 
    nth0(I1, Input, Madre),
    nth0(I2, Input, Hijo),
    nth0(0, Resp, X),
    X == flagEsMadre,
    respuesta_es_madre(Madre, Hijo, R).

replace0([I1, I2|_], Input, _, Resp, R):- 
    nth0(I1, Input, PersonaA),
    nth0(I2, Input, PersonaB),
    nth0(0, Resp, X),
    X == flagSonHermanos,
    respuesta_son_hermanos(PersonaA, PersonaB, R).

replace0([I|_], Input, _, Resp, R):- 
    nth0(I, Input, Padre),
    nth0(0, Resp, X),
    X == flagDePadre,
    respuesta_de_padre(Padre, R).

replace0([I|_], Input, _, Resp, R):- 
    nth0(I, Input, Madre),
    nth0(0, Resp, X),
    X == flagDeMadre,
    respuesta_de_madre(Madre, R).

replace0([_|_], _, _, Resp, 'Iniciando juego de adivinar personajes de Rick and Morty...'):- 
    nth0(0, Resp, X),
    X == flagJuego, !,
    iniciar_adivinanza.

match([],[]).
match([], _):- true.

match([S|Stim],[I|Input]) :-
	atom(S),
	S == I,
	match(Stim, Input),!.

match([S|Stim],[_|Input]) :-
	\+atom(S),
	match(Stim, Input),!.

respuesta_padre(Hijo, R) :-
    atom_string(AtomHijo, Hijo),
    (   persona(AtomHijo),
        findall(P, padre(P, AtomHijo), Padres),
        (   Padres = [Padre] ->
            atom_string(Padre, PadreStr),
            string_concat('El padre de ', Hijo, Temp),
            string_concat(Temp, ' es ', Temp2),
            string_concat(Temp2, PadreStr, Resp)
        ;   Resp = 'No tengo informacion sobre el padre de esa persona'
        ),
        string_to_atom(Resp, R)
    ;   R = 'No reconozco esa persona en mis datos'
    ).

respuesta_madre(Hijo, R) :-
    atom_string(AtomHijo, Hijo),
    (   persona(AtomHijo),
        findall(M, madre(M, AtomHijo), Madres),
        (   Madres = [Madre] ->
            atom_string(Madre, MadreStr),
            string_concat('La madre de ', Hijo, Temp),
            string_concat(Temp, ' es ', Temp2),
            string_concat(Temp2, MadreStr, Resp)
        ;   Resp = 'No tengo informacion sobre la madre de esa persona'
        ),
        string_to_atom(Resp, R)
    ;   R = 'No reconozco esa persona en mis datos'
    ).

respuesta_hermanos(Persona, R) :-
    atom_string(AtomPersona, Persona),
    (   persona(AtomPersona),
        findall(H, (hermano(H, AtomPersona), hombre(H)), Hermanos),
        (   Hermanos \= [] ->
            atomics_to_string(Hermanos, ', ', HermanosStr),
            string_concat('Los hermanos de ', Persona, Temp),
            string_concat(Temp, ' son: ', Temp2),
            string_concat(Temp2, HermanosStr, Resp)
        ;   Resp = 'No tengo informacion sobre hermanos de esa persona'
        ),
        string_to_atom(Resp, R)
    ;   R = 'No reconozco esa persona en mis datos'
    ).

respuesta_hermanas(Persona, R) :-
    atom_string(AtomPersona, Persona),
    (   persona(AtomPersona),
        findall(H, (hermano(H, AtomPersona), mujer(H)), Hermanas),
        (   Hermanas \= [] ->
            atomics_to_string(Hermanas, ', ', HermanasStr),
            string_concat('Las hermanas de ', Persona, Temp),
            string_concat(Temp, ' son: ', Temp2),
            string_concat(Temp2, HermanasStr, Resp)
        ;   Resp = 'No tengo informacion sobre hermanas de esa persona'
        ),
        string_to_atom(Resp, R)
    ;   R = 'No reconozco esa persona en mis datos'
    ).

respuesta_tios(Persona, R) :-
    atom_string(AtomPersona, Persona),
    (   persona(AtomPersona),
        findall(T, (tio(T, AtomPersona)), Tios),
        (   Tios \= [] ->
            atomics_to_string(Tios, ', ', TiosStr),
            string_concat('Los tios de ', Persona, Temp),
            string_concat(Temp, ' son: ', Temp2),
            string_concat(Temp2, TiosStr, Resp)
        ;   Resp = 'No tengo informacion sobre tios de esa persona'
        ),
        string_to_atom(Resp, R)
    ;   R = 'No reconozco esa persona en mis datos'
    ).

respuesta_tias(Persona, R) :-
    atom_string(AtomPersona, Persona),
    (   persona(AtomPersona),
        findall(T, (tia(T, AtomPersona)), Tias),
        (   Tias \= [] ->
            atomics_to_string(Tias, ', ', TiasStr),
            string_concat('Las tias de ', Persona, Temp),
            string_concat(Temp, ' son: ', Temp2),
            string_concat(Temp2, TiasStr, Resp)
        ;   Resp = 'No tengo informacion sobre tias de esa persona'
        ),
        string_to_atom(Resp, R)
    ;   R = 'No reconozco esa persona en mis datos'
    ).

respuesta_abuelo(Persona, R) :-
    atom_string(AtomPersona, Persona),
    (   persona(AtomPersona),
        findall(A, (abuelo(A, AtomPersona)), Abuelos),
        (   Abuelos \= [] ->
            atomics_to_string(Abuelos, ', ', AbuelosStr),
            string_concat('Los abuelos de ', Persona, Temp),
            string_concat(Temp, ' son: ', Temp2),
            string_concat(Temp2, AbuelosStr, Resp)
        ;   Resp = 'No tengo informacion sobre abuelos de esa persona'
        ),
        string_to_atom(Resp, R)
    ;   R = 'No reconozco esa persona en mis datos'
    ).

respuesta_abuela(Persona, R) :-
    atom_string(AtomPersona, Persona),
    (   persona(AtomPersona),
        findall(A, (abuela(A, AtomPersona)), Abuelas),
        (   Abuelas \= [] ->
            atomics_to_string(Abuelas, ', ', AbuelasStr),
            string_concat('Las abuelas de ', Persona, Temp),
            string_concat(Temp, ' son: ', Temp2),
            string_concat(Temp2, AbuelasStr, Resp)
        ;   Resp = 'No tengo informacion sobre abuelas de esa persona'
        ),
        string_to_atom(Resp, R)
    ;   R = 'No reconozco esa persona en mis datos'
    ).

respuesta_concuno(Persona, R) :-
    atom_string(AtomPersona, Persona),
    (   persona(AtomPersona),
        findall(C, (concuno(C, AtomPersona)), Concunos),
        (   Concunos \= [] ->
            atomics_to_string(Concunos, ', ', ConcunosStr),
            string_concat('Los concunos de ', Persona, Temp),
            string_concat(Temp, ' son: ', Temp2),
            string_concat(Temp2, ConcunosStr, Resp)
        ;   Resp = 'No tengo informacion sobre concunos de esa persona'
        ),
        string_to_atom(Resp, R)
    ;   R = 'No reconozco esa persona en mis datos'
    ).

respuesta_concuna(Persona, R) :-
    atom_string(AtomPersona, Persona),
    (   persona(AtomPersona),
        findall(C, (concuna(C, AtomPersona)), Concunas),
        (   Concunas \= [] ->
            atomics_to_string(Concunas, ', ', ConcunasStr),
            string_concat('Las concunas de ', Persona, Temp),
            string_concat(Temp, ' son: ', Temp2),
            string_concat(Temp2, ConcunasStr, Resp)
        ;   Resp = 'No tengo informacion sobre concunas de esa persona'
        ),
        string_to_atom(Resp, R)
    ;   R = 'No reconozco esa persona en mis datos'
    ).

respuesta_es_padre(Padre, Hijo, R) :-
    atom_string(AtomPadre, Padre),
    atom_string(AtomHijo, Hijo),
    (   persona(AtomPadre), persona(AtomHijo),
        (   padre(AtomPadre, AtomHijo) ->
            string_concat('Si, ', Padre, Temp),
            string_concat(Temp, ' es padre de ', Temp2),
            string_concat(Temp2, Hijo, Resp)
        ;   string_concat('No, ', Padre, Temp),
            string_concat(Temp, ' no es padre de ', Temp2),
            string_concat(Temp2, Hijo, Resp)
        ),
        string_to_atom(Resp, R)
    ;   R = 'No reconozco a una o ambas personas en mis datos'
    ).

respuesta_es_madre(Madre, Hijo, R) :-
    atom_string(AtomMadre, Madre),
    atom_string(AtomHijo, Hijo),
    (   persona(AtomMadre), persona(AtomHijo),
        (   madre(AtomMadre, AtomHijo) ->
            string_concat('Si, ', Madre, Temp),
            string_concat(Temp, ' es madre de ', Temp2),
            string_concat(Temp2, Hijo, Resp)
        ;   string_concat('No, ', Madre, Temp),
            string_concat(Temp, ' no es madre de ', Temp2),
            string_concat(Temp2, Hijo, Resp)
        ),
        string_to_atom(Resp, R)
    ;   R = 'No reconozco a una o ambas personas en mis datos'
    ).

respuesta_son_hermanos(A, B, R) :-
    atom_string(AtomA, A),
    atom_string(AtomB, B),
    (   persona(AtomA), persona(AtomB),
        (   hermano(AtomA, AtomB) ->
            string_concat('Si, ', A, Temp),
            string_concat(Temp, ' y ', Temp2),
            string_concat(Temp2, B, Temp3),
            string_concat(Temp3, ' son hermanos', Resp)
        ;   string_concat('No, ', A, Temp),
            string_concat(Temp, ' y ', Temp2),
            string_concat(Temp2, B, Temp3),
            string_concat(Temp3, ' no son hermanos', Resp)
        ),
        string_to_atom(Resp, R)
    ;   R = 'No reconozco a una o ambas personas en mis datos'
    ).

respuesta_de_padre(Padre, R) :-
    atom_string(AtomPadre, Padre),
    (   persona(AtomPadre),
        findall(H, padre(AtomPadre, H), Hijos),
        (   Hijos \= [] ->
            atomics_to_string(Hijos, ', ', HijosStr),
            string_concat(Padre, ' es padre de: ', Temp),
            string_concat(Temp, HijosStr, Resp)
        ;   string_concat(Padre, ' no tiene hijos registrados', Resp)
        ),
        string_to_atom(Resp, R)
    ;   R = 'No reconozco esa persona en mis datos'
    ).

respuesta_de_madre(Madre, R) :-
    atom_string(AtomMadre, Madre),
    (   persona(AtomMadre),
        findall(H, madre(AtomMadre, H), Hijos),
        (   Hijos \= [] ->
            atomics_to_string(Hijos, ', ', HijosStr),
            string_concat(Madre, ' es madre de: ', Temp),
            string_concat(Temp, HijosStr, Resp)
        ;   string_concat(Madre, ' no tiene hijos registrados', Resp)
        ),
        string_to_atom(Resp, R)
    ;   R = 'No reconozco esa persona en mis datos'
    ).

