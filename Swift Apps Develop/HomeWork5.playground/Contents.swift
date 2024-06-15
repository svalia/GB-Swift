import UIKit
//--------------Задание 1-----------
//1. Создать структуру пирожного. У пирожного должно быть название, стоимость и вкус (например, клубничное, малиновое, черничное). Название должно быть вычисляемым свойством и возвращать вкус + “cake”, например, “strawberry cake”. Вкус должен быть уровня internal, а стоимость private. Написать инициализатор, в котором будет устанавливаться вкус и стоимость.
//2. Написать в структуре пирожного функцию, которая позволяет получить стоимость.
//3& Написать в структуре пирожного функцию, которая позволяет изменить стоимость, исходя из полученной скидки. Если полученная скидка меньше или равна 30%, то установить новую стоимость за вычетом скидки, в противном случае не изменять стоимость и вывести сообщение, что скидка должна быть меньше или равна 30%.

//--------------Задание 2-----------
//1. Сделать вкус в структуре пирожного перечислением.
//2. Добавить возможность украсить пирожное. Для этого нужно создать перечисление с возможными видами украшения. Добавить в пирожное свойство, в котором будет хранится вариант украшения. Не забыть проинициализировать его.
//3. Сделать так, чтобы можно было использовать сразу несколько украшений.

//--------------Задание 3-----------
//70 строка - Создать класс коробки для пирожных, назовем просто Box. В нем должно быть свойство с массивом пирожных и это свойство должно быть приватным. Задать массив пирожных в инициализаторе.
//75 строка - Добавить в класс функцию по добавлению нового пирожного в массив
//78 строка - Добавить функцию по получению всех пирожных в коробке
//83 строка - Создать перечисление для баннера рекламы. На баннере можно будет показывать или целое, или строку или дробное число. Для каждого кейса должно быть ассоциативное значение, соответствующее тому, что может отобразить баннер. Написать функцию, которая на вход принимает баннер рекламы (перечисление), а возвращает то, что на баннере написано (то есть ассоциативное значение для кейса)
//--------------Задание 4-----------
//104 и 107 строка - Создать два класса наследника для коробки с пирожными. Стандартная коробка и корзинка.
//105 строка - Сделать так, чтобы в классе стандартной коробки в функции добавления пирожного не только добавлялось пирожное. но и выводилось в консоль само пирожное.

enum Taste: String {
    case lemon
    case strawberry
    case chokolate
}

enum CakeDecoration {
    case cream
    case fruitSlices
    case icing
    case nuts
    case powderedSugar
    
}

struct Cake {
    private var cost: Double
    var taste: Taste
    var decoration: [CakeDecoration]
    var name: String {
        get {
            taste.rawValue + " Cake"
        }
        set (newTaste) {
            "Cake" + newTaste
        }
    }
    
    init?(cost: Double, taste: Taste, decoration: [CakeDecoration]?) {
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
    mutating func setCost (discount:Int) -> Double {
        //    <= 30 cost - discount
        //    else == discount && "Скидка должна быть не более 30%"
        guard discount <= 30 else {
            print("Скидка не может быть больше 30%")
            return cost
        }
        var newCost = Int(cost) * (1 - (discount/100))
        cost = Double(newCost)
        return cost
    }
}

class Box<T> {
    private var things: [T?]
    init(things: [T?]) {
        things ?? nil
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

class Basket: Box<Flower> {
//    var bouquetOfFlowers: [Flower] = []
}
var box1 = Box<Cake>(things: [])
var cake1 = Cake(cost: 10, taste: .chokolate, decoration: [.cream, .nuts])
if let cake1 {
    box1.addNewThing(newThing: cake1)
}

box1.addNewThing(newThing: cake1!)

func optionalString(a:String?) -> String {
    a ?? "" // если а строка - вернется строка, а если а это nil врентся "" (пустая строка)
}

struct Flower {
    var name: NameFlower
    var costOfFlower: Double
    enum NameFlower: String {
        case rose
        case lily
        case daisy
    }
    
}
var threeFlowers = [Flower(name: .daisy, costOfFlower: 5), Flower(name: .rose, costOfFlower: 10), Flower(name: .lily, costOfFlower: 15)]
var flowersBasket = Basket(things: threeFlowers)
print(flowersBasket.getAllThingsInBox())

var anyCakes = [Cake(cost: 10, taste: .chokolate, decoration: [.nuts])]

print(type(of: anyCakes))
var simpleBox = StandartBox(things: anyCakes)
                                                                          





