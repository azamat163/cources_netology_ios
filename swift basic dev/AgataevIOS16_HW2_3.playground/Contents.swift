import UIKit

// Задача №1

// замыкание как typealias
typealias ClosureType = (Double, Double) -> Double

// функция первого замыкания (передача параметра в метод)
func actualCalculateflight(weight: Double, distance: Double, completion: ClosureType) -> Void {
    // вызов первого замыкания
    print("Вызов первого замыкания")
    completion(weight, distance)
}

// функция первого замыкания (передача параметра в метод)
func expectedCalculateflight(weight: Double, distance: Double, completion: ClosureType) -> Void {
    // вызов второго замыкания
    print("Вызов второго замыкания")
    completion(weight, distance)
}

func printActualResult(weight: Double, distance: Double) -> Void {
    print("Определение первого замыкания")
    actualCalculateflight(weight: weight, distance: distance) { weight, distance -> Double in
        let coef: Double = 12200000.34
        return (weight * distance) / coef
    }
}

func printExpectedResult(weight: Double, distance: Double) -> Void {
    print("Определение второго замыкания")
    expectedCalculateflight(weight: weight, distance: distance) { weight, distance -> Double in
        let coef: Double = 12200000.30
        return (weight * distance) / coef
    }
}
print("--------------------ПОЛНАЯ ЗАПИСЬ--------------------------")
printActualResult(weight: 1.3434, distance: 234234234.34)
printExpectedResult(weight: 2.3434, distance: 234234234.34)
print("-----------------------------------------------------------")

// Задача №2

// сокращенная запись первого замыкания
func printShortActualResult(weight: Double, distance: Double) -> Void {
    print("Определение первого замыкания")
    let coef: Double = 12200000.34
    actualCalculateflight(weight: weight, distance: distance) { ($0 * $1) / coef }
}

// сокращенная запись второго замыкания
func printShortExpectedResult(weight: Double, distance: Double) -> Void {
    print("Определение второго замыкания")
    let coef: Double = 12200000.30
    expectedCalculateflight(weight: weight, distance: distance) { ($0 * $1) / coef }
}
print("--------------------СОКРАЩЕННАЯ ЗАПИСЬ------------------------")
printActualResult(weight: 1.9, distance: 234234234.34)
printExpectedResult(weight: 3.434, distance: 234234234.34)
print("--------------------------------------------------------------")


// Задача №3
func example(param: () -> Void) {
    // вызов замыкания
    param()
}

let weight = 1.2323
let distance = 34343434.34
    
example() {
    // вызов первой функции
    actualCalculateflight(weight: weight, distance: distance) {
        (weight, distance) -> Double in
            print("Задание 3")
            print("Вызов первой функции")
            return weight * distance
        
    }
}

// Когда нам нужно передать выражение замыкании функции в кач-ве последнего аргумента функции и само выражение длинное, то его представить в виде последующего замыкания. Последующее замыкание - замыкание, которое записано в виде замыкающего выражения вне (и после) круглых скобок вызова функции, даже несмотря на то, что оно все еще является аргументом функции. Когда вы используете синтаксис последующего замыкания, то вы не должны писать ярлык аргумента замыкания в качестве части вызова самой функции. Вот поэтому param нет



