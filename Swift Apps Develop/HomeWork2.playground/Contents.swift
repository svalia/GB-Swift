import UIKit


//_______НАСТЯ, ПРИВЕТ! ДОМАШКА НА ПОНЕДЕЛЬНИК НА 76 СТРОКЕ

//Создать функцию, которая на вход принимает множество, состоящее из целых чисел, если множество не пустое, то необходимо вывести в консоль количество элементов в множестве.

func setIsEmpty (a: Set<Int>) {
    a.isEmpty ? print() : print(a.count)
}

setIsEmpty(a: [1, 2, 4, 7])
setIsEmpty(a: [])

//Написать функцию, которая на вход принимает три массива и возвращает общее количество элементов по всем трем массивам

func threeArray (a: [Int], b: [Int], c: [Int]) -> Int {
    return a.count + b.count + c.count
}
threeArray(a: [1, 2, 3], b: [1, 4], c: [2])

//Написать функцию, которая на вход принимает два массива строк и печатает результат сложение третьей по счету строки в каждом массиве. Если строки под нужным индексом нет или не хватает элементов в массиве вывести в консоль, что нельзя получить строку

func twoStringArrays (a: [String], b: [String]) {
    if (a.count < 2 || b.count < 2) || (a[2].isEmpty || b[2].isEmpty) {
        print("Нельзя получить строку")
    }
    else {
        print("\(a[2]) + \(b[2])")
    }
}

twoStringArrays(a: ["stringA1", "stringA2", "stringA3"], b: ["stringB1", "stringB2", "stringB3"])

//Написать функцию, которая на вход получает словарь и возвращает все ключи словаря
func dictionary (a: [String : Int]) -> [String]{
    Array(a.keys)
}

dictionary(a: ["one": 1, "two": 2])


//Написать 4 функции. Каждая принимает на вход массив целых чиесл. Задача у функций одна: если количество элементов больше 5, то вывести первый элемент массива, в противном случае - последний. Первая решает при помощи if/else, вторая при помощи guard, третья при помощи тернарного оператора, четвертая при помощи switch


func printFirstOrLastElementOfArray  (a: [Int]) {
    if a.count > 5 {
        print(a.first)
    }
    else {
        print(a.last)
    }
}

func printElementOfArray  (a: [Int]) {
    guard a.count > 5 else {
       let b = a.last
        print(b)
        return
    }
    print(a.first)
}

func showFirstOrLastElementOfArray (a: [Int]) {
    print(a.count > 5 ? a.first : a.last)
}

func showElementOfArray  (a: [Int]) {
    switch a.count {
    case 6...: print(a.first)
    default: print(a.last)
    }
}


//---------02.06.2024------
//Написать функцию, которая на вход принимает три аргумента: число, строку и Bool. У первого аргумента должен быть ярлык аргумента, у второго ярлык аргумента должен быть пустой, у третьего его не должно быть вовсе. Если число есть в строке и передано true, то напечатать строку, в противном случае напечатать число.

func  printFunc (one a: Int, _ b: String, c: Bool) {
    
    var isInt = false
    for character in b {
        if character.isNumber {
            isInt = true
            break
        }
    }
    print(isInt == true && c == true ? b : "\(a)")
}
printFunc(one: 22, "sdf7", c: true)

//Написать функцию, которая на вход принимает строку, число и Bool. Все они опционалы. В функции должна вызываться функция из первого пункта, при этом функцию из первого пункта менять нельзя. Функция может быть в нескольких вариантах, если в голову придут разные.

func  myFunc (a1: Int?, _ b1: String?, c1: Bool?) {
    if let a1, let b1, let c1 {
        printFunc(one: a1, b1, c: c1)
    }
    
}
func  myFunc1 (a1: Int?, _ b1: String?, c1: Bool?) {
    guard let a1, let b1, let c1 else {
        return
    }
    printFunc(one: a1, b1, c: c1)
}

//Написать функцию, которая на вход принимает три числа, а возвращает кортеж из этих чисел.

func cortReturn (_ a: Int, _ b: Int, _ c: Int) -> (Int, Int, Int) {
    return (a, b, c)
}
cortReturn(3, 3, 4)

//Написать функцию, которая на вход принимает массив дробных чисел, а возвращает кортеж с двумя Bool. Первый Bool отвечает за количество элементов больше 5 (то есть он true, если в массиве больше 5 элементов), а второй за то, что в массиве есть число 10.

func arrayDoubleToTwoBoolTuple (a: [Double]) -> (Bool, Bool) {
    return (a.count > 5 ? true : false, a.contains(10.0) ? true : false)
}

//Создать массив целых чисел от 0 до 100.

var b = Array(1...100)
