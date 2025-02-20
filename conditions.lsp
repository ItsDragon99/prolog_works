; 1.- Que calcule el sueldo que le corresponde al trabajador de una
; empresa que cobra 40.000 euros anuales, el programa debe realizar los
; cálculos en función de los siguientes criterios:

; • Si lleva más de 10 años en la empresa se le aplica un aumento del 10%.
; • Si lleva menos de 10 años pero más que 5 se le aplica un aumento del
;   7%.
; • Si lleva menos de 5 años pero más que 3 se le aplica un aumento del
;   5%.
; • Si lleva menos de 3 años se le aplica un aumento del 3%.()
(defvar *final-salary* 40000)

(defun salary(age)
    (cond ((> age 10) (* *final-salary* 1.1))
          ((> age 5) (* *final-salary* 1.07))
          ((> age 3) (* *final-salary* 1.05))
          (t (* *final-salary* 1.03))
    )
)

; 2.- Hacer un algortimo que tome el peso en libras de una cantidad de
; ropa a lavar en una lavadora y nos devuelva el nivel dependiendo del
; peso; además nos informe la cantidad de litros de agua que
; necesitamos. Se sabe que con más de 30 libras la lavadora no funcionara
; ya que es demasiado peso. Si la ropa pesa 22 ó más libras, el nivel será
; de máximo; si pesa 15 ó más nivel será de alto; si pesa 8 ó más será un
; nivel medio o de lo contrario el nivel será minimo

(defun wash(pounds)
    (cond ((> pounds 30) "Lavadora no funcionara")
           ((> pounds 22) "máximo")
           ((> pounds 15) "alto")
           ((> pounds 8) "medio")
    )
 )

; 3.- Martha va a realizar su fiesta de quince años. Por lo cual ha
; invitado a una gran cantidad de personas. Pero también ha decidido
; algunas reglas: Que todas las personas con edades mayores a los quince
; años, sólo pueden entrar si traen regalos; que jóvenes con los quince
; años cumplidos entra totalmente gratis pero los de menos de quince años
; no pueden entrar a la fiesta. Hacer un algoritmo donde se tome la edad
; de una persona y que requisito de los anteriores le toca cumplir si
; quiere entrar.

(defun party(age)
    (cond ((> age 15) "con regalos")
          ((= age 15) "entran gratis")
          (t "No entran")
    )
)