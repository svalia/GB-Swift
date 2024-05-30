import UIKit

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
