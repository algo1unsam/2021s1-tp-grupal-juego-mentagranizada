import wollok.game.*
import karoshi.*

object config {
	const property alto = 5
	const property ancho = 5
	
	method configurarTeclas(){
		keyboard.right().onPressDo{karoshi.revisar(karoshi.position().right(1))}
	}
		
	
}
