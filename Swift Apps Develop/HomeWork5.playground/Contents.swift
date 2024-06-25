import UIKit

//Вкусы
enum Taste: String {
    case lemon
    case strawberry
    case chokolate
}
//Украшения
enum CakeDecoration {
    case cream
    case fruitSlices
    case icing
    case nuts
    case powderedSugar
    
}
//Структура продукта подписанная на протокол Products
struct Cake: Products {
    var cost: Double
    var taste: Taste
    var decoration: [CakeDecoration]
    var name: String { //Вычисляемое свойство name
        get {
            taste.rawValue + " Cake"
        }
        set (newTaste) {
            "Cake" + newTaste
        }
    }
    
    init?(cost: Double, taste: Taste, decoration: [CakeDecoration]?) {//опциональный инициализатор
        self.cost = cost
        self.taste = taste
        guard let decoration else {
            return nil
        }
        self.decoration = decoration
    }
    func getCost () -> Double {
        return cost
    }
    mutating func setCost (discount:Int) -> Double { //функция меняющее свойство структуры в которой она находится
        guard discount <= 30 else {
            print("Скидка не может быть больше 30%")
            return cost
        }
        var newCost = Int(cost) * (1 - (discount/100))
        cost = Double(newCost)
        return cost
    }
    func isPacket() -> Bool {
        cost > 100
    }
}

//Протокол коробки для продуктов
protocol ProtBox {
    associatedtype Goods
    func addNewGood(newGood: Goods)
    func getGood() -> [Goods]
}
//Класс коробки с дженериком и ассоциированным типом Goods
class Box<T> {
    typealias Goods = T
    private var things: [T]
    init(things: [T]) {
        self.things = things
    }
    
    func addNewThing(newThing: T?) { // функция добавления новой вещи в корзину
        if let newThing {
            things.append(newThing)
        }
    }
    func getAllThingsInBox() { // функция получения всех вещей в корзине
        things
    }
}
//Расширение для коробки
extension Box: ProtBox {
    func addNewGood(newGood: T) {
        things.append(newGood)
    }
    func getGood() -> [T] {
        things
    }
}

enum AdBanner { // рекламный баннер с перечислением
    case text(String)
    case int(Int)
    case double(Double)
}
func getAdBanner(ad: AdBanner) -> (String?, Int?, Double?) { //цункция возврата значения рекламного баннера
    switch ad {
    case .text(let text) : return (text, nil, nil)
    case .int(let int) : return (nil, int, nil)
    case .double(let double) : return (nil, nil, double)
    }
}


var lemonCake = Cake(cost: 10.5, taste: .chokolate, decoration: [.cream, .nuts])
print(lemonCake?.name)// после добавления опционалного инициализатора, xcode попросил тут добавить ? - примерно понял почему, но хочу чтобы понять наверняка
lemonCake?.getCost() //тут тоже самое

class StandartBox: Box<Cake> {

}

class Basket: Box<Products> {
    //1. Написать в классе корзинки функцию, которая будет возвращать из массива товара только пирожные.
    //2. Написать в классе корзинки функцию, которая будет возвращать товары из корзинки, отсортированные по убыванию стоимости.
    //3. Написать функцию в классе корзинки, которая будет возвращать стоимость всех товаров, лежащих в корзинке.
    func getOnlyCakes () -> Products {
        getGood().filter {$0 is Cake} as! Products//as! Products - это предложил добавить xcode - понимаю что это связанно с опциональным типом Cake, но не очень понимаю суть
    }
    func getGoodsSortedByCost() -> Products {
        getGood().sorted {$0.cost < $1.cost} as! Products
    }
    func getCostOfAllGoods() -> Products {
        getGood().compactMap {$0.cost}.reduce(0, +) as! Products
    }
}

struct Book: Products {
    var cost: Double
}
struct Flower: Products {
    
    var name: NameFlower
    var cost: Double
    enum NameFlower: String {
        case rose
        case lily
        case daisy
    }
    
}

var products: [Products] = [Cake(cost: 10, taste: .chokolate, decoration: [.cream, .cream])!, Flower(name: .rose, cost: 130), Book(cost: 100), Book(cost: 150)]
var bask = Basket(things: products)


var box1 = Box<Cake>(things: [])
var cake1 = Cake(cost: 10, taste: .chokolate, decoration: [.cream, .nuts])
if let cake1 {
    box1.addNewThing(newThing: cake1)
}

box1.addNewThing(newThing: cake1!)

func optionalString(a:String?) -> String {
    a ?? "" // если а строка - вернется строка, а если а это nil врентся "" (пустая строка)
}


var threeFlowers = [Flower(name: .daisy, cost: 5), Flower(name: .rose, cost: 10), Flower(name: .lily, cost: 15)]
var flowersBasket = Basket(things: threeFlowers)
print(flowersBasket.getAllThingsInBox())

var anyCakes = [Cake(cost: 10, taste: .chokolate, decoration: [.nuts])]
var someCake: [Cake] = []
for element in anyCakes {
    if let element {
        someCake.append(element)
    }
}
print(type(of: anyCakes))
var simpleBox = StandartBox(things: someCake)
                                                                          
protocol Products {
    var cost: Double {get}
    func isPacket() -> Bool
}
extension Products {
    func isPacket() -> Bool {
        false
    }
}

func fiveNum<T: Numeric>(a: [T]) -> T {
    var sum: T = 0
    for element in a {
        sum += element
    }
    return sum
}


extension String {
    var word: String {
        "value"
    }
    func printSting() {
        print("\(self) \(word)")
    }
}
var str = "hello world"
str.printSting()
str.word


let a = {(a: Int, b: Int) -> String in
    let c = a + b
    return "Sum: \(c)"
}

a(4, 5)

let b = {(a: Int, b: Int) in
    "raznica: \(a - b)"
}

func twoNum(a: Int, b: Int, closure: (Int, Int) -> String) {
    closure(a, b)
}
twoNum(a: 5, b: 5) { c, d in
    String(c - d)
}
 twoNum(a: 3, b: 2, closure: b)

let d = {
    print("hello")
}
d()
func clos(closure: () -> Void) {
    closure()
}

clos {
    print("hello")
}
clos(closure: d)
twoNum(a: 7, b: 8) { _, d in
    String(d)
}

func twoNumeber(a: Int, b: Int, closure: @escaping (Int, Int) -> String) {
    a + b
    closure(a, b)
}

//1. Создать константу, в которой лежит замыкание, которое на вход принимает строку, а возвращает число из строки, если это число и nil, если не число

let n = {(a: String) -> Int? in
//    type(of: Int(a)) is Int ? Int(a) : nil
    let c = Int(a)
    guard let c else {
        return nil
    }
    return c
}
//2. Написать функцию, которая на вход принимает строку и замыкание того же типа, как в пункте 1. Внутри функции вызывается замыкание
func stringToInt(a: String, closure:(String) -> Int?) {
    closure(a)
}

//3. Вызвать функцию 2 способами. В первом передать заранее подготовленное замыкание, а во втором - написать замыкание при вызове функции

stringToInt(a: "56", closure: n)
stringToInt(a: "78") { b in
    Int(b)
}




