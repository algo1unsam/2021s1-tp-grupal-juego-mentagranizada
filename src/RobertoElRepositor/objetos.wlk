import wollok.game.*
import config.*

class Pared {
	const property position
	
	method image() = "roberto/wall_tile.png"
}

object paredes{
	//ver si conservamos esto o lo descartamos.

	const property listaParedes = []
	
	//Este metodo crea cada objeto PARED con su respectiva posicion para luego
	//poder usar ADDVISUAL y generar las paredes automaticamente con el alto y ancho dado en config.
	method crearBordes(alto,ancho){
		//columnas
		alto.times({i => listaParedes.add(new Pared(position = game.at(0,i-1)))})
		alto.times({i => listaParedes.add(new Pared(position = game.at(ancho-1,i-1)))})
		//filas
		(ancho-2).times({i => listaParedes.add(new Pared(position = game.at(i,0)))})
		(ancho-2).times({i => listaParedes.add(new Pared(position = game.at(i,alto-1)))})
	}
	method crear(x,y){
		listaParedes.add(new Pared(position = game.at(x,y)))
	}
}

object cajas{
	const property listaCajas = []
	method crear(x,y){
		listaCajas.add(new Caja(position = game.at(x,y)))
	}
}
//Esto despues convertir a CLASS y almacenarlos en lista CAJAS
class Caja{
	
	var property position

	method image() = "roberto/box_tile.png"

	method revisar(direccion) {
		if (colisionables.listaColisionables().any{ unObjeto => unObjeto.position() == direccion }) {
		} else {
			self.mover(direccion)
		}
	}

	method mover(unaDireccion) {
		position = unaDireccion
		config.ganar()
		return null
	}
	
}


object metas{
	const property listaMetas = []

	method crear(x, y) {
		listaMetas.add(new Meta(position = game.at(x, y)))
	}
}
class Meta{
	var property position
	method image() = "roberto/goal_tile.png"
	method cajaEnSitio() = cajas.listaCajas().any{unaCaja => unaCaja.position() == self.position()}

}

object colisionables {
	const property listaColisionables=[paredes.listaParedes(),cajas.listaCajas()].flatten()
	
}

