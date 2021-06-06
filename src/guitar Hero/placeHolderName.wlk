import wollok.game.*
import botones.*
import notas.*
import graficos.*

object placeHolderName {
	method start(){
		game.addVisual(gif)
		game.onTick(200, "cambiarFrame", { gif.cambiarFrame()})
		game.addVisual(puntos)
		game.addVisual(tablero2)
		const botones = [botonA,botonS,botonD,botonF]
		botones.forEach{unBoton => game.addVisual(unBoton)}
		game.addVisual(nota0)
		game.addVisual(nota1)
		game.addVisual(nota2)
		game.addVisual(nota3)
		game.boardGround("tablero.png")
	}
}

object puntaje {
	var puntos = 0
	method sumarPuntos() {
		puntos += 100	
	}
}