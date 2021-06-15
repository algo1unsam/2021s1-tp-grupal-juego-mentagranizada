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
		keyboard.right().onPressDo{ pepe.revisar(pepe.position().right(1), "right")}
		keyboard.left().onPressDo{ pepe.revisar(pepe.position().left(1), "left")}
		keyboard.up().onPressDo{ pepe.revisar(pepe.position().up(1), "up")}
		keyboard.down().onPressDo{ pepe.revisar(pepe.position().down(1), "down")}
		keyboard.space().onPressDo{ pepe.accion()}
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