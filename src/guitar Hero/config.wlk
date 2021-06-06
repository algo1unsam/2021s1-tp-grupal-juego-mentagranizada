import wollok.game.*
import botones.*
import placeHolderName.*
import notas.*

object config {
	
	method keyConfig() {
		keyboard.a().onPressDo({botonA.esPresionado()})
		keyboard.s().onPressDo({botonS.esPresionado()})
		keyboard.d().onPressDo({botonD.esPresionado()})
		keyboard.f().onPressDo({botonF.esPresionado()})
	}
	
//	method bajarNotas(){
//		game.onTick(300, "PRUEBA2", { nota.bajar() }) 
//	}
}
