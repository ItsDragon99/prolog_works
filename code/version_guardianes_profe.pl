/* 
Problema 1: Los guardianes de los templos
Cuatro guardianes (Apolo, Hécate, Ares y Hermes) custodian templos mitológicos asociados con diferentes elementos (fuego, agua, tierra y aire). Sabemos que:

Apolo no cuida el templo de fuego ni el de tierra.
Hécate no cuida el templo de aire.
Ares no cuida el templo de agua ni de aire.
Hermes cuida el templo de fuego o de agua.
Pregunta: ¿Qué templo cuida cada guardián?
*/

% Hechos monarios
guardian(apolo).
guardian(hecate).
guardian(ares).
guardian(hermes).

templo(fuego).
templo(agua).
templo(tierra).
templo(aire).


templo_cuida(apolo, aire).
templo_cuida(hecate, tierra).
templo_cuida(ares, fuego).
templo_cuida(hermes, fuego, agua).


no_cuida(apolo, fuego, tierra).
no_cuida(hecate, aire, _).
no_cuida(ares, agua, aire).


% Consulta
? templo_cuida(Guardian, Templo).
