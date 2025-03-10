- La tierra es un planeta
    - Constante individual, propiedad planeta
    - `Planeta(tierra) --> p(t)`
    - 

- La luna no es un planeta
    - Constante individual, Luna no tiene la propiedad de ser un planeta
    - `~Planeta(luna)`

- La luna es un satelite
    - Constante individual, Luna propiedad es ser satelite
    - `Satelite(Luna)`

- La tierra gira alrede del sol
    - Constante individual Tierra y Sol
    - `Gira_alrededor(Tierra, Sol)`

- Todo planeta es un satelite
    - `AxP(x)^S(x)`

- Todo planeta gira alrededor del sol
    - `AxP(x) ->  Gira_alrededor(X)`

- Algún planeta gira alrededor de la luna
    - `Ex (Planeta(x) ∧ Gira_alrededor(x, Luna))`

- Hay por lo menos un satelite
    - `Ex (Satelite(x))`

- Todos los perros del vecindario muerden algun cartero
    - `AxP(X)->E(y)^m(X ,Y)`

- Hay un perro que muerde a todos los perrros que muerden a algun cartero
    -

- Hay un solo perro que se muerde a sí mismo
    -
    