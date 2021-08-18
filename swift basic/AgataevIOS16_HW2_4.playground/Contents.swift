import UIKit

// Задача №1
var a: String?
var b: String?
var c: String?

a = "test1"
b = "test2"
c = nil

print("\(a ?? "default")")
print("\(b ?? "default")")
print("\(c ?? "default")")

c = "test3"

print("\(c ?? "default")")
// Разница есть так как, сейчас у нас переменнас с не nil и следовательно в nil-coalescing будет выводится именна она, а впервом случае с = nil и принтился дефолт


let oneString: String = "3"
let twoString: String = "20"
let threeString: String = "12"
let fourString: String = "10"
let fiveString: String = "30"

// optional binding
var sum1: Int = 0
if let temp1 = Int(oneString), let temp2 = Int(twoString), let temp3 = Int(threeString), let temp4 = Int(fourString), let temp5 = Int(fiveString) {
    sum1 = temp1 + temp2 + temp3 + temp4 + temp5
    print(sum1)
} else {
   print(sum1)
}

// unwrap operator
var sum2: Int = 0
if Int(oneString) != nil {
    sum2 += Int(oneString)!
}

if Int(twoString) != nil {
    sum2 += Int(twoString)!
}

if Int(threeString) != nil {
    sum2 += Int(threeString)!
}

if Int(fourString) != nil {
    sum2 += Int(fourString)!
}

if Int(fiveString) != nil {
    sum2 += Int(fiveString)!
}

print(sum2)
// c oператором ! нужно работать осторожно именно убедится, что переменная не nil и только в таком случае принудительно извлекать значение


//Задача 2
let temperature: Optional<Int> = Int("-25")

if let temp = temperature {
    if temp > 0 && temp <= 10 {
        print("Больше нуля")
    } else if temp < 0 && temp >= -10 {
        print("Меньше нуля")
    } else if temp < -10 {
        print("Меньше -10 градусов")
    } else if temp > 10 {
        print("Больше 10 градусов")
    }
} else {
    print("Нет значения")
}
