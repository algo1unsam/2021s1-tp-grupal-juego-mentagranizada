import wollok.game.*
import config.*
import objetos.*
import karoshi.*
import menuYExtras.*

class Nivel {

    method ejecutar() {
        self.cargarObjetos()
    }

    method cargarObjetos() {}

    method reiniciar() {
        cajas.listaCajas().forEach({unaCaja => unaCaja.reiniciarPosicion()})
        karoshi.reiniciarPosicion()
    }

}

//Este todavia no hace nada.
object configNivel {

	var property nivelActual = tutorial
	var property siguienteNivel = tutorial

	method cambiarDeNivel() {
		game.clear()
		siguienteNivel.ejecutar()
	}

}



object menu {
	method position() = game.origin()
	method image() = "roberto/MAIN.png"
}

object tutorial inherits Nivel/*(image = "roberto/floor_tile.png")*/ {

	override method cargarObjetos() {
		paredes.crearBordes(9, 3, 1, 1)
		game.addVisual(instrucciones)
		cajas.crear(5, 2)
		metas.crear(8, 2)
		todosLosElementos.agregarATablero()
		karoshi.inicializarEn(2,2)
	}

}

object nivel1 inherits Nivel/*(image = "roberto/floor_tile.png")*/ {

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
		todosLosElementos.agregarATablero() 
		karoshi.inicializarEn(4,5)
		
	}

}

object nivel2 inherits Nivel/*(image = "roberto/floor_tile.png")*/ {

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
		todosLosElementos.agregarATablero()
		karoshi.inicializarEn(5,6)
		
	}

}

object nivel3 inherits Nivel/*(image = "roberto/floor_tile.png")*/ {

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
		todosLosElementos.agregarATablero()
		karoshi.inicializarEn(5,3)
		
	}

}


