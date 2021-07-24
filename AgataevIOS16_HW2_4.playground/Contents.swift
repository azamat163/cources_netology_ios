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


let oneString: String = "3d34234sdfs"
let twoString: String = "20"
let threeString: String = "12"
let fourString: String = "ta"
let fiveString: String = "30"

var sum: Int = 0

// optional binding



if let temp1 = Int(oneString), let temp2 = Int(twoString), let temp3 = Int(threeString), let temp4 = Int(fourString), let temp5 = Int(fiveString) {
    sum = temp1 + temp2 + temp3 + temp4 + temp5
    print(sum)
} else {
   print(sum)
}

// unwrap operator
sum = Int(oneString)! + Int(twoString)! + Int(threeString)! + Int(fourString)! + Int(fiveString)!
// возникнет ошибка, так как те константы, которые содержат в себе буквы при конвертации будут равны nil, а используя ! оператора мы как раз принудительно извлекаем значение


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
