import UIKit
//В рамках прошлого дз был создан класс пиццерии с переменной, в которой хранится пицца, удалите ее. Необходимо создать структуру картошки фри, в которой будет стоимость и размер картошки и сделать так, чтобы в классе пиццерии была одна переменная, в которую можно было бы класть и пиццу, и картошку фри.
//Добавьте в класс пиццерии функцию, которая будет добавлять новую позицию в меню.
//Создайте протокол, в котором будут содержаться функции открытия и закрытия.
//Написать расширение для класса пиццерии, в котором будет реализован протокол из пункта 3.
import UIKit

// Перечисление видов пиццы
enum PizzaType: String {
    case margherita, pepperoni, seafood, vegetarian, fourCheese
}

// Перечисление возможных добавок
enum Topping: String {
    case extraCheese, pepperoni, tomatoes, olives, mushrooms
}

// Структура, описывающая пиццу
struct Pizza: MenuItem {
    var cost: Double
    var type: PizzaType
    var thickCrust: Bool
    var toppings: [Topping]
}

// Класс пиццерии
class Pizzeria {
    private var menu: [MenuItem] = []

    func addMenuItem(_ item: MenuItem) {
        menu.append(item)
    }

    func getMenuItems() -> [MenuItem] {
        return menu
    }
}

// Общий протокол для элементов меню
protocol MenuItem {
    var cost: Double { get }
}

// Реализация протокола OpeningHours в классе Pizzeria
extension Pizzeria: OpeningHours {
    func open() {
        print("Pizzeria is now open!")
    }

    func close() {
        print("Pizzeria is now closed.")
    }
}

// Протокол для управления временем работы
protocol OpeningHours {
    func open()
    func close()
}

// Структура для картошки фри, соответствующая протоколу MenuItem
struct FrenchFries: MenuItem {
    var cost: Double
    var size: String
}

// Создаем экземпляр пиццерии
let myPizzeria = Pizzeria()
myPizzeria.addMenuItem(Pizza(cost: 8.99, type: .margherita, thickCrust: true, toppings: [.extraCheese]))
myPizzeria.addMenuItem(FrenchFries(cost: 2.99, size: "Large"))

//--------------Следующее задание--------------------------

// Написать функцию, в которой происходит вычитание одного числа из другого.
// Функция должна работать и с Int, и с Double.
// Функция должна возвращать результат вычитания.

func subtract<T: Numeric>(_ number1: T, _ number2: T) -> T {
    return number1 - number2
}

// Примеры использования функции
let intResult = subtract(10, 3)     // Результат для Int
let doubleResult = subtract(10.0, 3.0) // Результат для Double

print(intResult)    // Вывод: 7
print(doubleResult) // Вывод: 7.0
