import wollok.game.*
import botones.*


//CLASES DE NOTAS
class NotaVerde{
	var property position = game.at(2,22)
	method image() {
		return if (position.y()<1) "vacio.png" else "botonverdeon.png"
	}
	
	method bajarNota(){
		game.onTick(100,"nota",{position = position.down(1)})
	}
}
class NotaRoja{
	var property position = game.at(5,22)
	method image() {
		return if (position.y()<1) "vacio.png" else "botonrojoon.png"
	}
	
	method bajarNota(){
		game.onTick(100,"nota",{position = position.down(1)})
	}
}
class NotaAmarilla{
	var property position = game.at(8,22)
	method image() {
		return if (position.y()<1) "vacio.png" else "botonamarilloon.png"
	}
	
	method bajarNota(){
		game.onTick(100,"nota",{position = position.down(1)})
	}
}
class NotaAzul{
	var property position = game.at(11,22)
	method image() {
		return if (position.y()<1) "vacio.png" else "botonazulon.png"
	}
	
	method bajarNota(){
		game.onTick(100,"nota",{position = position.down(1)})
	}
}


object listaDeNotas{
	const lista = [nota0,nota1,nota2,nota3]
	
	method sinNombre(){
		lista.forEach{unaNota => unaNota.bajarNota()}
	}
}


object nota0 inherits NotaVerde {
	
}

object nota1 inherits NotaRoja {

}

object nota2 inherits NotaAmarilla {
	
}

object nota3 inherits NotaAzul {
	
}
//object notasVerdes{
//	const phones = new Dictionary()
//	phones.put("tiempo", rolo)
//}
