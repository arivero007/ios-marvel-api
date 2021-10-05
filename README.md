# MarvelAppIOS

Aplicación para probar la API de Marvel, solicitando un listado de personajes y visualizando su información.

Arquitectura MVVM.

Consta de 2 pantallas: la primera, en la que se visualiza el listado de personajes recuperados desde la API, y la segunda, en la que se detalla más información del personaje seleccionado.

En la primera se puede filtrar por nombre y actualizar la lista.

En el detalle se podrá visualizar una foto del personaje (si está disponible), un link con mas información, número de comics disponibles, descripción y fecha de última modificación. 

* Librerias (PODS):

  - pod 'KRProgressHUD'

* Librerias (Package Manager):

  - Alamofire

Observaciones:

Para probar diferentes WS se realiza una llamada para obtener un personaje en concreto en la vista de detalle, pero ésta habría sido innecesaria ya que en el primer WS obtenía toda la información y podía reutilizarla.
