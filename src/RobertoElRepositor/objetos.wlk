import wollok.game.*
import config.*

class Pared {
	const property position = game.at(0,0)
	
	method image() = return "roberto/wall_tile.png"
}

object paredes{
	const alto = config.alto()
	const ancho = config.ancho()
	const property listaParedes = []
	
	//Este metodo crea cada objeto PARED con su respectiva posicion para luego
	//poder usar ADDVISUAL y generar las paredes automaticamente con el alto y ancho dado en config.
	method crearParedes(){
		alto.times({i => listaParedes.add(new Pared(position = game.at(0,i-1)))})
		alto.times({i => listaParedes.add(new Pared(position = game.at(ancho-1,i-1)))})
		
		(ancho-2).times({i => listaParedes.add(new Pared(position = game.at(i,0)))})
		(ancho-2).times({i => listaParedes.add(new Pared(position = game.at(i,alto-1)))})
	}
	
	
}