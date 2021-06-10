import wollok.game.*
import config.*

class Pared {
	const property position = game.at(0,0)
	
	method image() = "roberto/wall_tile.png"
}

object paredes{
	const alto = config.alto()
	const ancho = config.ancho()
	const property listaParedes = [new Pared(position = game.at(1,2)),new Pared(position = game.at(5,2))]
	
	//Este metodo crea cada objeto PARED con su respectiva posicion para luego
	//poder usar ADDVISUAL y generar las paredes automaticamente con el alto y ancho dado en config.
	method crearParedes(){
		//columnas
		alto.times({i => listaParedes.add(new Pared(position = game.at(0,i-1)))})
		alto.times({i => listaParedes.add(new Pared(position = game.at(ancho-1,i-1)))})
		//filas
		(ancho-2).times({i => listaParedes.add(new Pared(position = game.at(i,0)))})
		(ancho-2).times({i => listaParedes.add(new Pared(position = game.at(i,alto-1)))})
	}
	
	
}

object cajas{
	const property listaCajas = [caja]
}
object caja{
	method image() = "roberto/box_tile.png"
	method position() = game.at(3,3)
	
	
}

object metas{
	const property listaMetas = [meta]
}
object meta{
	method image() = "roberto/goal_tile.png"
	method position() = game.at(1,3)
}

object oC {
	const property listaOc=[paredes.listaParedes()]+[cajas.listaCajas()]
	
}

