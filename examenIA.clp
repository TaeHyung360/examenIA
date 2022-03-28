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

    (robot pedido naranjas $?naranjas manzanas $?manzanas caquis $?caquis uvas $?uvas inventarioRobot naranjas $?Inaranjas manzanas $?Imanzanas caquis $?Icaquis uvas $?Iuvas operaciones $?operaciones , $?naranjasP $?manzanasP $?caquisP $?uvasP)
    (pedido naranjas $?naranjasP manzanas $?manzanasP caquis $?caquisP uvas $?uvasP)
    (palets naranjas ?$PlNaranja manzanas $?PlManzana caquis $?PlCaqui uvas $?PlUvas)
    (test (<= $?Inaranjas 3))
    (test (<= $?Imanzanas 3))
    (test (<= $?Icaquis 3))
    (test (<= $?Iuvas 3))
    (test (> (length$ $?PlNaranja) 0))
    (test (> (length$ $?PlManzana) 0))
    (test (> (length$ $?PlCaqui) 0))
    (test (> (length$ $?PlUvas) 0))
    => 
    (assert(robot pedido naranjas $?naranjas manzanas $?manzanas caquis $?caquis uvas $?uvas inventarioRobot naranjas $?naranjasP manzanas $?manzanasP caquis $?caquisP uvas $?uvasP operaciones $?operaciones , $?naranjasP $?manzanasP $?caquisP $?uvasP))
    (assert(((palets naranjas ?$PlNaranja-$?naranjasP manzanas $?PlManzana-$?manzanasP caquis $?PlCaqui-$?caquisP uvas $?PlUvas-$?uvasP))))
)

(defrule descargarPedido

    (robot pedido naranjas $?naranjas manzanas $?manzanas caquis $?caquis uvas $?uvas inventarioRobot naranjas $?Inaranjas manzanas $?Imanzanas caquis $?Icaquis uvas $?Iuvas operaciones $?operaciones , $?naranjasP $?manzanasP $?caquisP $?uvasP)
    (lineaDePedido naranjas $?naranjas manzanas $?manzanas caquis $?caquis uvas $?uvas)
    => 
    (assert((lineaDePedido naranjas $?Inaranjas manzanas $?Imanzanas caquis $?Icaquis uvas $?Iuvas))
)