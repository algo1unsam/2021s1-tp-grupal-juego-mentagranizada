import wollok.game.*
import pepe.*
import objetos.*
import niveles.*
import menuYExtras.*

object config {
	const property volumen = 0.6
	const tiempo = 900
	const property alto = 9
	const property ancho = 11
	var property reintentos = 0
		
	method configurarTeclas() {
		keyboard.right().onPressDo{ pepe.guardarDireccion(right) }
		keyboard.left().onPressDo{ pepe.guardarDireccion(left) }
		keyboard.up().onPressDo{ pepe.guardarDireccion(up) }
		keyboard.down().onPressDo{ pepe.guardarDireccion(down) }
		keyboard.space().onPressDo{ pepe.accion() }
		keyboard.r().onPressDo{ configNivel.reiniciar()}
		keyboard.enter().onPressDo{ menu.empezarJuego()}
		keyboard.j().onPressDo{self.mostrarSolucion(configNivel.nivelActual()) }
	}

	method ganar() {
		if (metas.cajasEnSuLugar()) {
			if(configNivel.siguienteNivel().toString() == fin.toString()){
				fin.ejecutar()
			}
			else{
				game.schedule(200, {=> sonido.reproducir("nivel_ganar")})
				game.schedule(tiempo, {=> configNivel.cambiarDeNivel()})
			}
			
		}
				
		
		return null
	}
	
	method moverSiNoColisiona(unObjeto, nuevaPosicion) {
		if (colisionables.lista().any{ unColisionable => unColisionable.position() == nuevaPosicion }) {
		// Si hay algo con lo que colisiona, no hace nada.
		}
		else {
			unObjeto.mover(nuevaPosicion)
		}
	}
	
	method sumarReintento(){
		reintentos +=1
	}
	
	method estaDesesperado() = reintentos > 3
	method mostrarSolucion(unNivel){
		game.addVisual(unNivel.pista())
		game.schedule(3000, { game.removeVisual(unNivel.pista())})
	}

	method cajasEnSuLugar() = metas.lista().all{ unaMeta => unaMeta.cajaEnSitio() }

}

object up {
	
	method posicionSiguiente(unObjeto){
		return unObjeto.position().up(1)
	}
}

object left {
	
	method posicionSiguiente(unObjeto){
		return unObjeto.position().left(1)
	}
}

object down {
	
	method posicionSiguiente(unObjeto){
		return unObjeto.position().down(1)
	}
}

object right {
	
	method posicionSiguiente(unObjeto){
		return unObjeto.position().right(1)
	}
}