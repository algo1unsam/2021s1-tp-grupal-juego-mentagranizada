import wollok.game.*
import objetos.*
import niveles.*
import config.*
import menuYExtras.*

object pepe {

	var property position = game.origin()
	var posicionInicial
	var property ultimoInput = down
	var property nivelActual = menu

	method image() = "Personaje/" + ultimoInput.toString() + ".png"

	method guardarDireccion(unaDireccion) {
		ultimoInput = unaDireccion
		self.puedeMoverse(unaDireccion)
	}
	
	method puedeMoverse(unaDireccion) {
		if (not config.revisarColision(self, unaDireccion.posicionSiguiente(self))){
			self.mover(unaDireccion)
		}
	}

	method mover(unaDireccion) {
		self.position(unaDireccion.posicionSiguiente(self))
	}

	method reiniciarPosicion(){
        position = posicionInicial
        ultimoInput = down
    }
    
	method iniciarEn(x,y){
        position = game.at(x, y)
        posicionInicial = game.at(x, y)		
        ultimoInput = down
	}

	method hayUnaCajaAdelante() {
		return cajas.lista().filter({ unaCaja => unaCaja.position() == ultimoInput.posicionSiguiente(self) })
	}

	method accion() {
		self.hayUnaCajaAdelante().forEach({ unaCaja => unaCaja.puedeMoverse(ultimoInput) })
	}
	
	method estaDesesperado() {
		return config.reintentos() > 3
		}
	
	method nivelActual(unNivel) {
		nivelActual = unNivel
	}
	
}
