# Meep  


# Instalación MeepPods

Para la instalación de los Meep Pods primero tienes que llevarte el repositorio de specs de Meep a tu ordenador, para ello, lanzar la siguiente instrucción:

~~~
pod repo add MeepSpecs git@github.com:MeepAppTeam/ios-meepspecs.git
~~~

> Si tienes algún problema para bajarlo, es posible que no tengas bien configurada la SSH Key de Github. De ser así, ve a tu perfil de Github y dentro del apartado SSH keys, sigue las instrucciones.

Lo siguiente, es añadir el repositorio al Podfile de Meep (si no está ya añadido). Para eso añadir al Podfile del proyecto de Meep la siguiente línea después del source de CocoaPods:

~~~
source 'git@github.com:MeepAppTeam/ios-meepspecs.git’
~~~

Por último sólo quedará añadir el pod de Meep que queramos. 

Por ejemplo: Pod `MeepUI` e instalarlo con `pod install`. 

> Si por algún motivo hay un error en la operación al instalar el pod, tendrás que hacer un `pod repo update` y volver a intentarlo.


# Desarrollo de un Pod

Todos los Pods de Meep tienen un repositorio en Github, podrán ser clonados como otro cualquier. Una vez que te lo has bajado, verás una estructura similar a la siguiente:

    - PodName
     - CHANGELOG.md
     - Example
     - fastlane
     - Gemfile
     - Gemfile.lock
     - LICENSE
     - PodName
     - PodName.podspec
     - README.md
     
Los archivos Gemfile, pertenecer el gestor de dependencias (gem) de ruby llamada Bundler, con este nos aseguramos de usar todos la misma versión.

> Por ejemplo de cocoapods.

Por otra parte tenemos la carpeta fastlane, donde se encuentra los archivos para automatizar acciones como por ejemplo la subida de una nueva versión.

Finalmente la carpeta Example contiene el proyecto sobre el cuál desarrollaremos nuestro framework.


## Bundler (https://bundler.io/)

Instalar las siguientes dependencias:
~~~
// Install bundler
gem install bundler

// Install deps
bundle install
~~~

Una vez instalado Bundler todos los comandos se ejecutaran seguido de:

~~~
// Run command
bundle exec <command>
~~~


## Mint (https://github.com/yonaskolb/Mint)

Para la instalación y uso de herramientas globales hacemos uso de Mint, este es un gestor de paquetes que permite instalar y ejecutar paquetes de linea de comandos de Swift.

En este caso su uso principal es para Linter y SwiftLint. Actualmente los proyectos tienen los scripts configurados, por lo que no necesita configuración previa, solamente su instalación.

~~~
// Install mint
brew install mint

// Examples
mint run realm/SwiftLint@0.39.0 // Install and run
~~~


## Desarrollo

Dentro de la carpeta `Example` se encuentra el fichero  `/*.workspace`, es el usado para desarrollar la librería. En el interior hay dos proyectos, uno es el Proyecto principal a desarrollar y el otro Pod.


En el proyecto Pods, se encuentra todo el código en desarrollo:

En la carpeta `Classes`se encuentra el código de la librería.
En la carpeta `Pod` el fichero de configuración `*.podspec`. 

El proyecto `Example` es sólo de `prueba` para desarrollar la librería y realizar los `Test`. También es necesario este proyecto, ya que si existiese una dependencia a otra librería, este sería el lugar adecuado para instalarla.

> bundle exec pod install

Por último, cualquier cambio en el proyecto de Pod, se verá inmediatamente reflejado en el otro proyecto de `desarrollo` o `prueba` después de realizar un Build.

## Lanzar nueva versión
### Automático (Fastlane)

Los Pods tienen confirurados diferentes lanes (Fastlane) para varias tareas, como realizar un escaneo en el código con linter o lanzar una nueva versión.

Para ellos están los siguentes comandos: 

~~~
// Ejecutar linter y comprobar que todo está correcto en el pod
bundle exec fastlane lint

// Lanzar nueva versión (también comprueban el pod y ejecuta el linter)
bundle exec fastlane patch // i.e. 0.0.0 -> 0.0.1
bundle exec fastlane minor // i.e. 0.0.0 -> 0.1.0
bundle exec fastlane major // i.e. 1.0.0 -> 1.0.0
~~~

### Manual

El código del Pod, se encuentrá dentro de la carpeta `Classes` del proyecto `Pod`, por lo que el desarrollo se realiza dentro de la misma. Una vez finalizados los cambios, para subir de versión se modifica la siguiente línea dentro del fichero `*.podspec`:

~~~
s.version          = '0.1.1'
~~~

Para comprobar que todo sigue funcionando usamos la siguiente instrucción

~~~
pod lib lint [POD_NAME].podspec --allow-warnings
~~~

Si todo ha ido bien, se hace commit de todos los cambios y push del repositorio (recuerda el git está en la carpeta padre y no dentro de la carpeta Example).
Lo siguiente es cambiar el tag del repositorio, para ello hacemos lo siguiente en la línea de comandos:

~~~
git tag 0.1.1 // Usa el mismo número de versión del podspec sin comillas simples
git push --tags
~~~

Y, por último, hay que actualizar el spec de los pods de meep, para que se actualice el número de versión de la librería:

~~~
pod repo push MeepSpecs [POD_NAME].podspec
~~~

Para probar que todo ha ido bien, `pod update`, en el proyecto principal de Meep.


### Número de versión

Para cambiar el número de versión de una librería:

Patch (X.X.+1): Cambios en la librería que no necesiten actualización por parte de la app.
Por ejemplo, cambiar un fichero de ubicación, cambiar algo de alguna función interna, un refactor que no afecte a la app, etc.

Minor (X.+1.0): Cambios que requieren actualización de la app.
Por ejemplo, añadir un nuevo parámetro a un constructor que este usando la app, una nueva feature, algo que cambie el comportamiento de algo por completo, etc.

Major (+1.0.0): Cambio que requiere actualización de la app y que ha cambiado la estructura interna de la librería. 
Por ejemplo, añadir la nueva arquitectura VIPER en MeepComponets.


## Crear un Pod

Para crear un Pod lo primero es crear la estructura de la librería:

~~~
pod lib create [POD_NAME]
~~~

En la pregunta ¿Quieres crear una `demo application`? di `YES`:

Después de crear la estructura, hay que crear un nuevo repositorio en `Github.com` (en nuestro caso) y subir la librería. Una vez hecho el `push` de todos los cambios hay que modificar el `*.podspec` que encontrarás dentro del proyecto Pod. Para no olvidar nada, copia el `podspec` de otra librería, revisa y cambia lo necesario, teniendo especial cuidado en `s.source` y `s.source_files`.

---
** NOTE **

El código que vamos a crear tiene que estar dentro de la carpeta `Classes` y en un principio esta carpeta no aparece en el proyecto de Pod. Por lo que abre un Finder, y arrastra la carpeta, que estará dentro de `[POD_NAME]`, en Devlopment Pods/[POD_NAME]. Una vez hecho, ya podrás desarrollar el código de la libraría.
---
