import wollok.game.*
import config.*
import objetos.*
import pepe.*
import menuYExtras.*

class Nivel {

	const property pista
	var property siguienteNivel
	var property nivelActual = menu

	method ejecutar() {
		pepe.nivelActual(self)
		self.siguienteNivel(siguienteNivel)
		self.cargarObjetos()
	}

	method cargarObjetos() {
	}

	method ganar() {
		if (metas.todasLasCajasEnSuLugar()) {
			game.schedule(200, {=> sonido.reproducir("nivel_ganar")})
			game.schedule(config.tiempo(), {=> self.avanzarA(self.siguienteNivel())})
		}
	}

	method avanzarA(unNivel) {
		todosLosElementos.eliminar(cajas)
		todosLosElementos.eliminar(metas)
		todosLosElementos.eliminar(paredes)
		siguienteNivel.ejecutar()
	}

	method reiniciar() {
		sonido.reproducir("nivel_reinicio")
		cajas.reiniciarPosicion()
		pepe.reiniciarPosicion()
		config.sumarReintento()
		if (pepe.estaDesesperado()) {
			game.say(cartel, "psss con la J ves una pista")
			config.reintentos(0)
		}
	}

	method mostrarSolucion() {
		game.addVisual(self.pista())
		game.schedule(3000, { game.removeVisual(self.pista())})
	}

}

object menu inherits Nivel(siguienteNivel = tutorial) {

	const musica = sonido.sonido("menu_musica")

	method image() = "Extras/" + self.toString() + ".png"

	method position() = game.origin()

	override method ejecutar() {
		musica.volume(config.volumen())
		game.schedule(1, {=> musica.play()})
		musica.shouldLoop(true)
		game.addVisual(cartel)
		game.addVisual(self)
	}

	method empezarJuego() {
		if (pepe.nivelActual() == self) {
			game.removeVisual(self)
			siguienteNivel.ejecutar()
			musica.stop()
		}
	}

	override method reiniciar() {
	}

	override method mostrarSolucion() {
	}

}

object tutorial inherits Nivel(siguienteNivel = nivel1, pista = tutorial_pista) {

	override method cargarObjetos() {
		instrucciones.mostrar()
		paredes.crearBordes(9, 3, 1, 1)
		cajas.crear(5, 2)
		metas.crear(8, 2)
		todosLosElementos.cargar(cajas)
		todosLosElementos.cargar(metas)
		todosLosElementos.cargar(paredes)
		game.addVisual(pepe)
		pepe.iniciarEn(2, 2)
	}

	override method avanzarA(unNivel) {
		super(unNivel)
		instrucciones.ocultar()
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
		todosLosElementos.cargar(cajas)
		todosLosElementos.cargar(metas)
		todosLosElementos.cargar(paredes)
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
		todosLosElementos.cargar(cajas)
		todosLosElementos.cargar(metas)
		todosLosElementos.cargar(paredes)
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
		todosLosElementos.cargar(cajas)
		todosLosElementos.cargar(metas)
		todosLosElementos.cargar(paredes)
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
		todosLosElementos.cargar(cajas)
		todosLosElementos.cargar(metas)
		todosLosElementos.cargar(paredes)
	}

	override method ganar() {
		if (metas.todasLasCajasEnSuLugar()) {
			game.schedule(config.tiempo(), {=> self.avanzarA(self.siguienteNivel())})
		}
	}

}

object fin inherits Nivel(siguienteNivel = null, pista = null) {

	const position = game.origin()

	method image() = "Extras/" + self.toString() + ".png"

	method position() = position

	override method ejecutar() {
		game.schedule(200, {=> game.addVisual(self)})
		sonido.reproducir("final_sonido")
		game.schedule(3200, { game.stop()})
	}

}

