import elAlambiqueViajero.*

object carrera {
    const property inscriptos = []
    const property rechazados = []
    var destinoCarrera = paris

    method inscribir(unVehiculo) {
        if (destinoCarrera.puedeLlegar(unVehiculo)) {
            self.aprobarVehiculo(unVehiculo)
        } else {
            self.rechazarVehiculo(unVehiculo)
        }
    }

    method aprobarVehiculo(unVehiculo) {
        if (!inscriptos.any({v => v == unVehiculo}) && destinoCarrera.puedeLlegar(unVehiculo)){
            rechazados.remove(unVehiculo)
            inscriptos.add(unVehiculo)
        }
    }

    method rechazarVehiculo(unVehiculo) {
        if (!rechazados.any({v => v == unVehiculo})){
            inscriptos.remove(unVehiculo)
            rechazados.add(unVehiculo)
        }
    }

    method reevaluarInscriptos() {
        inscriptos.forEach({v => self.inscribir(v)})
        rechazados.forEach({v => self.inscribir(v)})
    }

    method replanificacion(nuevoDestino) {
        destinoCarrera = nuevoDestino
        self.reevaluarInscriptos()
    }

    method ganadorCarrera() {
        return inscriptos.filter(({v => v.velocidad()}).max())
    }
}

//Nuevos Autos

//Auto 00, el de Pierre Nodoyuna y Patán
object superPerrari {
    //Hacer trampas reduce velocidad
}