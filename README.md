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
