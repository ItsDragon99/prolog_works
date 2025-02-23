(defparameter *nodos* 
  '(
    (humanos
      (sanchez-familia
        (dimension-c137
          (cientifico-loco (rick-sanchez morty-smith))
          (nietos-rick-sanchez (morty-smith summer-smith))
        )
        (padres 
          (madre (beth-smith beth-esposa))
          (padre (jerry-smith jerry-esposo))
        )
      )
      (escuadron-vindicators
        (lider (supernova million-ants))
        (cocodrilo-robot (crocubot robo-crocubot))
      )
      (ciudadanos-de-la-tierra
        (profesores (mr-goldenfold principal-vagina))
        (familia-smith (abuelita-smith abuelo-smith))
      )
    )
    (extraterrestres
      (federacion-galactica
        (rebeldes (birdperson squanchy))
        (agentes (krombopulos-michael tammy-guetermann))
      )
      (planeta-gazorpazorp
        (habitantes (gazorpazorpfield reina-gazorpiana))
        (sociedad (gazorp-macho gazorp-queen))
      )
    )
    (robots
      (creaciones-de-rick
        (experimentos (abradolf-lincler meeseeks))
        (sirvientes (robo-butler helper-bot))
      )
      (robots-independientes
        (drones (unity-drone autonomo-robot))
        (guerreros (gearhead robo-soldier))
      )
      (exterminadores
        (asesinos (robo-asesino exterminador-bot))
        (mejoras (cyber-morty cyber-rick))
      )
    )
    (dimensiones-alternas
      (mortys
        (lideres (evil-morty del-morty))
        (modificados (cyborg-morty mutant-morty))
      )
      (ricks
        (lideres (rick-primer-ministro rick-diplomatico))
        (normales (rick-simple rick-honesto))
      )
      (realidades-extrañas
        (mutaciones (pickle-rick mustard-rick))
        (toxicidades (toxic-rick toxic-morty))
      )
    )
  )
)



(defun akinator-choose-list(nodos)
      (princ #\newline)
      (princ "Tu personaje es: ")
      (princ (car nodos))
      (princ "? (si/no): ")
      (setq resp (read-line))
      (if (string= resp "si")
        (akinator (car nodos))
        (progn
          (akinator-choose-list (cdr nodos))
        )
      )
)

(defun akinator-questions (nodos)
      ; (princ #\newline)
      ; (princ nodos)
      (princ #\newline)
      (princ "Tu personaje es un?: ")
      (setq path (car (first nodos)))
      (princ path)
      (princ "? (si/no): ")
      (setq resp (read-line))
      
      (if (string= resp "si")
        (progn
          (setq *nuevo_nodo* (cdr (assoc path nodos)) )
          (akinator *nuevo_nodo*)
        )
        (progn
            (setq *nuevo_nodo* (cdr nodos))
            (akinator *nuevo_nodo*)
        ) 
      )

)
(defun akinator (nodos)
  (if (atom nodos)
      (progn
        (princ "Ya se quien es tu personaje padrino! Tu personaje es: ")
        (princ nodos)
      )
      (progn
      (if (cdr nodos)   
       (progn
          (akinator-questions nodos)
        )
        (progn 
          (akinator-choose-list (car nodos))
        )
      )
  )
  )
)

        

(defun start-akinator ()
  (akinator *nodos*)
)