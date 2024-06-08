import UIKit

struct Lemonade {
    var name: String
    private var cost: Double
    var size: String
    var promoCode: String//1. Добавить в структуру лимонада промокоды. Это будет строка (свойство с типом строка)

    
    var sirope: String {
        get {
            name + size
        }
        set (newSirope) {
            name = newSirope + name
        }
    }
    init(name: String = "Cola", cost: Double, size: String, promoCode: String) {
        self.name = name
        self.cost = cost
        self.size = size
        self.promoCode = promoCode
    }
    init?(basename: String = "Fanta", cost: Double, size: String, promoCode: String) {
        name = basename
        if size == "S" {
            self.cost = cost
        }
        else if size == "M" {
            self.cost = cost * 0.9
        }
        else if size == "L" {
            self.cost = cost * 0.85
        }
        else {
            return nil
        }
        self.size = size
        self.promoCode = promoCode
        
    }
    func returnCost () -> Double {
        cost
    }
    mutating func setCost (newCost: Double) {
        cost = newCost
    }
//    2. Написать функцию в структуре лимонада, которая на основе промокода устанавливает новую стоимость для лимонада. Если промокод “happy”, то стоимость уменьшается на 10%, если “new”, то на 15%, а если “year”, то на 20%. Функция ничего не возвращает
    mutating func setPromoCost (promoCode: String) {
        var x: Double
        switch promoCode {
        case "happy" : x = 0.9
        case "new" : x = 0.85
        case "year" : x = 0.80
        default : x = 1
        }
        cost = cost * x
    }

}

//var cola = Lemonade(cost: 15.0, size: "Middle")
//var colaZero = Lemonade(name: "Cola Zero", cost: 20.0, size: "Middle")
//print(cola.name)
//print(colaZero.name)
//print(cola.sirope)
//cola.sirope = "orange"
//print(cola.name)
var cola3 = Lemonade(basename: "Sprite", cost: 0.5, size: "M", promoCode: "1a2Sasd")
print(cola3?.returnCost() ?? 10.0)

