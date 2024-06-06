import UIKit

//1. Создать массив, состоящий из целых чисел от 3 до 10, не включая 10, вывести для каждого элемента сам элемент и его индекс.

var arr = Array(3..<10)
for (index, i) in arr.enumerated()  {
    print(i)
    print(index)
}
//2. Создать пустой словарь. Добавить в него 5 элементов, начиная с 0, где ключ - текущий номер элемента в виде строки, а значение - элемент больше или равен трем (то есть или true, или false). Добавлять элементы нужно при помощи цикла. То есть у Вас в итоге должно получиться примерно следующее, естественно, порядок может быть другой: ["0": false, "1": false, "3": true, "4": true, "2": false]

var count: Int = 0
var dict: [String:Bool] = [:]
repeat {
    if count >= 3 {
        dict.updateValue(true, forKey: String(count))
        count += 1
    }
    else {
        dict.updateValue(false, forKey: String(count))
        count += 1
    }
}
while count < 6
print(dict.keys)
print(dict.values)

//3. Написать функцию, которая на вход принимает массив строк. Если в массиве находится строка, длиной менее 5 символов, то вернуть nil. В противном случае вернуть самую маленькую по длине строку.

func stringLength (a: [String]) -> String? {
    for i in 0..<a.count {//подсказал чат GPT но я не оч это понял
        if a[i].count < 5 {
            return nil
        }
    }// не понял почему цикл закрывается тут
            if let minString = a.min(by: { $0.count < $1.count }) { //подсказал чат GPT но я не оч это понял, то что внутри min() и не понял почему if let как условие исопльзуется альтернативное тому что в цикле
                return minString
            }
    return nil
}

//4. Написать функцию, которая на вход принимает массив целых чисел. В функции, пока количество элементов массива больше 5, удалять первый элемент. Функция должна вернуть новый получившийся массив. Если количество элементов в массиве изначально меньше или равно 5 - вернуть nil.

func delElement (a: [Int]) -> [Int]? {
    if a.count <= 5 {
        return nil// мы войдем в это условие и получим true, а затем вернем nil, функция вернет значение и завешится и не пойдет ниже?
    }
    
    var b = a
    repeat {
        b.removeFirst()// что такое removeFirst( _K) или как-то так
    }
    while b.count > 5
    return b
}
    
//5.  Создать массив целых чисел от 30 до 50, включая 50. Пройтись по массиву. Выполнять следующие действия нужно только если индекс текущего элемента кратен 3 (остаток от деления на три == 0). Если предыдущее условие выполняется, то, если число кратно 6, вывести это число, в противном случае, перейти к следующей итерации.
var Arr3050 = Array(30...50)
for i in Arr3050 where i % 3 == 0 {
    if i % 6 == 0 {
        print(i)
    }

}
    
//6. Создать массив целых чисел от 72 до 100, не включая 100. Пройтись по массиву. Выполнять следующие действия нужно только если индекс элемента кратен 3 (остаток от деления на три == 0). Если предыдущее условие выполняется, то, если число кратно 6, вывести это число, в противном случае, прекратить выполнение цикла.
    
var Arr7250 = Array(72..<100)
for i in Arr7250 where i % 3 == 0 {
    if i % 6 == 0 {
        print(i)
    }
    else {
        break
    }
}
//7. Написать функция, которая на вход принимает массив опционалов (именно массив опционалов, а не опциональный массив, то есть массив может быть, например, [2, 5, nil, 10, nil, -12, 50, 40, nil]). Функция должна возвращать количество опционалов в массиве.
//

func optionalArray (a: [Int?]) -> Int {
    var b = 0
    for i in a where i == nil {
        b += 1
    }
    return b
}
optionalArray(a: [2, 5, nil, 10, nil, -12, 50, 40, nil])


//Создать массив, состоящий из целых чисел от 3 до 10, не включая 10, вывести для каждого элемента сам элемент и его индекс.
var arr2 = Array(3..<10)

for (index, i) in arr2.enumerated() {
    print(i)
    print(index)
}

//Создать пустой словарь. Добавить в него 5 элементов, начиная с 0, где ключ - текущий номер элемента в виде строки, а значение - элемент больше или равен трем (то есть или true, или false). Добавлять элементы нужно при помощи цикла. То есть у Вас в итоге должно получиться примерно следующее, естественно, порядок может быть другой: ["0": false, "1": false, "3": true, "4": true, "2": false]
var dict2: [String: Bool] = [:]

for i in 0...4 {
    dict2.updateValue(i >= 3, forKey: String(i))
}

//Написать функцию, которая на вход принимает массив строк. Если в массиве находится строка, длиной менее 5 символов, то вернуть nil. В противном случае вернуть самую маленькую по длине строку. Если несколько - вернуть любую из них

func arrayString (a: [String]) -> String? {
    guard !a.isEmpty else {
        return nil
    }
    var minString = a.first ?? ""
    for i in a {
        if i.count < 5 {
            return nil
        }
        else {
            if i.count < minString.count {
                minString = i
            }
        }
    }
    return minString
}
//Написать функцию, которая на вход принимает массив целых чисел. В функции, пока количество элементов массива больше 5, удалять первый элемент. Функция должна вернуть новый получившийся массив. Если количество элементов в массиве изначально меньше или равно 5 - вернуть nil.

func arrayInt (a: [Int]) -> [Int]? {
    guard a.count > 5 else {
        return nil
    }
    var b = a
    while b.count > 5 {
        b.removeLast()
    }
    return b
}

func my (a: [Int], b: Int) -> [Int] {
    guard a.count >= b else {
        return []
    }
    var c = a
    c.removeFirst(b)
    return c
}

func my2 (a: [String]) -> [String] {
    guard !a.isEmpty else {
        return []
    }
    var b: [String] = []
    for i in a {
        if !i.isEmpty {
            b.append(i)
        }
    }
    return b
}

func my3 (_ a: [String?]?) -> [String] {
    guard let a else {
        return []
    }
    var b: [String] = []
    for i in a {
        if let i {
            b.append(i)
        }
    }
    return b
}

func my4 (label a: [String?]?) -> [Int] {
    guard let a else {
        return []
    }
    var b: [Int] = []
    for currentElement in a {
        if let currentElement, let c = Int(currentElement) {
            b.append(c)
        }
    }
    return b
}


