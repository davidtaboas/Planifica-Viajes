# Planifica Viajes

Esta aplicación ayuda a planificar un viaje en los aspectos más sencillos, pudiendo anotar las líneas maestras del evento, tareas, materiales, presupuesto, etc. Además, permite que los viajes sean colaborativos.

Esta aplicación está construída pensando en poder subirse a producción en Heroku.

## Instalación

Instalación de paquetes de rails

`bundle install`

Instalación de componentes web

`bower install`

## Configuración

### Variables

Debemos tener un archivo application.yml donde almacenaremos las claves de AWS, con un formato similar al siguiente:

`
AWS_ACCESS_KEY: "ZZZZZZZZZZZZ"
AWS_SECRET_KEY: "YYYYYYYYYYYYYYYYY/bbbbbbb"
AWS_BUCKET: "nombre-bucket"
`
### Base de datos

En producción se configura con la base de datos de Heroku, pero en local podemos modificar el archivo database.yml para adaptarlo a nuestras necesidades



