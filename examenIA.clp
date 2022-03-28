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
)