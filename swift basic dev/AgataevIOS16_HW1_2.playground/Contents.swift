import UIKit

//Задача №1

//enum
enum DaysOfWeek: Int {
    //перечисление
    case monday = 1
    case tuesday = 2
    case wednesday = 3
    case thursday = 4
    case friday = 5
    case saturday = 6
    case sunday = 7
    
    // метод распечатывает день недели
    func description() -> String {
        switch self {
        case .monday:
            return "Monday"
        case .tuesday:
            return "Tuesday"
        case .wednesday:
            return "Wednesday"
        case .thursday:
            return "Thursday"
        case .friday:
            return "Friday"
        case .saturday:
            return "Saturday"
        case .sunday:
            return "Sunday"
        }
    }
}

let day = DaysOfWeek(rawValue: 2)
day?.description()

//struct
struct Form {
    // свойства анкеты
    var lastName: String
    var firstName: String
    var middleName: String
    var age: Int
    var isMale: Bool
    var city: String
    
    // метод структуры
    func describe() {
        print("My names is \(firstName). I'm \(age). I live in \(city)")
    }
}

let form = Form(lastName: "Ivanov", firstName: "Ivan", middleName: "Ivanovich", age: 16, isMale: true, city: "Moscow")
form.describe()

// class
enum Grade {
    case junior
    case middle
    case senior
}

class Pilot {
    var name: String
    private(set) var amountOfPlaque: Int = 0
    private(set) var grade: Grade = .junior
    
    init(name: String) {
        self.name = name
    }
    
    func learn() {
        self.amountOfPlaque += 3
    }
    
    func improve() {
        switch self.amountOfPlaque {
        case 5...10:
            self.grade = .middle
        case 10...:
            self.grade = .senior
        default:
            self.grade = .junior
        }
    }
}

var pilot = Pilot(name: "Vasya")
pilot.learn()
pilot.learn()
pilot.improve()
print("\(pilot.name) have \(pilot.grade)")


//protocol

struct User : Equatable {
    var firstName: String
    var age: Int
    
    static func ==(lhs: User, rhs: User) -> Bool {
        return lhs.firstName == rhs.firstName && lhs.age == rhs.age
    }
}

let user1 = User(firstName: "Vasya", age: 10)
let user2 = User(firstName: "Vasya", age: 10)
print(user1 == user2)


//Задача №2

/*
 Пример композиции
 
 Например у нас есть класс велосипед и внутри класса велосипеда инициализируется класс рама
 
 И это является композицией так как никто больше не имеет доступа к классу рама, кроме велосипеда и соответственно, если мы уничтожим класс велосипед, то и уничтожим ссылку на класс рама
 */

/*
 Пример агрегации
 Например у нас также есть класс велосипед, но рама инициализируется в другом месте, но не в велосипеде. Класс велосипед имеет только ссылку на класс рама
 
 И это является агрегацией так как при уничтожении класса велосипед останется ссылка на класс рама и соот-но это слабая ссылка и нужно быть осторожным при использовании агрегации и следить за этим
 */
