//Autos

object luke{
    var cantidadViajes = 0
    var recuerdo = null
    var vehiculo = alambiqueVeloz

    method cantidadViajes() = cantidadViajes 

    method viajar(lugar){
        if (lugar.puedeLlegar(vehiculo)) {
            cantidadViajes = cantidadViajes + 1
            recuerdo = lugar.recuerdoTipico()
            vehiculo.desgaste()
        }
    }
    method recuerdo() = recuerdo
    method vehiculo(nuevo) {vehiculo = nuevo}
}

object alambiqueVeloz {
    var property esRapido = true
    var property tanqueLleno = true
    var patente = "AB123JK"
    method puedeFuncionar() = tanqueLleno
    method desgaste() {
        tanqueLleno = false
    }
    method patenteValida() = patente.head() == "A"
}


object antigualla {
    const property gangsters = ["marco" , "polo" , "claudio" , "pepe" , "claudia" , "josefina" , "alfonso"]
    
    method velocidad() {
        return gangsters.fold(0,{acum,item=>acum+item.length()})
    }
    method desgaste(){
        self.perderUnGangster()
    }

    method perderUnGangster(){
        self.bajarGangster(gangsters.anyOne())
    }

    method bajarGangster(unGangster){
        gangsters.remove(unGangster)
    }
    method subirGangster(unGangster) {
        gangsters.add(unGangster)
    }

    method esRapido() {
        return gangsters.size() > 6
    }
    method puedeFuncionar() = !gangsters.isEmpty()
    method patenteValida() = chatarra.esRapido()
}
object chatarra {
    var cañones = 10
    var municiones = "ACME"
    method puedeFuncionar() = true//municiones == "ACME" and cañones.between(6,12)
    method esRapido() = municiones.size() < cañones
    method desgaste(){
        cañones = (cañones / 2).roundUp(0)
        if (cañones < 5 )
          municiones = municiones + " Obsoleto"
    }
    method patenteValida() = municiones.take(4) == "ACME" 
    method cañones() = cañones

}

//El auto del profesor Locovich
object convertible{
    //Lista de posibles vehiculos sucesivos. Cambia antes de la carrera
    var convertido = antigualla
    method tanqueLleno() = convertido.tanqueLleno() 
    method esRapido() = convertido.esRapido()
    method desgaste(){
        convertido.desgaste()
    }
    method convertir(vehiculo){
        convertido = vehiculo
    }
    method patenteValida() = convertido.patenteValida()
 
}

object moto{
    method esRapido() = true
    method tanqueLleno() = false
    method desgaste() { }
    method patenteValida() = false
}

//Ciudades

object paris{
    method recuerdoTipico() = "Llavero Torre Eiffel"
    method puedeLlegar(vehiculo) =  vehiculo.tanqueLleno() 
    
}

object buenosAires{
    method recuerdoTipico() = "Mate"
    method puedeLlegar(vehiculo) =  vehiculo.esRapido() 
}

object bagdad {
    var recuerdo = "bidon de petroleo"
    method recuerdoTipico() = recuerdo
    method recuerdo(nuevo) {recuerdo = nuevo }
    method puedeLlegar(vehiculo) = true
}

object lasVegas{
    var homenaje = paris
    method homenaje(lugar) {homenaje = lugar}
    method recuerdoTipico() = homenaje.recuerdoTipico()
    method puedeLlegar(vehiculo) = homenaje.puedeLlegar(vehiculo)
}

object hurlingham{
   method puedeLlegar(vehiculo) = vehiculo.tanqueLleno() and vehiculo.esRapido()
  method recuerdoTipico() = "sticker de la Unahur"
}