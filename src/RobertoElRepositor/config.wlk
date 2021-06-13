import wollok.game.*
import karoshi.*
import objetos.*
import niveles.*
import menuYExtras.*

object config {

	const property alto = 9
	const property ancho = 11
	var unTexto = "No ganaste"

	method configurarTeclas() {
		keyboard.right().onPressDo{ karoshi.revisar(karoshi.position().right(1), right)}
		keyboard.left().onPressDo{ karoshi.revisar(karoshi.position().left(1), left)}
		keyboard.up().onPressDo{ karoshi.revisar(karoshi.position().up(1), up)}
		keyboard.down().onPressDo{ karoshi.revisar(karoshi.position().down(1), down)}
		keyboard.space().onPressDo{ karoshi.accion()}
		keyboard.r().onPressDo{ tutorial.reiniciar()}
		keyboard.enter().onPressDo{ menu.empezarJuego()}	
	// keyboard.a().onPressDo{nivelActual.cambiarDeNivel()}
	}

	method ganar() {
		if (self.cajasEnSuLugar()) {
			game.say(karoshi,"Siguiente nivel es: "+configNivel.siguienteNivel())
		}
		return null
	}

	method cajasEnSuLugar() = metas.listaMetas().all{ unaMeta => unaMeta.cajaEnSitio() }

	method decirGane() = game.say(karoshi, unTexto) // metodo debugg

}
