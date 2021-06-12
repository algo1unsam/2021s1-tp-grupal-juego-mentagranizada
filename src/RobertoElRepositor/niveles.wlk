import wollok.game.*
import config.*
import objetos.*
import karoshi.*

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
		paredes.crearBordes(8, 3)
		cajas.crear(3, 1)
		metas.crear(6, 1)
		todosLosElementos.agregarATablero()
		karoshi.inicializarEn(1,1)
	}

}

object nivel1 inherits Nivel/*(image = "roberto/floor_tile.png")*/ {

	override method cargarObjetos() {
		paredes.crearBordes(7, 5)
		paredes.crear(1, 2)
		paredes.crear(5, 2)
		cajas.crear(3, 3)
		cajas.crear(2, 2)
		cajas.crear(3, 2)
		cajas.crear(4, 2)
		metas.crear(1, 3)
		metas.crear(5,3)
		metas.crear(1,1)
		metas.crear(5,1)
		todosLosElementos.agregarATablero() 
		karoshi.inicializarEn(1,3)
		
	}

}

object nivel2 inherits Nivel/*(image = "roberto/floor_tile.png")*/ {

	override method cargarObjetos() {
		paredes.crearBordes(7,8)
		paredes.crear(3, 2)
		paredes.crear(3, 5)

		
		cajas.crear(2, 3)
		cajas.crear(2, 4)
		cajas.crear(4, 3)
		cajas.crear(4, 4)
		
		metas.crear(2, 2)
		metas.crear(2, 5)
		metas.crear(4, 2)
		metas.crear(4, 5)
		todosLosElementos.agregarATablero()
		karoshi.inicializarEn(1,1)
		
	}

}

object nivel3 inherits Nivel/*(image = "roberto/floor_tile.png")*/ {

	override method cargarObjetos() {
		paredes.crearBordes(9, 7)
		paredes.crear(2, 3)
		paredes.crear(3, 3)
		paredes.crear(3, 2)
		paredes.crear(5, 3)
		paredes.crear(5, 4)
		paredes.crear(6, 3)
		
		cajas.crear(3, 1)
		cajas.crear(2, 4)
		cajas.crear(2, 5)
		cajas.crear(5, 5)
		cajas.crear(6, 1)
		cajas.crear(6, 2)
		
		metas.crear(1, 1)
		metas.crear(1, 2)
		metas.crear(2, 1)
		metas.crear(6, 5)
		metas.crear(7, 4)
		metas.crear(7, 5)
		todosLosElementos.agregarATablero()
		karoshi.inicializarEn(4,2)
		
	}

}


