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

