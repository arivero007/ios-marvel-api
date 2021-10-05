# MarvelAppIOS

Aplicación para probar la API de Marvel, solicitando un listado de personajes y visualizando su información.

Consta de 2 pantallas: la primera, en la que se visualiza el listado de personajes recuperados desde la API y la segunda, en la que se detalla la información del personaje seleccionado.

En la primera se puede filtrar por nombre y actualizar la lista.

* Librerias (PODS):

  - pod 'JGProgressHUD'

* Librerias (Package Manager):

  - Alamofire

Observaciones:

Para probar diferentes servicios web se ha realizado la llamada para obtener el detalle del personaje en la segunda pantalla, pero ésta habría sido innecesaria ya que en el primer WS obtenía toda la información y podía reutilizarla.
