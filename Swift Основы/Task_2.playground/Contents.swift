import UIKit

//Написать функцию, которая на вход принимает число: сумма, которую пользователь хочет положить на вклад, следующий аргумент это годовой процент, третий аргумент это срок Функция возвращает сколько денег получит пользователь по итогу.

func calculateFinalAmount(sum: Double, annualPercentage: Double, termYears: Int) -> Double {
    let interest = sum * (annualPercentage / 100) * Double(termYears)
    let finalAmount = sum + interest
    return finalAmount
}

calculateFinalAmount(sum: 4.6, annualPercentage: 1.0, termYears: 6)


//Создать перечисление, которое содержит 3 вида пиццы и создать переменные с каждым видом пиццы.
//Добавить возможность получения названия пиццы через rawValue
enum Pizza: String {
    case margherita = "Маргарита"
    case pepperoni = "Пепперони"
    case fourCheese = "Четыре сыра"
}

// Создание переменных для каждого вида пиццы
let margheritaPizza = Pizza.margherita
let pepperoniPizza = Pizza.pepperoni
let fourCheesePizza = Pizza.fourCheese

// Получение названия каждой пиццы через rawValue
print("Название пиццы: \(margheritaPizza.rawValue)") // Выведет: Маргарита
print("Название пиццы: \(pepperoniPizza.rawValue)") // Выведет: Пепперони
print("Название пиццы: \(fourCheesePizza.rawValue)") // Выведет: Четыре сыра
