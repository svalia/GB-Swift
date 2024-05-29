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

