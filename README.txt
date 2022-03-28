Aclaraciones sobre el proyecto:

La consigna es hacer una app de turismo que sugiera atracciones que visitar según los gustos personales, dándole prioridad a las más costosas, luego las que toman más tiempo y luego las que coinciden menos con los gustos personales, siguiendo el mismo criterio.
Esta mecánica se puede acceder en la pestaña de "Obtener Sugerencias". En "Ver Atracciones/Promociones" sólo se visualizan las mismas, sin orden particular.

El proyecto fue realizado utilizando Eclipse Enterprise, Tomcat 10 y SQLite.

La carpeta en la que están los archivos disponibles para ver se encuentra en /turismo/turismo_webapp/src/main

En la misma ruta, en la carpeta de "resources", se encuentra el archivo env.properties, en el que hay que reemplazar los signos de pregunta por la ubicación completa de la base de datos.

En un inicio, sólo Sam es administrador. Esto se puede cambiar entrando desde su cuenta y modificando otro usuario. Para ingresar, la contraseña es la misma que el nombre, incluyendo mayúscula.

En la base de datos, el valor de las promociones depende del tipo de promoción que sea: en las AxB el valor es 0 porque el real se calcula desde Java; en las absolutas el valor es el real, y en las porcentuales lo que aparece como valor es el porcentaje de descuento, el valor real también se calcula desde Java y se muestra en la página.

Los borrados son lógicos, no se elimina nada de la base de datos.