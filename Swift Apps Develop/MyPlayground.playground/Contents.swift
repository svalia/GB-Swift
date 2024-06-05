import UIKit
import Foundation
func multiPlay (a: Int, b: Int, c: Int) -> Int {
    a*b*c
}
func stringFunc (a1: String = "", b1: String) {
    print(a1+b1)
}

stringFunc(b1: "Hello")
stringFunc(a1: "Hi, ", b1: "Bro!")

func stringFunc1 (_ a1: String = "", who b1: String) { // при вызове обязательно исп ярлык и без указания параметра в первом параметре
    print(a1+b1)
}

stringFunc1("Hi! ", who: "Bro!")

func stringFunc (a1: Int = 4, b1: Int) {
    print(a1+b1)
}

func stringFunc (a1: Int = 4) {
    print(a1)
}

//Написать три функции, каждая из них на вход получает два числа, функции ничего не возвращают. Задача у функций также одна: если сумма чисел больше 50 И второе число больше 20, то вывести в консоль сумму чисел, в противном случае их разницу. Первая функция должна решать задачу при помощи if/else, вторая при помощи guard, третья при помощи тернарного оператора.

func ifElse (a: Int, b: Int) {
    if a+b > 50 && b > 20 {
        print(a+b)
    }
    else {
        print(a-b)
    }
}

ifElse(a: 21, b: 31)

func guardFunc (a: Int, b: Int) {
    guard a+b > 50 && b > 20 else {
        print(a-b)//ложь
        return
    }
    print(a+b)//правда
}

guardFunc(a: 19, b: 18)

func tern (a: Int, b: Int) {
//    a+b > 50 && b > 20 ? print(a+b) : print(a-b)
    print(a+b > 50 && b > 20 ? a + b : a - b)
}

//Написать три функции, каждая из них принимает на вход целое число и возвращает целое число. Задача у функций одна: если переданное число четное, то вернуть это число, увеличенное в 3 раза, в противном случае, вернуть число, увеличенное на три. Первая функция должна решать задачу при помощи if/else, вторая при помощи guard, третья при помощи тернарного оператора.

func check (a: Int) -> Int {
    if a % 2 == 0 {
        return a*3
    }
    else {
        return a+3
    }
}

func my (a: Int) -> Int {
    guard a % 2 == 0 else {
        return a+3
    }
    return a*3
}

func funct (a: Int) -> Int {
    a % 2 == 0 ? a*3 : a + 3
}

//Написать функцию, которая на вход принимает три целых числа. Функция ничего не возвращает. Задача функции: если сумма чисел в диапазоне до 100, включая 100, то вывести сумму чисел, если в диапазоне от 101 до 200, не включая 200, то напечатать результат перемножения этих чисел, если в диапазоне от 200 и выше, то вывести в консоль “Hello!”, во всех остальных случаях вывести первое число.

func valia (a: Int, b: Int, c: Int) {
    switch a+b+c {
    case ...100 : print(a+b+c)
    case 101..<200 : print(a*b*c)
    case 200... : print("Hello")
    default : print(a)
    }
}

func multiPlay (a: Double, b: Double) -> Int {
    Int(round(a*b))
}

func quatro (a: Double, b: Double, c: Double) -> (Double?, Double?) {
    let determ = b * b - 4 * a * c
    if determ > 0 {
        let x1 = (-b - sqrt(determ))/(2 * a)
        let x2 = (-b + sqrt(determ))/(2 * a)
        return (x1, x2)
    }
    else if determ == 0 {
        let x1 = (-b - sqrt(determ))/(2 * a)
        return (x1, nil)
    }
    else {
        return(nil, nil)
    }
}

//Создайте массив [5, 10, 15, 20, 25]. Добавьте в него число “- 30”. Удалите 3 элемент по счету (число 15). Выведите в консоль массив. Выведите в консоль количество элементов.

var a = [5, 10, 15, 20, 25]
a.append(-30)
a.remove(at: 2)
print(a)
print(a.count)

//Создайте два множества: [1, 2, 3] и [4, 3, 2, 1]. Если второе множества является супермножеством для первого множества, то напечатайте в консоль количество элементов первого множества, в противном случае напечатайте в консоль количество элементов второго множества.
var b: Set<Int> = [1, 2, 3]
var c: Set<Int> = [4, 3, 2, 1]

if c.isSuperset(of: b) {
    print(b.count)
}
else {
    print(c.count)
}

print(c.isSuperset(of: b) ? b.count : c.count)

//Создайте словарь: [1: “first”, 2: “second”, 3: “third”]. Добавьте в словарь элемент с ключом 4 и значением fourth. Выведите в консоль все ключи словаря. Выведите в консоль все значения словаря.
var dict: [Int : String] = [1: "first", 2: "second", 3: "third"]
let f = dict.updateValue("fourth", forKey: 4)// в f вернется nil
let h = dict.updateValue("fourth", forKey: 2)// в f вернется second (значение которое было до измнения)
dict[4] = "fourth"
print(dict.keys)
print(dict.values)

//Создайте массив [1, 2, 3, 3, 5, 6, 7, 5, 1, 8, -9]. Создайте константу. В ней должны хранится все значения массива, но не должно быть повторений.

var g = [1, 2, 3, 3, 5, 6, 7, 5, 1, 8, -9]
let g1 = Array(Set(g))
print(g1)

//Напишите функцию. На вход функция должна принимать два массива. Функция должна выводить в консоль первый элемент первого массива и последний элемент второго. Если оба массива пусты необходимо вернуть true, во всех остальных случаях false.

func one (a: [Int], b: [Int]) -> Bool {
    print(a.first)
    print(b.last)
    return a.isEmpty && b.isEmpty
}

//Создать функцию, которая на вход получает словарь, у которого ключ это строка, а значение - дробное число. Если количество ключей в словаре больше 5, то функция должна вернуть true, в противном случае false

func two (a:[String:Double]) -> Bool {
    a.keys.count > 5
}

func three (_ a:[String]) -> Bool {
    a.count % 2 == 0
}

func four (_ a: [Character]) -> Bool {
    a.count != 5
}

//Создать функцию, которая на вход принимает два массива, состоящие из целых чисел,, а возвращает один массив, который состоит из первого и второго, то есть представляет собой объединение двух массивов.

func five (a:inout [Int], b:[Int]) -> [Int] {
    var c = a
    c.append(contentsOf: b)
    return c
}

//Написать функцию, которая на вход получает целое число и массив целых чисел. Если число есть в массиве, то возвращает этот массив, а если нет - nil


func myFunc (number: Int, array: [Int]) -> [Int]? {
    array.contains(number) ? array : nil
}

func one (number: Int, array: [Int]) -> [Int]? {
    if array.contains(number) {
        return array
    }
    else {
        return nil
    }
}

func two (number: Int, array: [Int]) -> [Int]? {
    guard array.contains(number) else {
        return nil
    }
    return array
}

//Напишите 2 функции, обе на вход принимают строку, которая является опционалом. Задача у функций одна: если в строке больше 5 символов или есть “h”, то выведите строку в консоль. Во всех остальных случая ничего не делайте. Первая функция должна распаковывать опционал при помощи if ler, а вторая при помощи guard let.

func three (a: String?) {
    if let a {
        if a.count > 5 || a.contains("h") {
            print(a)
        }
    }
}

func four (a: String?) {
    guard let a else {
        return
    }
    if a.count > 5 || a.contains("h") {
        print(a)
    }
}

//Напишите функцию, которая на вход принимает два целых числа и оба являются опционалами. Если числа существуют - выведите в консоль результат их сложения, во всех остальных случаях ничего не делайте.

func five (a: Int?, b: Int?) {
    if let a, let b, b > 5 {
        print(a+b)
    }
}
func six (a: Int?, b: Int?) {
    guard let a, let b, b > 5 else {
       return
    }
    print(a+b)
}

func seven (a: [Int]?) -> [Int] {
    if let a {
        return a
    }
    else {
        return [1, 2, 3]
    }
}

func eleven (a: [Int]?) -> [Int] {
    guard let a else {
        return [1, 2, 3]
    }
        return a
}

func twelve (a: [Int]?) -> [Int] {
    a ?? [1, 2, 3]
}

//Написать функцию, которая на вход принимает кортеж из трех строк. Функция должна возвращать кортеж из первой и последней строки.

func cort (a: (String, String, String)) -> (String, String) {
    (a.0, a.2)
}


//Напишем функцию, которая на вход принимает два целых числа, а возвращает эти же два числа, но каждое увеличено в два раза.

func cort2 (a: (Int, Int)) -> (Int, Int) {
    (a.0 * 2, a.1 * 2)
}

func cort3 (a: (Int?, Int?)) -> (Int, Int) {
    if let b1 = a.0, let b2 = a.1 {
      return (b1 * 2, b2 * 2)
    }
    return (0, 0)
}

func cort4 (a: (Int?, Int?)) -> (Int, Int) {
    guard let b1 = a.0, let b2 = a.1 else {
        return (0, 0)
    }
    return (b1 * 2, b2 * 2)
    
}

func cort5 (a: (Int?, Int?)) -> (Int, Int) {
    ((a.0 ?? 0) * 2, (a.1 ?? 0) * 2)
}

func cort6 (a: (String?, String?, String?)?) -> String {
    if let a, let b = a.0, let b1 = a.1, let b2 = a.2 {
        return b + b1 + b2
    }
    else {
        return ""
    }
}

func cort7 (a: (String?, String?, String?)?) -> String {
    guard let a, let b = a.0, let b1 = a.1, let b2 = a.2 else {
        return ""
    }
    return b + b1 + b2
}

func cort8 (a: (String?, String?, String?)?) -> String {
    guard let a else {
        return ""
    }
    return (a.0 ?? "") +  (a.1 ?? "") + (a.2 ?? "")
    
}


//создать две переменные. Одна это целое число, равное - 7, а вторая пустой массив. Необходимо пока первое число не станет равно 7 добавлять в массив это число.

var a3: Int = -7
var b3: [Int] = []

while a3 != 7 {
    b3.append(a3)
    a3 += 1
}

//Создать две переменные. Первая это целое число, равное 0, вторая это пустой массив. Пока первая переменная не станет равна 10, если первая переменная четная, то добавить в массив первую переменную, увеличенную в два раза, в противном случае, добавить в массив первую переменную, уменьшенную на 3.

var a4: Int = 0
var b4: [Int] = []

while a4 != 10 {
    b4.append(a4 % 2 == 0 ? (a4 * 2) : (a4 - 3))
    a4 += 1
}

//создать переменную, равную 0 и переменную, в который будет хранится словарь, где ключ строка, а значение целое число. Необходимо добавлять в словарь новый элемент, где ключ - первая переменная в виде строки, а значение - сама первая переменная. Добавлять новый элемент в словарь необходимо, пока первая переменная меньше 0.

var a5: Int = 0
var b5: [String:Int] = [:]

repeat {
    b5.updateValue(a5, forKey: String(a5))
    a5 += 1
}
while a5 < 0
        
while a5 < 0 {
    b5.updateValue(a5, forKey: String(a5))
    a5 += 1
}

//десять раз вывести в консоль “Hello!”

for _ in 1...10 {
    print("Hello")
}

//вывести в консоль 10 раз “Hello”, но в конце должен быть номер итерации, то есть сначала “Hello 0”, затем должно вывестись “Hello 1”, а затем “Hello 2”.

for i in 0...9 {
    print("Hello \(i)")
}

//Создать массив целых чисел от 0 до 100.
var a7: [Int] = []
for i in 0...100 {
    a7.append(i)
}

//создать массив состоящий из целых чисел от 1 до 100. Пройтись по массиву при помощи цикла for _ in, если текущий элемент меньше 30, то вывести его в консоль.
var a8 = Array(1...100)

//for i in a8 {
//    print(i < 30 ? i : "")
//}

for i in a8 {
    if i < 30 {
        print(i)
    }
}
for i in a8 where i < 30 {
    print(i)
}


//Далее задача: создать три переменные. Первые две это целые числа, равные 0, а третья это массив от 100 до 200, не включая 200. Далее необходимо пройтись по массиву и, если сумма первых двух переменных меньше 50, то увеличить первую переменную на три, а вторую на 10.

var a9 = 0
var b9 = 0
var c9 = Array(100..<200)
for i in c9 where a9 + b9 < 50 {
    a9 += 3
    b9 += 9
}


//теперь у нас в цикле не только должны увеличиваться first и second, но и печатать элемент и его индекс.

var a10 = 0
var b10 = 0
var c10 = Array(100..<200)
for (index, i) in c10.enumerated() where a10 + b10 < 50 {
    a10 += 3
    b10 += 9
    print(i)
    print(index)
}

//Создадим словарь и в цикле выведем ключ и значение каждого элемента.
var fourth = ["first": 1, "second": 2, "third": 3]

for i in fourth {
    print(i.key + String(i.value))
}

for (key, value) in fourth {
    print (key + String(value))
}

func dict1 (a: [String:Int]) -> Int {
    var sum = 0
    for (key, value) in a {
        sum += value
    }
    return sum
}
//Создать массив, состоящий из целых чисел от 3 до 10, включая 10, пока количество элемент не будет равно 3 - удалять последний элемент.
var b11 = Array(3...10)

while b11.count != 3 {
    b11.removeLast()
}
