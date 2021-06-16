import wollok.game.*
import objetos.*
import niveles.*
import config.*

object pepe {

	var property position
	var posicionInicial
	var property ultimoInput = down
	var property nivelActual = nivel1

	method image() = "Personaje/" + ultimoInput.toString() + ".png"

	method guardarDireccion(unaDireccion) {
		ultimoInput = unaDireccion
		config.moverSiNoColisiona(self, unaDireccion.posicionSiguiente(self))
	}

	method mover(nuevaPosicion) {
		self.position(nuevaPosicion)
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
		return cajas.lista().findOrDefault({ unaCaja => unaCaja.position() == ultimoInput.posicionSiguiente(self) }, vacio)
	}

	method accion() {
		self.hayUnaCajaAdelante().verSiPuedeMoverse(ultimoInput) 
	}
	
	method estaDesesperado() {
		return config.reintentos() > 3
		}
	
	method nivelActual(unNivel) {
		nivelActual = unNivel
	}
	
}
