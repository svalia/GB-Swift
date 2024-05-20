import UIKit

//Создать структуру работника пиццерии. В ней должны быть такие свойства, как имя, зарплата и должность. Должностей пока может быть две: или кассир, или повар. Добавить в класс пиццерии массив с работниками
//Создать класс столика, в нем должны быть свойство, в котором содержится количество мест и функция, которая на вход принимает количество гостей, которое хотят посадить, а возвращает true, если места хватает и false, если места не хватает. Изначальное количество мест задается в инициализаторе
//Добавить в класс пиццерии свойство, в котором хранится массив столиков. У класса столика добавить свойство, в котором хранится пиццерия, в которой стоит столик. Столики создаются сразу в инициализаторе, не передаются туда в качестве параметра

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

// Структура работника пиццерии
struct Employee {
    var name: String
    var salary: Double
    var position: Position
    
    enum Position: String {
        case cashier, cook
    }
}

// Класс столика
class Table {
    var seats: Int
    weak var pizzeria: Pizzeria?
    
    init(seats: Int, pizzeria: Pizzeria) {
        self.seats = seats
        self.pizzeria = pizzeria
    }
    
    func canSeatGuests(numberOfGuests: Int) -> Bool {
        return numberOfGuests <= seats
    }
}

// Класс пиццерии
class Pizzeria {
    private var menu: [MenuItem] = []
    var employees: [Employee] = []
    var tables: [Table] = []
    
    init(numberOfTables: Int, seatsPerTable: Int) {
        for _ in 0..<numberOfTables {
            tables.append(Table(seats: seatsPerTable, pizzeria: self))
        }
    }
    
    func addMenuItem(_ item: MenuItem) {
        menu.append(item)
    }

    func getMenuItems() -> [MenuItem] {
        return menu
    }
    
    func addEmployee(_ employee: Employee) {
        employees.append(employee)
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
let myPizzeria = Pizzeria(numberOfTables: 10, seatsPerTable: 4)
myPizzeria.addMenuItem(Pizza(cost: 8.99, type: .margherita, thickCrust: true, toppings: [.extraCheese]))
myPizzeria.addMenuItem(FrenchFries(cost: 2.99, size: "Large"))

// Добавляем работников
myPizzeria.addEmployee(Employee(name: "John", salary: 2500, position: .cashier))
myPizzeria.addEmployee(Employee(name: "Maria", salary: 2700, position: .cook))

// Проверка столика
if let table = myPizzeria.tables.first {
    print(table.canSeatGuests(numberOfGuests: 3)) // true
    print(table.canSeatGuests(numberOfGuests: 5)) // false
}
