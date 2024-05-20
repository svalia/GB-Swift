import UIKit
var s: Array<Int>
var s1: [Int]

var a: [Int] = [5, 6, 7]
print(a)
a.append(5)
print(a)
a.insert(4, at: 1)
print(a)
a.removeAll()
a = [1, 3, 5, 10, 5]
a.removeFirst()//удаляет первый элемент массива
a.removeLast()//удаляет последний эжлемент массива
//removeLast и remooveFirst возвращают удаляемый элемент, поэтому это можно использовать след образом (при этом элементы из массива будут удалены)
a = [1, 3, 5, 10, 5]
let b = a.removeFirst()// b = 1
let c = a.removeLast()// c = 5

a = [1, 3, -5, 10, 5, -10, 5]
a.removeFirst(2)//удаляет первый элемент массива
print(a)
a.removeLast(3)//удаляет последний эжлемент массива
print("\(a)" + "👍")

print(a.last)// будет выведено Optional(10), опционал чтобы защититься от кейса когда массив пустой
print(a.first)// будет выведено Optional(5)
print(a)
print(a[0])
print(a[1])
a = [1, 3, -5, 10, 5, -10, 5]
print(a.min())
print(a.max())
print(a.count)
print(a.isEmpty)
a.removeAll()
print(a.isEmpty)

var g = [1, 3, -5, 10, 5, -10, 5]

for element in g {
    print(element)
}// должен вывести все элементы массива по очереди

var f: [String] = ["A", "B", "C"]
for (index, element) in f.enumerated() {
    print(element + " " + String(index))
}// должен вывести все индексы и элементы массива по очереди

func test(num: Int...) {
    for number in num {
        print(number)
    }
}

test (num: 1, -4, 10)
