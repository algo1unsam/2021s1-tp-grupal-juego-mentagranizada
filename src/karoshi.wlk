import wollok.game.*
import objetos.*
import niveles.*
import config.*

object karoshi {

	var property position
	var posicionInicial
	var property ultimoInput = "down"

	method image() = "Personaje/" + ultimoInput + ".png"

	method revisar(nuevaPosicion, direccion) {
		ultimoInput = direccion
		if (colisionables.lista().any{ unObjeto => unObjeto.position() == nuevaPosicion }) {
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
        ultimoInput = "down"
    }
    
	method moverA(x,y){
        position = game.at(x, y)
        posicionInicial = game.at(x, y)		
        ultimoInput = "down"
	}
	
    method inicializarEn(x,y){
        position = game.at(x, y)
        posicionInicial = game.at(x, y)
        game.addVisual(self)
    }

	method accion() {
		cajas.lista().forEach{ unaCaja =>
			if (unaCaja.position() == self.posicionAdelante(ultimoInput)) {
				unaCaja.revisar(self.posicionAdelante2(ultimoInput))
			}
		}
	}

	// LO QUE HACE ES VER QUE HAY HACIA DONDE ESTA MIRANDO
	method posicionAdelante(direccion) {
		if (direccion == "down") {
			return self.position().down(1)
		} else if (direccion == "up") {
			return self.position().up(1)
		} else if (direccion == "left") {
			return self.position().left(1)
		} else {
			return self.position().right(1)
		}
	}

	method posicionAdelante2(direccion) {
		if (direccion == "down") {
			return self.position().down(2)
		} else if (direccion == "up") {
			return self.position().up(2)
		} else if (direccion == "left") {
			return self.position().left(2)
		} else {
			return self.position().right(2)
		}
	}
	
}
