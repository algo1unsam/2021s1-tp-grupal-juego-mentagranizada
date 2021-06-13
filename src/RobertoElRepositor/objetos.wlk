import wollok.game.*
import config.*
const pared = "roberto/wall_tile.png"
const caja = "roberto/box_tile.png"
const meta = "roberto/goal_tile.png"

class Elementos{
	var property position
	//method image() = self
	
}

class Pared inherits Elementos{
	method image() = pared
}

class Meta inherits Elementos{

	method image() = meta

	method cajaEnSitio() = cajas.lista().any{ unaCaja => unaCaja.position() == self.position() }
	
}

class Caja inherits Elementos{
//	var property position
	const posicionInicial

	method image() = caja

	method revisar(direccion) {
		if (colisionables.lista().any{ unObjeto => unObjeto.position() == direccion }) {
		} else {
			self.mover(direccion)
		}
	}

	method mover(unaDireccion) {
		position = unaDireccion
		config.ganar()
		return null
	}
	
	method reiniciarPosicion(){
		position = posicionInicial
	}

}

//contenedor
object paredes {

	// ver si conservamos esto o lo descartamos.
	const lista = []
	
	method lista() = lista

	// Este metodo crea cada objeto PARED con su respectiva posicion para luego
	// poder usar ADDVISUAL y generar las paredes automaticamente con el alto y ancho dado en config.
	method crearBordes(ancho,alto,origenX,origenY) {
		// columnas
		alto.times({ i => lista.add(new Pared(position = game.at(origenX, i + origenY - 1)))})
		alto.times({ i => lista.add(new Pared(position = game.at(ancho + origenX - 1, i + origenY - 1)))})
		// filas
		(ancho - 2).times({ i => lista.add(new Pared(position = game.at(i+origenX, origenY)))})
		(ancho - 2).times({ i => lista.add(new Pared(position = game.at(i+origenX, alto + origenY - 1)))})
	}

	method crear(x, y) {
        lista.add(new Pared(position = game.at(x, y)))
    }
    
    method cargar(){
		lista.forEach{unElemento => game.addVisual(unElemento)}
	}
	
	method eliminar(){
		lista.forEach{unElemento => unElemento.position(game.at(1,8))}
		lista.forEach{unElemento => lista.remove(unElemento)}
		//lista.forEach{unElemento => game.removeVisual(unElemento)}
	}
}

object cajas {

	const property lista = []

	method crear(x, y) {
        lista.add(new Caja(position = game.at(x, y),posicionInicial = game.at(x, y)))
    }
    
    method cargar(){
		lista.forEach{unElemento => game.addVisual(unElemento)}
	}
	
	method eliminar(){
		lista.forEach{unElemento => unElemento.position(game.at(1,8))}
		lista.forEach{unElemento => lista.remove(unElemento)}
	}

}

//Esto despues convertir a CLASS y almacenarlos en lista CAJAS


object metas {

	const property lista = []

	method crear(x, y) {
        lista.add(new Meta(position = game.at(x, y)))
    }
    
    method cargar(){
		lista.forEach{unElemento => game.addVisual(unElemento)}
	}
	
	method eliminar(){
		lista.forEach{unElemento => unElemento.position(game.at(1,8))}
		lista.forEach{unElemento => lista.remove(unElemento)}
	}
}


object colisionables {

	var lista = []
	method lista() = lista
	method actualizar() {
		lista = [paredes.lista(), cajas.lista()].flatten()
	}
	

}