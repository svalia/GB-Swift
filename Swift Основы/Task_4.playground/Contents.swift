import UIKit

//Задание
//Создать перечисление с видами пиццы (хотя бы 4 - 5 кейсов)
//Создать структуру пиццы, она должна содержать стоимость, вид пиццы, толстое или тонкое тесто и добавки (например, дополнительно добавить пепперони, помидоры, сыр). Вид пиццы должен быть вложенным типом для структуры пиццы. Подсказка: добавки лучше также сделать перечислением.
//Создать класс пиццерии, добавить массив с возможными пиццами. Переменная с массивом должна быть приватной. Массив задается в инициализаторе.
//Написать в классе пиццерии функции для добавления новой пиццы и для получения всех доступных пицц.
//Создать экземпляр класса пиццерии и добавить в него несколько пицц.

// Перечисление видов пиццы
enum PizzaType: String {
    case margherita, pepperoni, seafood, vegetarian, fourCheese
}

// Перечисление возможных добавок
enum Topping: String {
    case extraCheese, pepperoni, tomatoes, olives, mushrooms
}

// Структура, описывающая пиццу
struct Pizza {
    var cost: Double
    var type: PizzaType
    var thickCrust: Bool
    var toppings: [Topping]
}

// Класс пиццерии
class Pizzeria {
    private var availablePizzas: [Pizza]

    init(pizzas: [Pizza]) {
        self.availablePizzas = pizzas
    }

    // Функция для добавления новой пиццы в меню
    func addPizza(_ pizza: Pizza) {
        availablePizzas.append(pizza)
    }

    // Функция для получения всех доступных пицц
    func getAllPizzas() -> [Pizza] {
        return availablePizzas
    }
}

// Создаем экземпляр пиццерии с некоторыми начальными пиццами
let myPizzeria = Pizzeria(pizzas: [
    Pizza(cost: 8.99, type: .margherita, thickCrust: true, toppings: [.extraCheese]),
    Pizza(cost: 10.50, type: .pepperoni, thickCrust: false, toppings: [.pepperoni, .mushrooms])
])

// Добавляем новую пиццу в меню
myPizzeria.addPizza(Pizza(cost: 12.75, type: .seafood, thickCrust: true, toppings: [.olives, .extraCheese]))

// Получаем и выводим информацию о всех доступных пиццах
let allPizzas = myPizzeria.getAllPizzas()
for pizza in allPizzas {
    print("\(pizza.type.rawValue): Cost \(pizza.cost), Crust \(pizza.thickCrust ? "Thick" : "Thin"), Toppings: \(pizza.toppings.map { $0.rawValue }.joined(separator: ", "))")
}
