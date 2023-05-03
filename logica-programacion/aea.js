var partGanados = parseInt(prompt('¿Cuantos partidos ganó el equipo?'))

var partEmpatados = parseInt(prompt('¿Cuantos partidos empató el equipo?'))

var partPerdidos = parseInt(prompt('¿Cuantos partidos perdio el equipo?'))

var ptosTotales = (partEmpatados*1) + (partPerdidos*-2) + (partGanados*3)

console.log("El total de puntos del equipo es " + ptosTotales)