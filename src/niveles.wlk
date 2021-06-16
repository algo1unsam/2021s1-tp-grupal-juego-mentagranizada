import wollok.game.*
import config.*
import objetos.*
import pepe.*
import menuYExtras.*
import pistas.*

class Nivel {
	const property pista
	const property siguienteNivel

	method ejecutar() {
		self.cargarObjetos()
		configNivel.nivelActual(self)
		configNivel.siguienteNivel(self.siguienteNivel())
	}

	method cargarObjetos() {
	}

}

object configNivel {

	var property nivelActual = menu
	var property siguienteNivel = menu

	method cambiarDeNivel() {
		todosLosExtras.limpiar()
		todosLosElementos.eliminar()
		siguienteNivel.ejecutar()
		colisionables.actualizar()
		return null
	}

	method reiniciar() {
		sonido.reproducir("nivel_reinicio")
		cajas.reiniciarPosicion()
		pepe.reiniciarPosicion()
		config.sumarReintento()
		if (config.estaDesesperado()){
			game.say(cartel,"psss con la J ves una pista")
			config.reintentos(0)
		}
	}

}

object tutorial inherits Nivel(siguienteNivel = nivel1) {

	override method cargarObjetos() {
		instrucciones.ejecutar()
		paredes.crearBordes(9, 3, 1, 1)
		cajas.crear(5, 2)
		metas.crear(8, 2)
		todosLosElementos.cargar()
		game.addVisual(pepe)
		pepe.iniciarEn(2, 2)
	}

}

object nivel1 inherits Nivel(siguienteNivel = nivel2, pista = nivel1_pista) {

	override method cargarObjetos() {
		paredes.crearBordes(7, 5, 2, 2)
		paredes.crear(3, 4)
		paredes.crear(7, 4)
		cajas.crear(4, 4)
		cajas.crear(5, 4)
		cajas.crear(6, 4)
		cajas.crear(5, 5)
		metas.crear(3, 3)
		metas.crear(3, 5)
		metas.crear(7, 3)
		metas.crear(7, 5)
		pepe.iniciarEn(4, 5)
		todosLosElementos.cargar()
	}

}

object nivel2 inherits Nivel(siguienteNivel = nivel3, pista = nivel2_pista) {

	override method cargarObjetos() {
		paredes.crearBordes(7, 7, 2, 1)
		paredes.crear(5, 2)
		paredes.crear(5, 5)
		cajas.crear(6, 3)
		cajas.crear(6, 4)
		cajas.crear(4, 3)
		cajas.crear(4, 4)
		metas.crear(4, 2)
		metas.crear(6, 2)
		metas.crear(6, 5)
		metas.crear(4, 5)
		pepe.iniciarEn(5, 6)
		todosLosElementos.cargar()
	}

}

object nivel3 inherits Nivel(siguienteNivel = nivel4, pista = nivel3_pista) {

	override method cargarObjetos() {
		paredes.crearBordes(9, 7, 1, 1)
		paredes.crear(4, 3)
		paredes.crear(4, 4)
		paredes.crear(3, 4)
		paredes.crear(7, 4)
		paredes.crear(6, 4)
		paredes.crear(6, 5)
		cajas.crear(4, 2)
		cajas.crear(7, 2)
		cajas.crear(7, 3)
		cajas.crear(3, 5)
		cajas.crear(3, 6)
		cajas.crear(6, 6)
		metas.crear(2, 2)
		metas.crear(3, 2)
		metas.crear(2, 3)
		metas.crear(8, 6)
		metas.crear(7, 6)
		metas.crear(8, 5)
		pepe.iniciarEn(5, 3)
		todosLosElementos.cargar()
	}

}

object nivel4 inherits Nivel(siguienteNivel = fin, pista = nivel4_pista) {

	override method cargarObjetos() {
		paredes.crearBordes(7, 8, 2, 0)
		paredes.crear(5, 1)
		paredes.crear(5, 5)
		cajas.crear(4, 2)
		cajas.crear(4, 4)
		cajas.crear(5, 2)
		cajas.crear(5, 3)
		cajas.crear(5, 4)
		cajas.crear(5, 6)
		cajas.crear(6, 2)
		cajas.crear(6, 4)	
			
		metas.crear(3, 5)
		metas.crear(3, 6)
		metas.crear(4, 5)
		metas.crear(4, 6)

		metas.crear(6, 5)
		metas.crear(6, 6)		
		metas.crear(7, 5)
		metas.crear(7, 6)
		pepe.iniciarEn(6, 1)
		todosLosElementos.cargar()
	}

}

object fin inherits Nivel {
	
	override method cargarObjetos() {
		game.schedule(200, {=> final.ejecutar()})
		sonido.reproducir("final_sonido")
		game.schedule(3000, { game.stop()})
	}

}