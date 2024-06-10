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
