object mariano {
    var property bolsa = []

    method comprar(golosina){
        bolsa.add(golosina)
    }
    method desechar(golosina){
        bolsa.remove(golosina)
    }
    method probarGolosina() {
        bolsa.forEach { golosina => golosina.morder() }
    }
    method hayGolosinaSinTACC(){
        bolsa.find{ golosina => golosina.contGlueten() == "no"}
    }
    method preciosCuidados() {
        bolsa.all { g => g.precio() < 10 }
    }
    method primerGolosinaSabor(sabor){
        bolsa.find{ g => g.sabor() == sabor}.first()
    }
    method golosinasSabor(sabor){
        bolsa.find{ g => g.sabor() == sabor}
    }
    method sabores() {
        var sabores = #{}
        sabores = bolsa.find { g => g.sabor() == "frutilla" or g.sabor() == "chocolate" or g.sabor() == "naranja"}
    }
    method masCara(){
        bolsa.sortedBy {a,b => a.precio() > b.precio() }.first()
    }
    method pesoGolosinas(){
        bolsa.peso().sum{ }
    }

}


object bombon {
    var property precio = 5
    var property peso = 15
    var property sabor = "frutilla"
    var property contGlueten = "no"
    //var property peso = 

    method morder() { return (peso*0.8)+1}
}

object alfajor {
    var property precio = 12
    var property peso = 300
    var property sabor = "chocolate"
    var property contGlueten = "si"
    //var property peso = 

    method morder() { return (peso*0.8)}

}

object caramelo {
    var property precio = 1
    var property peso = 5
    var property sabor = "frutilla"
    var property contGlueten = "no" 

    method morder() { return peso-1}

}

object chupetin {
    var property precio = 2
    var property peso = 7
    var property sabor = "naranja"
    var property contGlueten = "no"

    method morder() {  if (peso > 2){ return peso*0.9} else{return 2}}

}

object oblea {
    var property precio = 5
    var property peso = 250
    var property sabor = "vainilla"
    var property contGlueten = "si"    

    method morder() { if (peso > 70){return peso*0.5} else{return peso*0.25}}

}

object chocolatin {
    var property precio = 0.5
    var property sabor = "chocolate"
    var property contGlueten = "si"
    var property peso = 5

    method morder(valor) { return valor-2}

}

object glaseado {
    var property precioInicial = 0
    var property pesoInicial = 0
    var property sabor = ""
    var property contGlueten = ""
    var property precio = 2
    var property peso = 4

    method base(golosina){
        precio = golosina.peso()
        if (golosina == "chocolatin"){
            peso = 5
        }
        else {
            pesoInicial = golosina.peso()
        }
        sabor = golosina.sabor()
        contGlueten = golosina.contGlueten()
    }

    method morder(golosina) { 
        precio = golosina.peso()
        if (golosina == "chocolatin"){
            peso = 5
        }
        else {
            pesoInicial = golosina.peso()
        }
        sabor = golosina.sabor()
        contGlueten = golosina.contGlueten()


        if (peso == 0){
            return 0
        }
        peso -= 2

        const pesoTotal = pesoInicial + peso
        return pesoTotal
    }
}

object pastilla {
    var property peso = 5
    var property sabor = ["frutilla","chocolate","naranja"]
    var property precio = 0
    var property i = 0
    //var property peso = 

    method precio(contGluten) {
        if (contGluten == "no"){
            precio = 7
        }
        else {
            precio = 10
        }
    }

    method morder(){
        const saborActual = self.sabor().get(i)
        i += 1
        if (i == 3){i=0}
        return saborActual
    }
}
