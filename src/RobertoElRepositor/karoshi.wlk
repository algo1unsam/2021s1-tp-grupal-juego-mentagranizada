import wollok.game.*
import objetos.*
//Andi voto Ruben
//Sabri voto Pepe
//Nico voto Kniga
//LocoLope
object karoshi {
	const posicionInicial = game.at(2,3)
	var property position = posicionInicial
	var property ultimaDireccion = posicionInicial
 	var property ultimoImput = down
 	
 	method image() = "roberto/character_" + ultimoImput + ".png"

 	method posicionAdelante(direccion) {
 		var aux
 		if(direccion == down){aux=self.position().down(1)}
 		else if (direccion == up){aux=self.position().up(1)}
 		else if (direccion == left){aux=self.position().left(1)}
 		else{aux=self.position().right(1)}
 		
 		return aux
 	}
 	
 	 method posicionAdelante2(direccion) {
 		var aux
 		if(direccion == down){aux=self.position().down(2)}
 		else if (direccion == up){aux=self.position().up(2)}
 		else if (direccion == left){aux=self.position().left(2)}
 		else{aux=self.position().right(2)}
 		
 		return aux
 	
 	}
 	
	

	method revisar(direccion, haciaDondeMira){
		ultimoImput = haciaDondeMira
		ultimaDireccion = direccion
		if (colisionables.listaColisionables().any{unObjeto=> unObjeto.position() == direccion}){
			//game.say(self,"no puedo avanzar, hay un objeto")
		}
		else{
			self.mover(direccion)
		}
	}
	
	method mover(nuevaDireccion){
		
		self.position(nuevaDireccion)

	}
	//LO HAGO CON IF DEPSUES VEMOS COMO ARREGLARLO.
	method accion(){
		cajas.listaCajas().forEach{unaCaja => 
			if(unaCaja.position() == self.posicionAdelante(ultimoImput)){
				unaCaja.revisar(self.posicionAdelante2(ultimoImput))
			}

	}
			

		
			
	}
	
		
	
}

//objetos de prueba
//class Direccion{
//	method sprite()="character_" + karoshi.ultimaDireccion() + ".png"
//}
object right{}
object left{}
object up{}
object down{}