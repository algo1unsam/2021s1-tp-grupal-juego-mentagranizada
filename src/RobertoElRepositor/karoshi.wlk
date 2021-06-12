import wollok.game.*
import objetos.*

//**Definir nombre**
object karoshi {
	var property position
 	var property ultimoImput = down
 	
 	method image() = "roberto/character_" + ultimoImput + ".png"

	method posicionInicial(x, y) {
		position = game.at(x, y)
	}

	method revisar(nuevaPosicion, direccion) {
		ultimoImput = direccion
		if (colisionables.listaColisionables().any{ unObjeto => unObjeto.position() == nuevaPosicion }) {
		// Si hay algo con lo que colisiona, no hace nada.
		} else {
			self.mover(nuevaPosicion)
		}
	}

	method mover(nuevaPosicion) {
		self.position(nuevaPosicion)
	}
	//LO HAGO CON IF DEPSUES VEMOS COMO ARREGLARLO.
	method accion(){
		cajas.listaCajas().forEach{unaCaja => 
			if(unaCaja.position() == self.posicionAdelante(ultimoImput)){
				unaCaja.revisar(self.posicionAdelante2(ultimoImput))
			}
		}
	}

	//REVISAR PARA MEJORAR ESTE METOD0
	//LO QUE HACE ES VER QUE HAY HACIA DONDE ESTA MIRANDO
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
		//Es esto o crear un AUX y retornar un aux
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

object right{}
object left{}
object up{}
object down{}