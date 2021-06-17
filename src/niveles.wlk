import wollok.game.*
import config.*
import objetos.*
import pepe.*
import extras.*

class Nivel {

	const property pista
	var property siguienteNivel
	var property nivelActual = menu
	const property listaCajas = []
	const property listaMetas = []
	const property listaParedes = []
	
	//Guarda el nivel actual en config, guarda su siguiente nivel y carga los objetos
	method ejecutar() {
		config.nivelActual(self)
		self.siguienteNivel(siguienteNivel)
		self.cargarTodo()
		rata.mostrar()
	}

	//Carga los elementos del nivel
	method cargarTodo() {
	}
	
	//Pregunta si todas las cajas estan en las metas y si es asi avanza al siguiente nivel
	method ganar() {
		if (self.todasLasCajasEnSuLugar()) {
			game.schedule(200, {=> sonido.reproducir("nivel_ganar")})
			game.schedule(config.tiempo(), {=> self.avanzarA(siguienteNivel)})
		}
	}
	//Elimina los objetos del nivel actual y ejecuta el siguiente
	method avanzarA(unNivel) {
		self.eliminarElementos()
		rata.ocultar()
		siguienteNivel.ejecutar()
	}
	//Reinicia la posicion de Pepe y las cajas, y si esta desesperado la rata lo ayuda
	method reiniciarNivel() {
		sonido.reproducir("nivel_reinicio")
		self.reiniciarPosicion()
		pepe.reiniciarPosicion()
		pepe.sumarReintento()
		if (pepe.estaDesesperado()) {
			game.say(rata, "Pssst con la J ves una pista")
			pepe.reintentos(0)
		}
	}
	//Muestra la pista del nivel actual al presionar J
	method mostrarSolucion() {
		game.addVisual(self.pista())
		game.schedule(3000, { game.removeVisual(self.pista())})
	}

// ****CREACION DE ELEMENTOS*****
	// Este metodo crea cada objeto PARED con su respectiva posicion para luego poder 
	//usar ADDVISUAL y generar las paredes automaticamente con el alto y ancho dado en config.
	method crearBordes(ancho, alto, origenX, origenY) {
		// columnas
		alto.times({ i => listaParedes.add(new Pared(position = game.at(origenX, i + origenY - 1)))})
		alto.times({ i => listaParedes.add(new Pared(position = game.at(ancho + origenX - 1, i + origenY - 1)))})
			// filas
		(ancho - 2).times({ i => listaParedes.add(new Pared(position = game.at(i + origenX, origenY)))})
		(ancho - 2).times({ i => listaParedes.add(new Pared(position = game.at(i + origenX, alto + origenY - 1)))})
	}
	//Crea una pared y la agrega a la lista
	method crearPared(x, y) {
		listaParedes.add(new Pared(position = game.at(x, y)))
	}

//METAS
	//Crea una meta y la agrega a la lista
	method crearMeta(x, y) {
		listaMetas.add(new Meta(position = game.at(x, y)))
	}
	//Pregunta si en cada meta hay una caja
	method todasLasCajasEnSuLugar() {
		return listaMetas.all{ unaMeta => unaMeta.cajaEnMeta() }
	}

//CAJAS
	//Crea una caja y la agrega a la lista
	method crearCaja(x, y) {
		listaCajas.add(new Caja(position = game.at(x, y), posicionInicial = game.at(x, y)))
	}
	//Reinicia la posicion de las cajas, viene del metodo reiniciarNivel
	method reiniciarPosicion() {
		listaCajas.forEach({ unaCaja => unaCaja.reiniciarPosicion()})
	}

//ELEMENTOS DEL NIVEL (lista usada por pepe para interactuar, y para la carga y eliminacion en cada nivel)
	method elementosDelNivel() = [ listaParedes, listaCajas, listaMetas ].flatten()

//CARGA Y ELIMINACION DE ELEMENTOS POR NIVEL
	//Carga el visual de todos los elementos del nivel
	method cargarElementos() {
		self.elementosDelNivel().forEach{ unElemento => game.addVisual(unElemento)}
	}
	//Elimina el visual y limpia la lista de todos los elementos del nivel
	method eliminarElementos() {
		self.elementosDelNivel().forEach{ unElemento => game.removeVisual(unElemento)}
		listaParedes.clear()
		listaMetas.clear()
		listaCajas.clear()
	}

}

object menu inherits Nivel(siguienteNivel = tutorial) {

	const musica = sonido.sonido("menu_musica")

	method image() = "menu.png"

	method position() = game.origin()

	override method ejecutar() {
		musica.volume(config.volumen())
		game.schedule(1, {=> musica.play()})
		musica.shouldLoop(true)
		game.addVisual(self)
	}

	method empezarJuego() {
		if (config.nivelActual() == self) {
			game.removeVisual(self)
			siguienteNivel.ejecutar()
			musica.stop()
		}
	}

	override method reiniciarNivel() {
	}

	override method mostrarSolucion() {
	}

}

object tutorial inherits Nivel(siguienteNivel = nivel1, pista = tutorial_pista) {

	override method cargarTodo() {
		instrucciones.mostrar()
		self.crearBordes(9, 3, 1, 1)
		self.crearCaja(5, 2)
		self.crearMeta(8, 2)
		self.cargarElementos()
		game.addVisual(pepe)
		pepe.iniciarEn(2, 2)
	}

	override method avanzarA(unNivel) {
		super(unNivel)
		instrucciones.ocultar()
	}

}

object nivel1 inherits Nivel(siguienteNivel = nivel2, pista = nivel1_pista) {

	override method cargarTodo() {
		self.crearBordes(7, 5, 2, 2)
		self.crearPared(3, 4)
		self.crearPared(7, 4)
		self.crearCaja(4, 4)
		self.crearCaja(5, 4)
		self.crearCaja(6, 4)
		self.crearCaja(5, 5)
		self.crearMeta(3, 3)
		self.crearMeta(3, 5)
		self.crearMeta(7, 3)
		self.crearMeta(7, 5)
		pepe.iniciarEn(4, 5)
		self.cargarElementos()
	}

}

object nivel2 inherits Nivel(siguienteNivel = nivel3, pista = nivel2_pista) {

	override method cargarTodo() {
		self.crearBordes(7, 7, 2, 1)
		self.crearPared(5, 2)
		self.crearPared(5, 5)
		self.crearCaja(6, 3)
		self.crearCaja(6, 4)
		self.crearCaja(4, 3)
		self.crearCaja(4, 4)
		self.crearMeta(4, 2)
		self.crearMeta(6, 2)
		self.crearMeta(6, 5)
		self.crearMeta(4, 5)
		pepe.iniciarEn(5, 6)
		self.cargarElementos()
	}

}

object nivel3 inherits Nivel(siguienteNivel = nivel4, pista = nivel3_pista) {

	override method cargarTodo() {
		self.crearBordes(9, 7, 1, 1)
		self.crearPared(4, 3)
		self.crearPared(4, 4)
		self.crearPared(3, 4)
		self.crearPared(7, 4)
		self.crearPared(6, 4)
		self.crearPared(6, 5)
		self.crearCaja(4, 2)
		self.crearCaja(7, 2)
		self.crearCaja(7, 3)
		self.crearCaja(3, 5)
		self.crearCaja(3, 6)
		self.crearCaja(6, 6)
		self.crearMeta(2, 2)
		self.crearMeta(3, 2)
		self.crearMeta(2, 3)
		self.crearMeta(8, 6)
		self.crearMeta(7, 6)
		self.crearMeta(8, 5)
		pepe.iniciarEn(5, 3)
		self.cargarElementos()
	}

}

object nivel4 inherits Nivel(siguienteNivel = fin, pista = nivel4_pista) {

	override method cargarTodo() {
		self.crearBordes(7, 8, 2, 0)
		self.crearPared(5, 1)
		self.crearPared(5, 5)
		self.crearCaja(4, 2)
		self.crearCaja(4, 4)
		self.crearCaja(5, 2)
		self.crearCaja(5, 3)
		self.crearCaja(5, 4)
		self.crearCaja(5, 6)
		self.crearCaja(6, 2)
		self.crearCaja(6, 4)
		self.crearMeta(3, 5)
		self.crearMeta(3, 6)
		self.crearMeta(4, 5)
		self.crearMeta(4, 6)
		self.crearMeta(6, 5)
		self.crearMeta(6, 6)
		self.crearMeta(7, 5)
		self.crearMeta(7, 6)
		pepe.iniciarEn(6, 1)
		self.cargarElementos()
	}

	override method ganar() {
		if (self.todasLasCajasEnSuLugar()) {
			game.schedule(config.tiempo(), {=> self.avanzarA(self.siguienteNivel())})
		}
	}

}

object fin inherits Nivel(siguienteNivel = null, pista = null) {

	const position = game.origin()

	method image() = "fin.png"

	method position() = position

	override method ejecutar() {
		game.addVisual(self)
		sonido.reproducir("final_sonido")
		game.schedule(3100, { game.stop()})
	}
	
	override method reiniciarNivel() {
		
	}

}

