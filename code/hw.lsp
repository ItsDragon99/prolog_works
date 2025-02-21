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