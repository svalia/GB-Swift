import UIKit

enum Coffee {
    case latte
    case cappuchino
    case espresso
}

func getCost (coffee: Coffee) -> Int {
    switch coffee {
    case .latte: return 150
    case .cappuchino: return 200
    case Coffee.espresso: return 300
    }
}

print(getCost(coffee: .cappuchino))
print(getCost(coffee: .latte))
print(getCost(coffee: Coffee.espresso))

enum Coffee2: String {
    case latte = "Latte"
    case cappuccino = "Cappuccino"
    case espresso = "Espresso"
}

func getName (coffee: Coffee2) -> String {
    coffee.rawValue
}



print(getName(coffee: .latte)) // выведет в консоль "Latte" 
print(getName(coffee: .cappuccino)) // выведет в консоль "Cappuccino"
print(getName(coffee: .espresso)) // выведет в консоль "Espresso"
print(type(of: Coffee2.latte))

var a: Int? = 5
print(type(of: a))
if a! > 5 {
a! *= 2 } else {
a = nil }

var k = 0
for num in 0...3 {
    k += 1
    print(k)
}
