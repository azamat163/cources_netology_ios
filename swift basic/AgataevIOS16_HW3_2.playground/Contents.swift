import UIKit

// Задача №1

//Создайте кортеж с тремя параметрами: ваш любимый фильм, ваше любимое число и ваше любимое блюдо. Все элементы кортежа должны быть именованы
var oneFriendInfo: (film: String, number: Int, food: String) = (film: "Inception", number: 2, food: "pasta")

//Одним выражением запишите каждый элемент кортежа в три константы
let (film, number, food) =  oneFriendInfo

// Создайте второй кортеж, аналогичный первому по параметрам, но описывающий другого человека (с другими значениями)
var secondFriendInfo: (film: String, number: Int, food: String) = (film: "Seven pounds", number: 10, food: "pizza")

// обмен значениями с помощью доп кортежа
var temp: (film: String, number: Int, food: String) = oneFriendInfo
oneFriendInfo = secondFriendInfo
secondFriendInfo = temp
print(oneFriendInfo)
print(secondFriendInfo)

//Создайте новый кортеж, элементами которого будут любимое число из первого кортежа, любимое число из второго кортежа и разница любимых чисел первого и второго кортежей.
var favoriteNumbers: (first: Int, second: Int, third: Int) = (first: 0, second: 0, third: 0)
favoriteNumbers.first = oneFriendInfo.number
favoriteNumbers.second = secondFriendInfo.number
favoriteNumbers.third = oneFriendInfo.number - secondFriendInfo.number
print(favoriteNumbers)


// Задача №2
let subjects: [String: Int] = ["Математика": 4, "Русский язык": 5, "Информатика": 5]
let diaries: [String: [String: Int]] = ["Иванов": subjects]

// Задача №З

// создали typealias
typealias Chessman = [String: (alpha:Character, num: Int)?]

// создали переменную chessmans и добавили 3 элемента, один из которых задан
var chessmans: Chessman = ["пешка": ("A", 5), "конь": nil, "ферзь": nil]

func checkCoord(_ str: String) -> String {
    if let info = chessmans[str] as? (alpha:Character, num: Int) {
        return "\(str) имеет следующие координаты \(info.alpha)\(info.num)"
    } else {
        return "\(str) отсутствует на координатном поле"
    }
}

print(checkCoord("пешка"))



// Задача 4
for (key, value) in chessmans {
    if let info = value {
        print("\(key) имеет следующие координаты \(info.alpha)\(info.num)")
    } else {
        print("\(key) отсутствует на координатном поле")
    }
}
