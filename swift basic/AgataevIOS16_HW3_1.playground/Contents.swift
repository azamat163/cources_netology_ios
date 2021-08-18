import UIKit

// Задача 1

let boys: [String] = ["Ivan", "Petya"]
let girls: [String] = ["Maria", "Lena", "Alena"]
var students = [String]()
students = girls
//var temps = [String]()
//temps = boys

for i in 0..<boys.count { // проходится по массиву boys по каждому индексу
    students.insert(boys[i], at: i) // с помощью insert вставляем на начало в students при этом происходит смещение остальных данных
}

print(students)

// Задача 2
students.sort(by: <) // сортируем с использованием sort() изменяет текущий массив
print(students)


// Задача 3

let ratings: [Int] = [-5, 4, 3, -6, -10, 5, 6]
let sortedRatings = ratings.sorted() // сортируем с sorted() при этом не изменяет массив raings
let filterSortedRaings = sortedRatings.filter({$0 > 0}) // фильтруем оценки > 0
print(filterSortedRaings)

// Задача 4
var array: [Int] = [1, 2, 3, 4, 7, 8, 15]
let sum = 6
var oneIndex: Int = 0
var secondIndex: Int = 0

// первый вариант решение тупо через вложенный цикл со смещением
for i in 0..<array.count {
    for j in i+1..<array.count {
        if array[i] + array[j] == sum {
            oneIndex = i
            secondIndex = j
            break
        }
        if array[i] + array[j] != sum {
            continue
        }
    }
}

print("Первый вариант: первый индекс = \(oneIndex), второй индекс = \(secondIndex)")


// второй вариант через enumarated, но принцип такой же
for (i, prev) in array.enumerated() {
    for next in array[i+1..<array.count] {
        if prev + next == sum {
            oneIndex = i
            secondIndex = array.firstIndex(of: next)!
            break
        }
        if prev + next != sum {
            continue
        }
    }
}

print("Второй вариант: первый индекс = \(oneIndex), второй индекс = \(secondIndex)")

