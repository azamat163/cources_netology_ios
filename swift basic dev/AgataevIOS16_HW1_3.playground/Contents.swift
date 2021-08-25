import UIKit

// Задача № 1


protocol Pilotbly {
    var name: String { get set }
    func learn()
}


class Pilot : Pilotbly {
    enum Grade {
        case junior
        case middle
        case senior
    }
    var name: String
    private(set) var amountOfPlaque: Int
    private(set) var grade: Grade = .junior
    
    init(name: String, amountOfPlaque: Int = 0) {
        self.name = name
        self.amountOfPlaque = amountOfPlaque
    }
    
    func learn() -> Void {
        sumPlaque()
        improve()
    }
    
    private func improve() -> Void {
        switch self.amountOfPlaque {
        case 5...10:
            self.grade = .middle
        case 10...:
            self.grade = .senior
        default:
            self.grade = .junior
        }
    }
    
    private func sumPlaque() -> Void {
        self.amountOfPlaque += 3
    }
}

var pilot = Pilot(name: "Vasya", amountOfPlaque: 20)
pilot.name = "Petya"
pilot.learn()
pilot.learn()
print("\(pilot.name) have \(pilot.grade)")

/*

 Класс Pilot публичный доступ и каждый может создать экземпляр класса
 
 
 Свойство name - публичный доступ и каждый может его задать и получить
 
 Свойство amountOfPlaque - приватный доступ и каждый для пилота может задать кол-во налетов при инициализации класса, но его нельзя просто так поменять и закрыто на сеттить этого значения
 
 Свойство grade - приватный доступ и закрыт только для сеттинга значения извне, чтение доступно любому юзеру
 
 Метод learn - публичный метод открыт для внешнего вызова с целью обучения пилотов
 
 Метод improve - приватный метод и закрыт для вызова извне с целью чтобы не могли прокачать пилотов (аналогичная функция sumPlaque)
 */


// Задача №2

class Json {
    
    func pprint() {
        print("Without parameters")
    }
    
    func pprint(text: String) {
        print("With text: \(text)")
    }
    
    func pprint(number: Int) {
        print("With number: \(number)")
    }
}

let json = Json()
json.pprint()
json.pprint(number: 12)
json.pprint(text: "text")


// Задача №3

class Tree {
    func getTree() {
        print("tree")
    }
}

class Node: Tree {
    override func getTree() {
        super.getTree()
    }
}


let node = Node()
node.getTree()
