Cuando este terminado, agregaremos aqui la descripcion del juego (o cuando ya haya algo que poner) y patchnotes si agregamos cosas.
mientras vamos a usarlo como de guia para saber que ir haciendo.

-HECHO-
WASD -> Movimiento.
-preguntar si a la derecha hay un objeto con colision y si no lo hay, moverse 1 a la derecha
-guardar en el atrivuto "estamirandohacia" -> derecha
-HECHO-

-HECHO-
spaceBar / accion
-preguntar con la direccion de estamirnadohacia (derecha) si hay una CAJA y si a la estamirandohacia(derecha) de la CAJA, hay un espacio vacio.
-si no lo hay, mover la caja una posicion a la derecha
-si lo hay, hacer sonido de error. o mensaje puteandote.
-HECHO-

-HECHO-
como ganar: dejar las cajas en sus lugares.
-preguntando si en el lugar, hay una caja arriba
-method gane() = listaCajas.all{unaCaja-> unaCaja.position() == lugarDestinado.position()}
-HECHO-

![Imagen Juego wollok](https://user-images.githubusercontent.com/48897321/121740479-85679380-cad3-11eb-9fb3-91bc7a8ec7e1.png)

FALTA: 
BOTON DE REINICIO.
Si se traba el juego, se puede reiniciar presionando R
-todos los objetos tienen que tener una posicion y una posicion incial
-la R, cambia la posicion de todos los objetos a la inicial.

PASAR DE NIVEL.
cada nivel tendria una lista de objetos a crear con sus posiciones.
-Al comensar el juego juego.wpgm tiene que ejecutar "Inicio"
-Al comenzar se tiene que ejecutar dle archivos niveles el metodo nivel1.empezarNivel()
-Al finalizar el nivel tiene que haber alguna musiquita y ejecutar el metodo nivel2.empezarNivel() y asi hastsa el nivel que lleguemos a hacer.

COSAS PARA MEJORAR (a nivel codigo)
Verificar la lista de objetos que tiene cada nivel, agruparlos todos en una lista que sea "objetosConColision" y hacer un flatten de las cajas y paredes.
Ver como arreglar algunos metodos que quizas tienen muchos IFs.

COSAS PARA MEJORAR VISUALMENTE
-Armar el inicio
-Poner un puntaje o algo que rellene arriba o ver de que tamaño lo hacemos
-No se me ocurre mas nada.
