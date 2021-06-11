import wollok.game.*
import karoshi.*
import objetos.*

object config {
	const property alto = 6
	const property ancho = 7
	
	method configurarTeclas(){
		keyboard.right().onPressDo{karoshi.revisar(karoshi.position().right(1), right)}
		keyboard.left().onPressDo{karoshi.revisar(karoshi.position().left(1), left)}
		keyboard.up().onPressDo{karoshi.revisar(karoshi.position().up(1), up)}
		keyboard.down().onPressDo{karoshi.revisar(karoshi.position().down(1), down)}
		keyboard.space().onPressDo{karoshi.accion()}
	
	}
		
	
}
