import wollok.game.*
import config.*
import objetos.*
import karoshi.*


//Este todavia no hace nada.
object configNivel{
	var property nivelActual = tutorial
	var property siguienteNivel = tutorial
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

object tutorial inherits Nivel(image="roberto/floor_tile.png"){
	
	override method cargarObjetos(){

		paredes.crearBordes(3,8)
		cajas.crear(3,1)
		colisionables.listaColisionables().forEach{unCoso => game.addVisual(unCoso)}
		metas.crear(6,1)
		metas.listaMetas().forEach{unaMeta => game.addVisual(unaMeta)}
		karoshi.posicionInicial(1,1)
		game.addVisual(karoshi)
	}
	
	method reiniciar(){
		game.clear() //Limpiar todo
		
		self.cargarObjetos() //carga el fondo, y carga los objetos
	}
	
}

object nivel1 inherits Nivel(image="roberto/floor_tile.png"){
	
	override method cargarObjetos(){

		paredes.crearBordes(5,7)
		paredes.crear(1,2)
		paredes.crear(5,2)
		cajas.crear(3,3)
		cajas.crear(2,2)
		cajas.crear(3,2)
		cajas.crear(4,2)
		colisionables.listaColisionables().forEach{unCoso => game.addVisual(unCoso)}
		metas.crear(1,3)
//		metas.crear(5,3)
//		metas.crear(1,1)
//		metas.crear(5,1)
		metas.listaMetas().forEach{unaMeta => game.addVisual(unaMeta)}
		game.addVisual(karoshi)
	}
	
}
