import wollok.game.*
import config.*
import objetos.*
import karoshi.*

object nivelActual{
	var property nivelActual = menu
	method cambiarDeNivel(){
		nivelActual.ejecutar()
	}
}

object menu {
	method ejecutar(){
		game.boardGround("roberto/MAIN.png")
			
	}
	
}

object nivel1 {
	
	method ejecutar(){
		game.boardGround("roberto/floor_tile.png")
		paredes.crearParedes()
		paredes.listaParedes().forEach{unaPared => game.addVisual(unaPared)}
		cajas.listaCajas().forEach{unaCaja => game.addVisual(unaCaja)}
		metas.listaMetas().forEach{unaMeta => game.addVisual(unaMeta)}
		game.addVisual(karoshi)
	}
	
}
