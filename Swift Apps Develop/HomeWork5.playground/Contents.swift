import UIKit
//--------------Задание 1-----------
//1. Создать структуру пирожного. У пирожного должно быть название, стоимость и вкус (например, клубничное, малиновое, черничное). Название должно быть вычисляемым свойством и возвращать вкус + “cake”, например, “strawberry cake”. Вкус должен быть уровня internal, а стоимость private. Написать инициализатор, в котором будет устанавливаться вкус и стоимость.
//2. Написать в структуре пирожного функцию, которая позволяет получить стоимость.
//3& Написать в структуре пирожного функцию, которая позволяет изменить стоимость, исходя из полученной скидки. Если полученная скидка меньше или равна 30%, то установить новую стоимость за вычетом скидки, в противном случае не изменять стоимость и вывести сообщение, что скидка должна быть меньше или равна 30%.

//--------------Задание 2-----------
//1. Сделать вкус в структуре пирожного перечислением.
//2. Добавить возможность украсить пирожное. Для этого нужно создать перечисление с возможными видами украшения. Добавить в пирожное свойство, в котором будет хранится вариант украшения. Не забыть проинициализировать его.
//3. Сделать так, чтобы можно было использовать сразу несколько украшений.

enum Taste: String {
    case lemon
    case strawberry
    case chokolate
}

enum CakeDecoration {
    case Cream
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

var lemonCake = Cake(cost: 10.5, taste: .chokolate, decoration: [.Cream, .nuts])
print(lemonCake?.name)// после добавления опционалного инициализатора, xcode попросил тут добавить ? - примерно понял почему, но хочу чтобы понять наверняка
lemonCake?.getCost() //тут тоже самое

