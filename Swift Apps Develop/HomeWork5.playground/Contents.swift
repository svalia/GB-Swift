import UIKit

//1. Создать структуру пирожного. У пирожного должно быть название, стоимость и вкус (например, клубничное, малиновое, черничное). Название должно быть вычисляемым свойством и возвращать вкус + “cake”, например, “strawberry cake”. Вкус должен быть уровня internal, а стоимость private. Написать инициализатор, в котором будет устанавливаться вкус и стоимость.
//2. Написать в структуре пирожного функцию, которая позволяет получить стоимость.
//3& Написать в структуре пирожного функцию, которая позволяет изменить стоимость, исходя из полученной скидки. Если полученная скидка меньше или равна 30%, то установить новую стоимость за вычетом скидки, в противном случае не изменять стоимость и вывести сообщение, что скидка должна быть меньше или равна 30%.
struct Cake {
    private var cost: Double
    internal var taste: String
    var name: String {
        get {
            taste + " Cake"
        }
        set (newTaste) {
            "Cake" + newTaste
        }
    }
    
    init(cost: Double, taste: String) {
        self.cost = cost
        self.taste = taste
        
    }
    mutating func getCost () -> Double {
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

var lemonCake = Cake(cost: 10.5, taste: "Lemon")
print(lemonCake.name)
lemonCake.getCost()
