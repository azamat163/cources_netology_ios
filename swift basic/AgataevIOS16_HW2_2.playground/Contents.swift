import UIKit

// Задача №1
var firstEmployeeSalary: Int = 55000
var secondEmployeeSalary: Int = 40000
var thirdEmployeeSalary: Int = 70000

firstEmployeeSalary *= 2
secondEmployeeSalary += 15000

let isTrueOneStatement: Bool = firstEmployeeSalary > thirdEmployeeSalary
let isTrueSecondStatement: Bool = secondEmployeeSalary < firstEmployeeSalary
let isTrueThirdStatement: Bool = (firstEmployeeSalary > secondEmployeeSalary) || (thirdEmployeeSalary < secondEmployeeSalary)
let isTrueFourthStatement: Bool = (thirdEmployeeSalary < firstEmployeeSalary) && (secondEmployeeSalary > firstEmployeeSalary)


if isTrueOneStatement {
    print("Зарплата первого больше зарплаты третьего = \(isTrueOneStatement)")
}

if isTrueSecondStatement {
    print("Зарплата второго меньше зарплаты первого = \(isTrueSecondStatement)")
}

if isTrueThirdStatement {
    print("Зарплата третьего меньше зарплаты первого И Зарплата второго больше зарплаты первого = \(isTrueThirdStatement)")
}

if isTrueFourthStatement {
    print("Зарплата третьего меньше зарплаты первого И Зарплата второго больше зарплаты первого = \(isTrueFourthStatement)")
}

// Задача №2
let a: Int = 30
let b: Int = 500
let c: Int = 1

let d = b*b - 4*a*c

if d > 0 {
    print("график скорее всего продолжит направление")
} else if d < 0 {
    print("график скорее всего поменяет направление")
} else {
    print("неопределенная ситуация — нужно ждать")
}

d == 0 ? print("неопределенная ситуация — нужно ждать") : (d > 0 ? print("график скорее всего продолжит направление") : print("график скорее всего поменяет направление"))

switch d {
case let x where x > 0:
    print("график скорее всего продолжит направление")
case let x where x < 0:
    print("график скорее всего поменяет направление")
default:
    print("неопределенная ситуация — нужно ждать")
}

//Задача 3

let isMale: Bool = true
let age: Int = 80

switch (isMale, age) {
case (false, 3...17):
    print("Детский контент для девочек")
case (true, 3...17):
    print("Детский контент для мальчиков")
case (true, 18...65):
    print("Взрослый контент для мужчин")
case (false, 18...65):
    print("Взрослый контент для женщин")
case (false, 66...):
    print("Контент для женщин пожилого возраста")
case (true, 66...):
    print("Контент для мужчин пожилого возраста")
default:
    print("Нет подходящего контента")
}
