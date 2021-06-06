import wollok.game.*

object puntos {
	const image = "puntos.png"
	const position = game.at(0,0)
	
	method image()=image
	method position()=position
}

object tablero2 {
	const image = "tablero2.png"
	const position = game.at(0,0)
	
	method image()=image
	method position()=position
}

object gif {
	var image = "frame1.png"
	const position = game.at(0,0)
	
	method image() = image
	
	method cambiarFrame() {
		return if (image == "frame1.png") {
			image = "frame2.png"
		}
		else if (image == "frame2.png"){			
			image = "frame3.png"			
			}
		else if (image == "frame3.png"){
			image = "frame4.png"
		}
		else if (image == "frame4.png"){
			image = "frame5.png"
		}
		else if (image == "frame5.png"){
			image = "frame6.png"
		}
		else {
			image = "frame1.png"
			}
	}
	method position()=position
}
