import wollok.game.*
import config.*
import objetos.*
import karoshi.*



object nivelActual{
	var property siguienteNivel = menu
	method cambiarDeNivel(){
		game.clear()
		siguienteNivel.ejecutar()
	}
}

class Nivel{
	const property image
	const property position=game.origin()
	
	method ejecutar(){
		game.addVisual(self)
		self.cargarObjetos()
	}
	method cargarObjetos(){}

}

object menu inherits Nivel(image="roberto/MAIN.png"){
		
}

object nivel1 inherits Nivel(image="roberto/floor_tile.png"){
	
	override method cargarObjetos(){

		paredes.crearBordes(5,7)
		colisionables.listaColisionables().forEach{unCoso => game.addVisual(unCoso)}
		metas.listaMetas().forEach{unaMeta => game.addVisual(unaMeta)}
		game.addVisual(karoshi)
	}
	
}
