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
		keyboard.r().onPressDo{ pepe.nivelActual().reiniciar()}
		keyboard.enter().onPressDo{ menu.empezarJuego()}
//		keyboard.j().onPressDo{game.say(cartel, nivel1.pista().toString()) }
		keyboard.j().onPressDo{pepe.nivelActual().mostrarSolucion() }
	}

	method ganar() {
		if (metas.cajasEnSuLugar()) {
			if(pepe.nivelActual().siguienteNivel().toString() == fin.toString()){
				fin.ejecutar()
			}
			else{
				game.schedule(200, {=> sonido.reproducir("nivel_ganar")})
				game.schedule(tiempo, {=> pepe.nivelActual().avanzarA(pepe.nivelActual().siguienteNivel())})
			}
			
			}
	}
	
	method revisarColision(unObjeto, nuevaPosicion) {
		return colisionables.lista().any{ unColisionable => unColisionable.position() == nuevaPosicion }
	}
	
	method sumarReintento(){
		reintentos +=1
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