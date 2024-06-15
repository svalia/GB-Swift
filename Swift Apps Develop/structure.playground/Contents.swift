import UIKit

struct Lemonade {
    var name: String
    private var cost: Double
    var size: Size
    
    var promoCode: PromoCode//1. Добавить в структуру лимонада промокоды. Это будет строка (свойство с типом строка)

    
    var sirope: String {
        get {
            name + size.rawValue
        }
        set (newSirope) {
            name = newSirope + name
        }
    }
    init(name: String = "Cola", cost: Double, size: Size, promoCode: PromoCode) {
        self.name = name
        self.cost = cost
        self.size = size
        self.promoCode = promoCode
    }
    init?(basename: String = "Fanta", cost: Double, size: Size, promoCode: PromoCode) {
        name = basename
        if size == .s {
            self.cost = cost
        }
        else if size == .m {
            self.cost = cost * 0.9
        }
        else if size == .l {
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
    mutating func setPromoCost (promoCode: PromoCode?) {
        
        guard let promoCode else {
        return
        }
        switch promoCode {
        case .happy(let discount): cost *= discount
        case .new(let discount): cost *= discount
        case .year(let discount): cost *= discount
        case .newSize(let discount, let promoSize): cost *= discount
        }
    }
        

}

//var cola = Lemonade(cost: 15.0, size: "Middle")
//var colaZero = Lemonade(name: "Cola Zero", cost: 20.0, size: "Middle")
//print(cola.name)
//print(colaZero.name)
//print(cola.sirope)
//cola.sirope = "orange"
//print(cola.name)
//var cola3 = Lemonade(basename: "Sprite", cost: 0.5, size: .m, promoCode: "1a2Sasd")
//print(cola3?.returnCost() ?? 10.0)

enum Size: String {
    case s
    case m
    case l
    static var size = "size"
    func getNameSize (name:String) -> String {
        name + self.rawValue + Size.size
    }
    //Написать функцию в перечислении Size, которая на основе промокода и размера возвращает можно ли увеличить размер бесплатно. Если промокод “newSize” и размер не l, то вернуть true, в противном случае false.

    mutating func getNewSize (promoCode: PromoCode) -> Bool {
        switch promoCode {
        case .newSize(_ , let size) where self != .l:
            self = size
            return true
        default: false
        }
        return false
    }
    init? (cost: Double) {
        guard cost >= 0 else {
            return nil
        }
        switch cost {
        case 0..<100 : self = .s
        case 100..<300 : self = .m
        case 300... : self = .l
        default : return nil
        }
        
    }
}
print(Size.size)

enum PromoCode {
    case happy (Double)
    case new (Double)
    case year (Double)
    case newSize (Double, Size)
}
var s = Size.s
var m: Size = .m
var l = Size(rawValue: "large")

s.getNameSize(name: "Lemon ")
m.getNameSize(name: "lemon ")

var lemonad = Lemonade(name: "Cola", cost: 10.5, size: .l, promoCode: .happy(10.0))
lemonad.setPromoCost(promoCode: .happy(10.0))
lemonad.setPromoCost(promoCode: .newSize(10, .l))
lemonad.setPromoCost(promoCode: .new(20.0))
lemonad.setPromoCost(promoCode: .year(30.0))

class VendingAutomate {
    func start() {
        print("start start start")
    }
    final func final() {
        print("final")
    }
}

class Automate : VendingAutomate {
    private(set) var name: String = "number_one"
    private var lemonades: [Lemonade] = []
    init(lemonades: [Lemonade]) {
        self.lemonades = lemonades
    }
    func getAllLemonades () -> [Lemonade] {
        lemonades
    }
    func addNewLemonade (newLemonade: Lemonade) {
        lemonades.append(newLemonade)
    }
    func setNewName(_ newName: String) {
        name = newName
    }
    override func start() {
        super.start()
        print(lemonades.count)
    }
    convenience override init() {
        let cola = Lemonade(name: "Cola", cost: 10.0, size: .m, promoCode: .new(20.0))
        let fanta = Lemonade(name: "Fanta", cost: 15.0, size: .m, promoCode: .new(25.0))
        self.init(lemonades: [cola, fanta])
    }
}

enum Scan {
    case qr (String)
    case barCode (Int, Int, Int, Int)
}
var scan1 = Scan.barCode(5, 5, 5, 5)
var scan2 = Scan.qr("qr")

func qrOrBarCode (code: Scan) -> (String?, Int?) {
    switch code {
    case .barCode(let a, let b, let c, let d) : let f = a + b + c + d 
        return (nil, f)
    case .qr(let g) : return (g, nil)
    }

}

final class FoodAutomate: VendingAutomate {
    private var chocoSet: [Chokolate]
    
    init(chocoSet: [Chokolate]) {
        self.chocoSet = chocoSet
    }
    func getChocos () -> [Chokolate] {
        chocoSet
    }
    func addNewChoco (newChoco: Chokolate) {
        chocoSet.append(newChoco)
    }
    
}

struct Chokolate {
    var name: String
    var cost: Double
    enum TypeOfChoco: String {
        case dark
        case milk
        case white
    }
    init(name: TypeOfChoco, cost: Double) {
        self.name = name.rawValue
        self.cost = cost
    }
}

var drinksAutomate = Automate(lemonades: [])
drinksAutomate.start()
var foodAutomate = FoodAutomate(chocoSet: [])
foodAutomate.start()

var vending1: VendingAutomate = VendingAutomate()
var vending2: VendingAutomate = Automate(lemonades: [])
var vending3: VendingAutomate = FoodAutomate(chocoSet: [])
print(type(of: vending1))
print(type(of: vending2))
print(type(of: vending3))

print(vending2 is VendingAutomate)
print(vending2 is Automate)
print(vending2 is FoodAutomate)

var vending4 = vending2 as? FoodAutomate
//vending4?.getAllLemonades()
vending4?.getChocos()
