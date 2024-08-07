import UIKit

struct Lemonade {
    var name: String
    var cost: Double
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
extension Lemonade: Drinks {
    func printGet() {
        print("get")
        print(returnCost())
    }
    func randomCost() -> Int {
        Int.random(in: 100...300)
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

class VendingAutomate<T>: VendingAutomateProtocol {
    typealias Products = T
    private var products: [T]
    init(products: [T]) {
        self.products = products
        print("init")
    }
    deinit {
        print("deinit")
    }
    func addProduct(product: T) {
        products.append(product)
    }
    func getProducts() -> [T] {
        products
    }
    
//    func start() {
//        print("start")
//    }
    final func final() {
        print("final")
    }
}

class Automate: VendingAutomate<Drinks> {
    private(set) var name: String = "number_one" //private(set) - позволяет получить вне класса, менять можно только внутри
    lazy var countDrinks: Int = {
        getProducts().count
    }()
    var owner: AutomateOwner
    
    init(_ owner: AutomateOwner, _ goods: [Drinks]) {
        self.owner = owner
        super.init(products: goods)
    }
    deinit {
        print("deinit")
    }
    
    func setNewName(_ newName: String) {
        name = newName
    }
    func start() {
        super.start()
        print(countDrinks)
    }
    func minCostToMaxCost() -> [Drinks] {
        getProducts().sorted {$0.cost < $1.cost}
    }
    func getOnlyWater() -> [Drinks] {
        getProducts().filter {$0 is BootleOfWater}
    }
    func sumOfCostAll () -> Double {
        getProducts().map {$0.cost}.reduce(0, +)
    }
    func getLemonade() -> [Lemonade] {
        getProducts().compactMap {$0 as? Lemonade}
    }
    func drinkForUActivity(a: Person.Activity.TypeOfAvtivity) -> Drinks? {
        switch a {
        case .relax : getProducts().first
        case .hardwork : getProducts().last
        default : nil
        }

    }
//    convenience init() {
//        let cola = Lemonade(name: "Cola", cost: 10.0, size: .m, promoCode: .new(20.0))
//        let fanta = Lemonade(name: "Fanta", cost: 15.0, size: .m, promoCode: .new(25.0))
//        self.init(products: [cola, fanta])
//    }
    
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

final class FoodAutomate: VendingAutomate<Chokolate> {
    
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

let someTypeOfChoko: Chokolate.TypeOfChoco = .dark

class Person {
    struct Activity {
        enum TypeOfAvtivity {
            case relax
            case hardwork
            case sleep
        }
    }
}
typealias TypeAct = Person.Activity.TypeOfAvtivity
let some: TypeAct = .hardwork

func getCountAct (a:TypeAct...) -> Int {
    a.count
}

func getCountLemonade(a: Lemonade...) -> Int {
    a.count
}
func getCountLem(a: Drinks...) -> Int {
    a.compactMap {$0 as? Lemonade}.count
}

//var drinksAutomate = Automate(products: [])
//drinksAutomate.start()
//drinksAutomate.addProduct(product: Lemonade(cost: 10, size: .l, promoCode: .happy(10)))
//drinksAutomate.countDrinks



var foodAutomate = FoodAutomate(products: [])
foodAutomate.start()

//var vending1: VendingAutomate = VendingAutomate()
//var vending2: VendingAutomate = Automate(lemonades: [])
//var vending3: VendingAutomate = FoodAutomate(chocoSet: [])
//print(type(of: vending1))
//print(type(of: vending2))
//print(type(of: vending3))

//print(vending2 is VendingAutomate)
//print(vending2 is Automate)
//print(vending2 is FoodAutomate)

//var vending4 = vending2 as? FoodAutomate
//vending4?.getAllLemonades()
//vending4?.getChocos()

func printFunc<T>(_ a:T) {
    print(a)
}
printFunc("sdf")
printFunc(5)
printFunc(5.0)

func multiplayThreeInt<T: Numeric> (_ a: T, _ b: T, _ c: T) -> T {
    a * b * c
}
var multi1 = multiplayThreeInt(5, 3, 3)
var multi2 = multiplayThreeInt(3.5, 2.4, 4.5)


//Написать функцию, которая на вход принимает массив опциональных лимонадов. Если массив пустой - вывести в консоль, что он пустой. Если лимонад есть - вывести его стоимость, увеличенную в 5 раз, в противном случае ничего не делать.

func printLimonadeCost(a:[Lemonade?]) {
    guard !a.isEmpty else {
        print("Лимонад закончился")
        return
    }
    for element in a {
        if let element {
            print(element.returnCost() * 5)
        }
    }
}

func printCost(a: [Lemonade?]?) {
    guard let a, !a.isEmpty else {
        print("Лимонад закончился")
        return
    }
    for element in a {
        if let element {
            print(element.returnCost() * 5)
        }
    }
}

//Написать функцию, которая на вход получает опциональную стоимость, а возвращает шоколад. Если стоимость существует - вернуть молочный шоколад с этой стоимостью, в противном случае вернуть nil

func getChocoCost(cost: Double?) -> Chokolate? {
    guard let cost else {
        return nil
    }
    return Chokolate(name: .milk, cost: cost)
}

//Создать опциональную переменную, равную 5. Создать еще одну переменную, которая будет равна первой, если она существует и 10, если первая переменная nil
var number: Int? = 5
var num = number ?? 10


struct BootleOfWater: Drinks {
    var cost = 10.0
}

protocol Drinks {
    var cost: Double {get}
    func printGet()
}

extension Drinks {
    func printGet() {
        print("get")
    }
}
var rosinka: Drinks = BootleOfWater(cost: 15)

print(rosinka.cost)

//drinksAutomate.addProduct(product: BootleOfWater(cost: 5))
//lemonad.printGet()
//lemonad.randomCost()
//print(drinksAutomate.getProducts())
//rosinka.printGet()
//lemonad.printGet()
//
//
//print("Сортировка по цене: \(drinksAutomate.minCostToMaxCost())")

protocol VendingAutomateProtocol: AnyObject {
    associatedtype Products
    func start()
    func final()
    func getProducts() -> [Products]
    func addProduct(product: Products)
}

class TestStruct: VendingAutomateProtocol {
    func getProducts() -> [Lemonade] {
        []
    }
    
    func addProduct(product: Lemonade) {
        
    }
    
    typealias Products = Lemonade
    
}
extension VendingAutomateProtocol {
    func start() {
        print("Старт")
    }
    func final() {
        print("Стоп")
    }
}

class Cafe: VendingAutomateProtocol {
    typealias Products = Chokolate
    
    var things: [ShowCaseProtocol] = []
    
    func getProducts() -> [Chokolate] {
        []
    }
    func addProduct(product: Chokolate) {
        print(product)
    }
}

class Vetrina: ShowCaseProtocol {
    func printGive() {
        print("give")
    }
}

var showCase = Vetrina()
showCase.printGive()

class Box: ShowCaseProtocol {
    var boxName = "box2"
    func printGive() {
        print("give")
    }
}

var boxOne = Box()
boxOne.printGive()

protocol ShowCaseProtocol {
    func printGive()
}

var cafe1 = Cafe()
cafe1.things.append(Box())
cafe1.things.append(showCase)

class Polka: ShowCaseProtocol {
    var count = 5
    func printGive() {
        print("полка")
    }
}

cafe1.things.append(Polka())

for element in cafe1.things {
    element.printGive()
}

for element in cafe1.things {
    if let polka = element as? Polka {
        print(polka.count)
    }
}


//for element in cafe1.things {
//    if let boxNames = element as? Box {
//        print(boxNames.boxName)
//    }
//}


for element in cafe1.things {
    guard let boxNames = element as? Box else {
        continue
    }
    print(boxNames.boxName)
}
let b = [3, 23, 232, 4]
let d = b.sorted()
print(d)
let g = b.sorted(by: >)
print(g)
let v = b.sorted {first, second in
first < second
}
print(v)
let k = b.sorted {$0>$1}
print(k)

var n = [1, 2, 3, 4, 5]

n.sort(by: >)
print(n)

let y = n.filter{$0 > 3}
print(y)

print(n.reduce(0, +))

let j = n.map{$0 - 3}.sorted().filter{$0 < 2}
print(j)

let i = [1, nil, 2, nil, 4, 5]
let t = i.compactMap{$0}
print(t)

let o = [b, n, y]
let u = o.flatMap{$0}
print(u)
print(o)

n.forEach{print($0)}
n.forEach{element in
    print(element)
}
print(n.first{$0 > 3})
print(n.last{$0 > 2})


func varParam(a: String...) -> Int {
    a.compactMap{$0.count}.reduce(0, +)
}

varParam(a: "Hello world", "Hello")

var lemonade1 = Lemonade(name: "Cola", cost: 100, size: .m, promoCode: .happy(10))
var lemonade2 = lemonade1

print(lemonade1.name)
print(lemonade2.name)

lemonade2.name = "Fanta"
print(lemonade1.name)
print(lemonade2.name)

//var automat1 = Automate(products: [])
//var automat2 = automat1
//
//print(automat1.name)
//print(automat2.name)
//
//automat2.setNewName("1")
//
//print(automat1.name)
//print(automat2.name)
//
////классы и замыкания ссылочные типы
//print(automat1 === automat2)
////var automat3 = Automate(products: [])
//print(automat1 === automat3)

let lemonad3 = Lemonade(name: "Sprite", cost: 100, size: .m, promoCode: .happy(20))

var array = [3, 2]
var array2 = array

func getAddress(_ collection: UnsafeRawPointer) {
    print(Int(bitPattern: collection))
}
getAddress(array)
getAddress(array2)
array.append(7)
getAddress(array)
getAddress(array2)

//Создать класс кафе, в котором есть меню. В меню есть чай, кофе и пирожные.

class Cafe1 {
    struct Tea: MenuItem {
        var name: String
        var cost: Double
    }
    struct Cake: MenuItem {
        var name: String
        var cost: Double
    }
    struct Coffee: MenuItem {
        var name: String
        var cost: Double
    }
    var menu: [MenuItem]
    
    init(_ menu: [MenuItem]) {
        self.menu = menu
    }
    func getOnlyTea() -> [Tea] {
        menu.compactMap{$0 as? Tea}
    }
    func getOnlyTea() -> [MenuItem] {
        menu.filter{$0 is Tea}
    }
    func getMenuItem100() -> [MenuItem] {
        menu.filter{$0.cost > 100}
    }
}
protocol MenuItem {
    var name: String {get set}
    var cost: Double {get set}
    func costMultiply() -> Double
}

extension MenuItem {
    func costMultiply() -> Double {
        cost * 10
    }
}

var tea: MenuItem = Cafe1.Tea(name: "Lipton", cost: 150)
var cake: MenuItem = Cafe1.Cake(name: "Ecler", cost: 200)
var coffee: MenuItem = Cafe1.Coffee(name: "Capochinno", cost: 180)

var cafe12 = Cafe1([tea, cake, coffee])

final class Cafe2: Cafe1 {
    
}

var cafe23 = Cafe2([])
print(cafe12.menu)
print(cafe23.menu)

//var vAutomat: VendingAutomate? = VendingAutomate(products: [])
//vAutomat = nil

class AutomateOwner {
    var name = "Semen"
    weak var automatDrink: Automate?
    lazy var secondName = {[weak self] in
        self?.name ?? "Semen" + " owner"
    }
    init() {
        print("init")
    }
    deinit {
        print("deinit")
    }
}

var owner1: AutomateOwner? = AutomateOwner()
if let owner1 {
    var drinkAutomate: Automate? = Automate(owner1, [])
    owner1.automatDrink = drinkAutomate
    drinkAutomate = nil
}
print(owner1)

var one = 1
var two = 2
var three = 3

let a1 = {[one, two, three] in
    one + two + three
}
print(a1())

one = 3
two = 1
three = 7

print(a1())
print(one)

class Test1 {
    struct Test2 {
        var number: Int?
    }
    var d: Test2?
}

var g1: Test1? = Test1()

print(g1?.d?.number)
