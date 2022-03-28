;===============================================================================================================================================
;Nombre del fichero:  examenIA.clp
;Autor: Juan Ferrera Sala
;Fecha: 28/03/2020
;===============================================================================================================================================
;Definicion del problema
;===============================================================================================================================================
(deffacts BH
    (palets naranjas 10 manzanas 10 caquis 10 uvas 10)
    (robot pedido naranjas manzanas caquis uvas inventarioRobot naranjas manzanas caquis uvas operaciones)
    (pedido naranjas 2 manzanas 3 caquis 0 uvas 1)
    (lineaDePedido naranjas 0 manzanas 0 caquis 0 uvas 0)
)

(defrule meta
    (declare (salience 100))
    (lineaDePedido naranjas $?naranjas manzanas $?manzanas caquis $?caquis uvas $?uvas)
    (pedido naranjas $?naranjasP manzanas $?manzanasP caquis $?caquisP uvas $?uvasP)
    (test (= $?naranjas $?naranjasP))
    (test (= $?manzanas $?manzanasP))
    (test (= $?caquis $?caquisP))
    (test (= $?uvas $?uvasP))
    => 
    (printout t "Fin ========================================" crlf)
    (halt)
)

(defrule robotPedido

    (robot pedido naranjas $?naranjas manzanas $?manzanas caquis $?caquis uvas $?uvas inventarioRobot naranjas $?Inaranjas manzanas $?Imanzanas caquis $?Icaquis uvas $?Iuvas operaciones)
    (pedido naranjas $?naranjasP manzanas $?manzanasP caquis $?caquisP uvas $?uvasP)
    (test (<= $?Inaranjas 3))
    (test (<= $?Imanzanas 3))
    (test (<= $?Icaquis 3))
    (test (<= $?Iuvas 3))
    => 
    
)

