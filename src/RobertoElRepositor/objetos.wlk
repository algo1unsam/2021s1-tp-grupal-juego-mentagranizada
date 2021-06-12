import wollok.game.*
import config.*

class Pared {
	const property position = game.at(0,0)
	
	method image() = "roberto/wall_tile.png"
}

object paredes{
	//ver si conservamos esto o lo descartamos.

//	const alto = config.alto().min(5)
//	const ancho = config.ancho().min(7)
	const property listaParedes = [new Pared(position = game.at(1,2)),new Pared(position = game.at(5,2))]
	
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
	
}

object cajas{
	const property listaCajas = [new Caja(position = game.at(3,3)),
								new Caja(position = game.at(2,2)),
								new Caja(position = game.at(3,2)),
								new Caja(position = game.at(4,2))]
}
//Esto despues convertir a CLASS y almacenarlos en lista CAJAS
class Caja{
	
	var property position
	
	method image() = "roberto/box_tile.png"
	
	method revisar(direccion){
		if ((cajas.listaCajas().any{unObjeto=> unObjeto.position() == direccion}) or
			(paredes.listaParedes().any{unObjeto=> unObjeto.position() == direccion})){
		}
		else{
			self.mover(direccion)
		}
	}
	
	method mover(unaDireccion){
		 position = unaDireccion
		 config.ganar()
		 return null
	}
	
}


object metas{
	const property listaMetas = [new Meta(position = game.at(1,3)),
								new Meta(position = game.at(5,3)),
								new Meta(position = game.at(1,1)),
								new Meta(position = game.at(5,1))]
}
class Meta{
	var property position
	method cajaEnSitio() = cajas.listaCajas().any{unaCaja => unaCaja.position() == self.position()}
	method image() = "roberto/goal_tile.png"
}

object colisionables {
	const property listaColisionables=[paredes.listaParedes(),cajas.listaCajas()].flatten()
	
}

