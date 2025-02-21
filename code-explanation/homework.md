# Tarea de:
## Hacer 5 funciones de volumenes y 5 de areas
## Funciones primitivas de lisp

Este código en Lisp incluye funciones para calcular volúmenes y áreas de figuras geométricas como cubos, esferas, cilindros, conos, cuadrados, círculos, triángulos y rectángulos. También maneja operaciones con listas, como obtener o eliminar elementos, y operaciones matemáticas básicas como suma, resta, multiplicación y división. Es una herramienta útil para trabajar con cálculos y manipulación de datos en Lisp de manera sencilla.


```lisp
;; Hacer 5 funciones de volumenes y 5 de areas
;; Funciones primitivas de lisp

;; Volumen de un cubo
(defun volumen-cubo (lado)
    (* lado lado lado))

;; Volumen de una esfera
(defun volumen-esfera (radio)
    (* (/ 4 3) pi (expt radio 3)))

;; Volumen de un cilindro
(defun volumen-cilindro (radio altura)
    (* pi (expt radio 2) altura))

;; Volumen de un cono
(defun volumen-cono (radio altura)
    (/ (* pi (expt radio 2) altura) 3))

;; Volumen de un prisma rectangular
(defun volumen-prisma-rectangular (largo ancho altura)
    (* largo ancho altura))

;; Área de un cuadrado
(defun area-cuadrado (lado)
    (* lado lado))

;; Área de un círculo
(defun area-circulo (radio)
    (* pi (expt radio 2)))

;; Área de un triángulo
(defun area-triangulo (base altura)
    (/ (* base altura) 2))

;; Área de un rectángulo
(defun area-rectangulo (largo ancho)
    (* largo ancho))

;; Área de un trapecio
(defun area-trapecio (base-mayor base-menor altura)
    (/ (* (+ base-mayor base-menor) altura) 2))

(car '(1 2 3)) ; Saca el primer elemento de la lista => 1
(cdr '(1 2 3)) ; Elimina el primer elemento y te da el resto => (2 3)
(cons 0 '(1 2 3)) ; Mete el 0 al principio de la lista => (0 1 2 3)
(list 1 2 3 4) ; Crea una lista con estos números => (1 2 3 4)
(append '(1 2) '(3 4)) ; Junta estas dos listas en una sola => (1 2 3 4)
(length '(1 2 3)) ; Te dice cuántos elementos tiene la lista => 3
(+ 1 2 3) ; Suma todo esto => 6
(- 10 4) ; Resta 10 menos 4 => 6
(* 2 3 4) ; Multiplica todo => 24
(/ 10 2) ; Divide 10 entre 2 => 5
(expt 2 3) ; Calcula 2 elevado a la 3 => 8
(sqrt 16) ; Saca la raíz cuadrada de 16 => 4
(and t nil t) ; Solo devuelve verdadero si TODO es verdadero => nil
(or nil nil t) ; Devuelve verdadero si ALGO es verdadero => t
(not t) ; Le da la vuelta a t, lo convierte en falso => nil
(= 3 3) ; Pregunta si 3 es igual a 3 => t
(> 5 3) ; Pregunta si 5 es mayor que 3 => t
(< 2 4) ; Pregunta si 2 es menor que 4 => t
(equal '(1 2 3) '(1 2 3)) ; Pregunta si estas listas son iguales => t
(string= "hola" "hola") ; Comprueba si las dos cadenas son iguales => t
(concatenate 'string "Hola, " "mundo!") ; Junta estas cadenas en una sola => "Hola, mundo!"
(string-length "Lisp") ; Te dice cuántas letras tiene esta cadena => 4
(reduce #'+ (append '(1 2 3) '(4 5 6))) ; Junta las listas y suma todo => 21
(defun es-par (n)
    "Devuelve t si n es un número par, nil en caso contrario."
    (zerop (mod n 2)))

(es-par 4) ; => t
(es-par 5) ; => nil

```




