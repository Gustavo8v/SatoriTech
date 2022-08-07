# SatoriTech

6.- ViewDidLoad - Se llama cuando se crea la clase y se carga desde xib. Ideal para la configuración inicial y trabajo de una sola vez.

ViewWillAppear - Llamada justo antes de que aparezca su vista, es buena para ocultar / mostrar campos o cualquier operación que desee realizar cada vez antes de que la vista sea visible. Debido a que puede estar yendo y viniendo entre vistas, esto se llamará cada vez que su vista esté a punto de aparecer en la pantalla.

ViewDidAppear - Llamado después de que aparezca la vista-gran lugar para iniciar una animación o la carga de datos externos de un API.

ViewWillDisappear/DidDisappear - La misma idea que ViewWillAppear/ViewDidAppear.

7.-
Lanzamiento

application: didFinishLaunchingWithOptions: -> Bool se llama a continuación. Este método de devolución de llamada se llama cuando la aplicación ha terminado de lanzar y restaurar el estado y puede hacer la inicialización final, como la creación de UI.
applicationWillEnterForeground: se llama después de application: didFinishLaunchingWithOptions: o si su aplicación se activa de nuevo después de recibir una llamada telefónica u otra interrupción del sistema.
applicationDidBecomeActive: se llama después de applicationWillEnterForeground: para finalizar la transición al primer plano.
Terminación

applicationWillResignActive: se llama cuando la app está a punto de quedar inactiva (por ejemplo, cuando el teléfono recibe una llamada o el usuario pulsa el botón Home).
applicationDidEnterBackground: se llama cuando tu app entra en un estado de segundo plano después de quedar inactiva. Tienes aproximadamente cinco segundos para ejecutar cualquier tarea que necesites para respaldar las cosas en caso de que la aplicación se termine más tarde o justo después.
applicationWillTerminate: se llama cuando tu aplicación está a punto de ser purgada de la memoria. Llama a cualquier limpieza final aquí.

8.- weak para hacer una referencia debil, strong cuando se quiere dejar la referencia en memoria y unowned cuando se hace un tipo force unwraping cuando se declara la propiedad

9.- conteo nativo de memoria para iOS

10.- amarillo ya que se setea desde el ciclo de vida de la app
