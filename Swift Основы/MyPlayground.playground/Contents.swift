import UIKit

enum Seasons: String {
    case winter = "Winter"
    case spring = "Spring"
    case summer = "Summer"
    case autumn = "Autumn"
}
func getName (season: Seasons) -> String {
    season.rawValue
}
print("Welcome \(getName(season: .winter))!")
//func printSeason (season: Seasons) {
//    
//    print("Welcome \(season)!")
//}
//
//printSeason(season: .autumn)

//Задача: Создайте перечисление Measurement с случаями weight, distance, volume, каждый из которых должен содержать ассоциативное значение типа Double. Напишите функцию convertMeasurement(value: Measurement), которая принимает значение Measurement и возвращает преобразованное значение в другую систему измерения (например, килограммы в фунты, километры в мили, литры в галлоны).
enum Measurement {
    case weight(Double)
    case distance(Double)
    case volume(Double)
}

func convertMeasurement(type: Measurement) -> Int {
    switch type {
    case .weight(let value): return Int(value)
    case .distance(let value): return Int(value)
    case .volume(let value): return Int(value)
    }
}
print(convertMeasurement(type: .weight(3.4)))
print(convertMeasurement(type: .distance(6.4)))
print(convertMeasurement(type: .volume(3.7)))

var c = Array<Int>(repeating: 4, count: 3)
print(c)
c.append(5)
print(c)
c.append(contentsOf: [4, 5, 6])
print(c)
c.insert(1, at: 0)
print(c)
print(c[7])

var a0 = [5, -4, 10]
for element in a0 {
    print(element)
}

var a = ["A", "B", "C"]
for (index, element) in a.enumerated() { 
print(element + " " + String(index))
}

func test(num: Int...) {
    for number in num {
        print(num)
    }
}
print(test(num: 1, -4, 10))

//Создать пустое множество можно несколькими способами
var a2: Set<Int> = []
var b = Set<Int>()

//🔥 В отличие от массива, во множестве элементы не могут повторяться



//Также можно создать множество, которое уже будет хранить элементы
 var a3: Set<Int> = [5, 6, 10]

//При помощи вывода типов компилятор может сам вычислить тип множества, тем не менее, указать, что переменная является именно множеством (Set) нужно обязательно, в противном случае переменная будет массивом
var a4: Set = [5, 4, 6, 8, 10]
print(type(of: a)) // Set<Int>


var a5: Set = [5, 4, 6, 8, 10]
a4.insert(7)
a4.insert(9)
print(a4)

let test2 = { (k2: Int) -> String in
    let a = String(k2 * 7)
    print(a)
    return a
}
var j = test2(9)
print(type(of: j))

var a6: [Int] = [10, 4, 8]
a6.forEach { print($0) }
