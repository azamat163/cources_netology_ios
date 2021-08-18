import UIKit

// Задача № 1

//Абстракция - представить объект с минимальным набором полей и методом
protocol Flying {
    func fly(from: String, to: String)
}

protocol Carrier {
    func load()
    func unload()
    func refuel()
}

class Airplane: Flying, Carrier {
    func fly(from: String, to: String) {}
    func load() {}
    func unload() {}
    func refuel() {}
}

//  Airplane достаточно иметь три метода: летать, заправляться, загрузка и разгрузка грузом


// Инкапсуляция - позволяет объединить данные и методы и в классе скрыть детали реализации

protocol Base {
    func openRequest()
}

class Service: Base {
    private let baseUrl: String = "https://google.com"
    
    private func request() {
        print(baseUrl)
    }
    
    func openRequest() {
        print(baseUrl)
    }
}

let service = Service()
//service.request() // будет ошибка так как у нас функция request закрыта от внешного мира модификатором private
service.openRequest() // а тут все ок, так как функция открыта для внешнего мира


// Наследование

class Table {
    var length: Int
    var width: Int
    var height: Int
    
    init(length: Int, width: Int, height: Int) {
        self.length = length
        self.width = width
        self.height = height
    }
    
    func square() -> Int {
        return self.length * self.width * self.height
    }
    
    func makePrint() -> String {
        "обычный стол"
    }
}

class KitchenTable: Table {
    override func makePrint() -> String {
        "кухонный стол"
    }
}

let table = Table(length: 10, width: 10, height: 10)
print(table.square())
print(table.makePrint())
let kitchenTable = KitchenTable(length: 12, width: 12, height: 12)
print(kitchenTable.square())
print(kitchenTable.makePrint())

// Наследование позволяет переиспользовать код из родительского класса свойства и метода, а так с помощью override можно переопредлить любое метод. Как напримере выше, мы переопределили с помощью override makePrint


// Полиморфизм

protocol PublicBroadcast {
    func broadcast()
}


class Tv: PublicBroadcast {
    func broadcast() {
        "tv вещает"
    }
}

class Radio: PublicBroadcast {
    func broadcast() {
        "радио вещает"
    }
}

class Player:  PublicBroadcast {
    func broadcast() {
        "плеер вещает"
    }
}

// Можем видеть, что все классы используют протокол PublicBroadcast и реализуют метод broadcast из этого вытекает первое опрелеление полиморфизма


protocol Device {}

class Phone: Device {}

class AppleWatch: Device {}

class MacBook: Device {}

class Message {
    func send(device: Device) {
        switch device {
        case is Phone:
            "посылаем, сообщение с телефона"
        case is AppleWatch:
            "посылаем, сообщение с эппл часов"
        case is MacBook:
            "посылаем, сообщение с макбука"
        default:
            "посылаем, сообщение с прочего девайса"
        }
    }
}

// Другой тип полиморфизма - когда мы с какого типа уст-во было направлено сообщение.


// Задача 2

/*
Пример 1
классом может быть Player (проигрыватель)
объект let player = Player() эта конструкция как раз создает объект из класса Player (экземпляр класса)
свойства объектов - может выступать url, который мы будем воспроизводить, например радиостанцию
методом - может быть play (воспроизведение станции(url)), forward (след станция), previons (предыд станция)
*/

/*
 Пример 2
 классом может быть User (пользователь)
 объект let user = User(age: 22, name: "Vasya") эта конструкция как раз создает объект из класса User (экземпляр класса)
 свойства объектов - может выступать age, name, который мы инициализации классе задавать
 методом - может быть move, died, say (идти, умереть, говорить)
 */
