import wollok.game.*
import karoshi.*
import objetos.*
import niveles.*
import menuYExtras.*

object config {

	const tiempo = 400
	const property alto = 9
	const property ancho = 11

	method configurarTeclas() {
		keyboard.right().onPressDo{ karoshi.revisar(karoshi.position().right(1), "right")}
		keyboard.left().onPressDo{ karoshi.revisar(karoshi.position().left(1), "left")}
		keyboard.up().onPressDo{ karoshi.revisar(karoshi.position().up(1), "up")}
		keyboard.down().onPressDo{ karoshi.revisar(karoshi.position().down(1), "down")}
		keyboard.space().onPressDo{ karoshi.accion()}
		keyboard.r().onPressDo{ configNivel.reiniciar()}
		keyboard.enter().onPressDo{ menu.empezarJuego()}
	}

	method ganar() {
		if (metas.cajasEnSuLugar()) {
			game.schedule(tiempo, {=> configNivel.cambiarDeNivel()})
		}
		return null
	}

	method cajasEnSuLugar() = metas.lista().all{ unaMeta => unaMeta.cajaEnSitio() }

}

