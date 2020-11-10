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

`source 'git@github.com:MeepAppTeam/ios-meepspecs.git`

Por último sólo quedará añadir el pod de Meep que queramos. Por ejemplo: Pod ‘MeepUI’ e instalarlo con pod install. Si al instalar un pod de Meep, salta el error de que no lo encuentra, tendrás que hacer un pod repo update y volver a intentarlo.
