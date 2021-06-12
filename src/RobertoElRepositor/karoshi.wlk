import wollok.game.*
import objetos.*

//**Definir nombre**
object karoshi {

	var property position
	var posicionInicial
	var property ultimoInput = down

	method image() = "roberto/character_" + ultimoInput + ".png"

	method revisar(nuevaPosicion, direccion) {
		ultimoInput = direccion
		if (colisionables.listaColisionables().any{ unObjeto => unObjeto.position() == nuevaPosicion }) {
		// Si hay algo con lo que colisiona, no hace nada.
		} else {
			self.mover(nuevaPosicion)
		}
	}

	method mover(nuevaPosicion) {
		self.position(nuevaPosicion)
	}

	method reiniciarPosicion(){
        position = posicionInicial
        ultimoInput = down
    }

    method inicializarEn(x,y){
        position = game.at(x, y)
        posicionInicial = game.at(x, y)
        game.addVisual(karoshi)
    }
	// LO HAGO CON IF DEPSUES VEMOS COMO ARREGLARLO.
	method accion() {
		cajas.listaCajas().forEach{ unaCaja =>
			if (unaCaja.position() == self.posicionAdelante(ultimoInput)) {
				unaCaja.revisar(self.posicionAdelante2(ultimoInput))
			}
		}
	}

	// REVISAR PARA MEJORAR ESTE METOD0
	// LO QUE HACE ES VER QUE HAY HACIA DONDE ESTA MIRANDO
	method posicionAdelante(direccion) {
		if (direccion == down) {
			return self.position().down(1)
		} else if (direccion == up) {
			return self.position().up(1)
		} else if (direccion == left) {
			return self.position().left(1)
		} else {
			return self.position().right(1)
		}
	// Es esto o crear un AUX y retornar un aux
	}

	method posicionAdelante2(direccion) {
		if (direccion == down) {
			return self.position().down(2)
		} else if (direccion == up) {
			return self.position().up(2)
		} else if (direccion == left) {
			return self.position().left(2)
		} else {
			return self.position().right(2)
		}
	}

}
//Solo estan de prueba
object right {

}

object left {

}

object up {

}

object down {

}

