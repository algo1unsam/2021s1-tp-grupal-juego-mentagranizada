import wollok.game.*
import karoshi.*

object config {
	const property alto = 5
	const property ancho = 7
	
	method configurarTeclas(){
		keyboard.right().onPressDo{karoshi.revisar(karoshi.position().right(1), right)}
		keyboard.left().onPressDo{karoshi.revisar(karoshi.position().left(1), left)}
		keyboard.up().onPressDo{karoshi.revisar(karoshi.position().up(1), up)}
		keyboard.down().onPressDo{karoshi.revisar(karoshi.position().down(1), down)}
	}
		
	
}
