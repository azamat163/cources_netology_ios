import UIKit

// Задача №1

/*
 Часть 1
 Для начала нужно описать машину минимальным набором параметров, используя протокол.
 */

// MARK: - protocol Car
protocol Car {
    // MARK: - объявляем свойства для протокола Car
    var model: String { get }
    var color: String { get }
    var buildDate: String { get }
    var price: Int { get set }
    var accessories: [String] { get set }
    var isServiced: Bool {get set}
}

/*
 Часть 2
 По аналогии с протоколом 'Car', нужно описать дилерский центр минимальным набором свойств и методов, используя протокол.
 */

// MARK: - protocol Dealership
protocol Dealership {
    // MARK: - объявляем свойства для протокола Dealership
    var name: String { get }
    var showroomCapacity: Int { get }
    var stockCars: [Car] { get set }
    var showroomCars: [Car] { get set }
    var cars: [Car] { get set}
    
    // MARK: - объявляем методы для протокола Dealership
    func offerAccesories(_ accessories: [String]) -> [String]
    func presaleService(_ car: inout Car) -> Car
    func addToShowroom(_ car: inout Car) throws -> Void
    func sellCar(_ car: inout Car) -> Car
    func orderCar() -> Void
}


// MARK: - extension Dealership, в котором опреледеляем дефолтные методы
extension Dealership {
    func isSameCar(lhs: Car, rhs: Car) -> Bool {
        return lhs.model == rhs.model &&
            lhs.color == rhs.color &&
            lhs.buildDate == rhs.buildDate &&
            lhs.price == rhs.price &&
            lhs.accessories == rhs.accessories &&
            lhs.isServiced == rhs.isServiced
    }

    
    func offerAccesories(_ accessories: [String]) -> [String] {
        print("Вы хотите дополнительное оборудование \(accessories.joined(separator: ", "))")
        return accessories
    }
    
    func presaleService(_ car: inout Car) -> Car {
        print("Машину \(car.model) отправляем на предпродажную подготовку")
        car.isServiced = true
        return car
    }
}


/*
 Часть 3
 */
// MARK: - protocol SpecialOffer
protocol SpecialOffer {
    mutating func addEmergencyPack()
    mutating func makeSpecialOffer() throws
}

// MARK: - enum Error
enum CarError: Error {
    case carNotMatchStock
    case carExistInShowroom
    case carLimitShowroom
}


// MARK: - struct cars: bmw, honda, audi, lexus, volvo реализуем по протоколу Car
struct BmwCar: Car, Equatable {
    var model: String
    var color: String
    var buildDate: String
    var price: Int
    var accessories: [String]
    var isServiced: Bool
}

extension BmwCar: SpecialOffer {
    mutating func addEmergencyPack() {
        let accessories = ["огнетушитель", "аптечка"]
        self.accessories += accessories
        print("Машина \(self.model) года \(self.buildDate) имеет доп оборудование \(accessories.joined(separator: ", "))")
    }

    mutating func makeSpecialOffer() throws {
        let currentDate = "2021"
        guard Int(self.buildDate)! < Int(currentDate)! else {
            throw CarError.carNotMatchStock
        }
        self.price -= self.price / 100 * 15
        print("Машина \(self.model) года \(self.buildDate) получает скидку 15%, старая цена: \(self.price)")
        self.addEmergencyPack()
    }
}

struct HondaCar: Car, Equatable {
    var model: String
    var color: String
    var buildDate: String
    var price: Int
    var accessories: [String]
    var isServiced: Bool
}

extension HondaCar: SpecialOffer {
    mutating func addEmergencyPack() {
        let accessories = ["огнетушитель", "аптечка"]
        self.accessories += accessories
        print("Машина \(self.model) года \(self.buildDate) имеет доп оборудование \(accessories.joined(separator: ", "))")
    }

    mutating func makeSpecialOffer() throws {
        let currentDate = "2021"
        guard Int(self.buildDate)! < Int(currentDate)! else {
            throw CarError.carNotMatchStock
        }
        self.price -= self.price / 100 * 15
        print("Машина \(self.model) года \(self.buildDate) получает скидку 15%, старая цена: \(self.price)")
        self.addEmergencyPack()
    }
}

struct AudiCar: Car, Equatable {
    var model: String
    var color: String
    var buildDate: String
    var price: Int
    var accessories: [String]
    var isServiced: Bool
}

extension AudiCar: SpecialOffer {
    mutating func addEmergencyPack() {
        let accessories = ["огнетушитель", "аптечка"]
        self.accessories += accessories
        print("Машина \(self.model) года \(self.buildDate) имеет доп оборудование \(accessories.joined(separator: ", "))")
    }

    mutating func makeSpecialOffer() throws {
        let currentDate = "2021"
        guard Int(self.buildDate)! < Int(currentDate)! else {
            throw CarError.carNotMatchStock
        }
        self.price -= self.price / 100 * 15
        print("Машина \(self.model) года \(self.buildDate) получает скидку 15%, старая цена: \(self.price)")
        self.addEmergencyPack()
    }
}

struct LexusCar: Car, Equatable {
    var model: String
    var color: String
    var buildDate: String
    var price: Int
    var accessories: [String]
    var isServiced: Bool
}

struct VolvoCar: Car, Equatable {
    var model: String
    var color: String
    var buildDate: String
    var price: Int
    var accessories: [String]
    var isServiced: Bool
}


// MARK: - create class dealerships: bmw, honda, audi, lexus, volvo

class BaseDealership: Dealership {
    var name: String
    var showroomCapacity: Int
    var stockCars: [Car]
    var showroomCars: [Car]
    var cars: [Car] {
        get {
            return self.stockCars + self.showroomCars
        }
        
        set {
            self.cars = newValue
        }
    }
    
    init(name: String, showroomCapacity: Int, stockCars: [Car], showroomCars: [Car]) {
        self.name = name
        self.showroomCapacity = showroomCapacity
        self.stockCars = stockCars
        self.showroomCars = showroomCars
    }
    
    func orderCar() {
        print("Заказываем новую машину из завода")
    }
    
    func addToShowroom(_ car: inout Car) throws {
        guard showroomCars.count < showroomCapacity else {
            throw CarError.carLimitShowroom
        }
        
        guard !showroomCars.contains(where: { isSameCar(lhs: $0, rhs: car) }) else {
            throw CarError.carExistInShowroom
        }
        
        var index: Int = 0
        for i in 0..<stockCars.count where isSameCar(lhs: stockCars[i], rhs: car) {
            index = i
            break
        }
        print("Удаляем машину \(car.model) из парковки склада автосалона \(name)")
        stockCars.remove(at: index)
        print("Перегоняем машину \(car.model) в автосалон \(name)")
        print(showroomCars.count)
        showroomCars.append(car)
    }
    
    func sellCar(_ car: inout Car) -> Car {
        var saleCar = presaleService(&car)
        if saleCar.accessories.isEmpty {
            saleCar.accessories = offerAccesories(["тонировка", "сигнализация", "спортивные диски"])
        }
        print("Продаем машину \(saleCar.model) из салона \(self.name)")
        var index: Int = 0
        for i in 0..<showroomCars.count where isSameCar(lhs: showroomCars[i], rhs: car) {
            index = i
            break
        }
        showroomCars.remove(at: index)
        return saleCar
    }
    
    func addToShowroomForSpecialOffer() -> Void {
        let currentDate = "2021"
        var stockSpecialCars: [Car] = []
        for i in 0..<stockCars.count {
            let car = stockCars[i]
            if Int(car.buildDate)! < Int(currentDate)! {
                stockSpecialCars.append(car)
            }
        }
        
        for i in 0..<stockSpecialCars.count {
            var car = stockSpecialCars[i]
            do {
                try addToShowroom(&car)
            } catch CarError.carLimitShowroom {
                print("Автосалон \(self.name) имеет лимит на \(self.showroomCapacity) машин!")
            } catch CarError.carExistInShowroom {
                print("В автосалоне \(self.name) уже имеется машина \(car.model) года \(car.buildDate) со скидкой")
            } catch {
                print("Неизвестная ошибка \(error)")
            }
        }
    }
}

class Bmw: BaseDealership {
    override func orderCar() {
        print("Заказываем новую машину из завода")
        let newCar = BmwCar(model: "BMW", color: "white", buildDate: "2021", price: 0, accessories: [], isServiced: false )
        stockCars.append(newCar)
    }
    
    func checkCarsSpecialOffer() {
        for i in 0..<self.cars.count {
            var car = self.cars[i] as! BmwCar
            do {
                try car.makeSpecialOffer()
            } catch CarError.carNotMatchStock {
                print("Машина \(self.cars[i].model) года \(self.cars[i].buildDate) не соответствует требованиям акции")
            } catch {
                print("Неожиданная ошибка")
            }
        }
    }
}

class Honda: BaseDealership {
    override func orderCar() {
        print("Заказываем новую машину из завода")
        let newCar = HondaCar(model: "Honda", color: "white", buildDate: "2021", price: 0, accessories: [], isServiced: false )
        stockCars.append(newCar)
    }
    
    func checkCarsSpecialOffer() {
        for i in 0..<self.cars.count {
            var car = self.cars[i] as! HondaCar
            do {
                try car.makeSpecialOffer()
            } catch CarError.carNotMatchStock {
                print("Машина \(self.cars[i].model) года \(self.cars[i].buildDate) не соответствует требованиям акции")
            } catch {
                print("Неожиданная ошибка")
            }
        }
    }
}

class Audi: BaseDealership  {
    override func orderCar() {
        print("Заказываем новую машину из завода")
        let newCar = AudiCar(model: "Audi", color: "white", buildDate: "2021", price: 0, accessories: [], isServiced: false )
        print("из завода добавляем новую \(newCar.model) на парковку склада \(self.name)")
        stockCars.append(newCar)
    }
    
    func checkCarsSpecialOffer() {
        for i in 0..<self.cars.count {
            var car = self.cars[i] as! AudiCar
            do {
                try car.makeSpecialOffer()
            } catch CarError.carNotMatchStock {
                print("Машина \(self.cars[i].model) года \(self.cars[i].buildDate) не соответствует требованиям акции")
            } catch {
                print("Неожиданная ошибка")
            }
        }
    }
}

class Lexus: BaseDealership {
    override func orderCar() {
        print("Заказываем новую машину из завода")
        let newCar = LexusCar(model: "Lexus", color: "white", buildDate: "2021", price: 0, accessories: [], isServiced: false )
        print("из завода добавляем новую \(newCar.model) на парковку склада \(self.name)")
        stockCars.append(newCar)
    }
}

class Volvo: BaseDealership {
    override func orderCar() {
        print("Заказываем новую машину из завода")
        let newCar = VolvoCar(model: "Volvo", color: "white", buildDate: "2021", price: 0, accessories: [], isServiced: false )
        print("из завода добавляем новую \(newCar.model) на парковку склада \(self.name)")
        stockCars.append(newCar)
    }
}

// MARK: - create instance bmw cars
var firstBmw320dCar = BmwCar(model: "320d", color: "yellow", buildDate: "2019", price: 3200000, accessories: ["спортивные диски"], isServiced: false)
var secondBmw320dCar = BmwCar(model: "320d", color: "yellow", buildDate: "2017", price: 1834000, accessories: ["спортивные диски"], isServiced: true)
var thirdBmw320dCar = BmwCar(model: "320d", color: "yellow", buildDate: "2016", price: 23400000, accessories: ["спортивные диски"], isServiced: false)
var fourthBmw320dCar = BmwCar(model: "320d", color: "yellow", buildDate: "2018", price: 450000, accessories: ["зимнее колесо"], isServiced: true)
var fifthBmw320dCar = BmwCar(model: "320d", color: "yellow", buildDate: "2021", price: 450000, accessories: [], isServiced: false)
var sixthBmw320dCar = BmwCar(model: "320d", color: "yellow", buildDate: "2019", price: 455500, accessories: [], isServiced: false)

// MARK: - create instance bmw dealership
var bmw = Bmw(
    name: "БМВ",
    showroomCapacity: 100,
    stockCars: [firstBmw320dCar, secondBmw320dCar, thirdBmw320dCar, fourthBmw320dCar, sixthBmw320dCar],
    showroomCars: [fifthBmw320dCar, sixthBmw320dCar]
)

// MARK: - create instance honda cars
var firstCrvCar = HondaCar(model: "cr-v", color: "black", buildDate: "2015", price: 1900000, accessories: ["спортивные диски"], isServiced: true)
var secondCrvCar = HondaCar(model: "cr-v", color: "green", buildDate: "2017", price: 1900000, accessories: ["спортивные диски"], isServiced: true)
var thirdCrvCar = HondaCar(model: "cr-v", color: "yellow", buildDate: "2016", price: 34000, accessories: ["спортивные диски"], isServiced: true)
var fourthCrvCar = HondaCar(model: "cr-v", color: "blue", buildDate: "2018", price: 3430000, accessories: ["спортивные диски"], isServiced: true)
var fifthCrvCar = HondaCar(model: "cr-v", color: "white", buildDate: "2017", price: 3330000, accessories: ["спортивные диски"], isServiced: true)
var sixthCrvCar = HondaCar(model: "cr-v", color: "black", buildDate: "2020", price: 13430000, accessories: ["спортивные диски"], isServiced: true)


// MARK: - create instance honda dealership
var honda = Honda(
    name: "ХОНДА",
    showroomCapacity: 19,
    stockCars: [firstCrvCar, secondCrvCar, thirdCrvCar, fifthCrvCar],
    showroomCars: [fourthCrvCar, fifthCrvCar, sixthCrvCar]
)


// MARK: - create instance honda cars
var firstAudiQ7Car = AudiCar(model: "Q-7", color: "blue", buildDate: "2021", price: 7000000, accessories: ["тонировка", "спортивные диски"], isServiced: true)
var secondAudiQ7Car = AudiCar(model: "Q-7", color: "blue", buildDate: "2020", price: 7000000, accessories: ["тонировка", "спортивные диски"], isServiced: true)
var thirdAudiQ7Car = AudiCar(model: "Q-7", color: "blue", buildDate: "2019", price: 7000000, accessories: ["тонировка", "спортивные диски"], isServiced: true)
var fourthAudiQ7Car = AudiCar(model: "Q-7", color: "blue", buildDate: "2018", price: 7000000, accessories: ["тонировка", "спортивные диски"], isServiced: true)
var fifthAudiQ7Car = AudiCar(model: "Q-7", color: "blue", buildDate: "2017", price: 7000000, accessories: ["тонировка", "спортивные диски"], isServiced: true)

// MARK: - create instance audi dealership
var audi = Audi(
    name: "АУДИ",
    showroomCapacity: 6,
    stockCars: [firstAudiQ7Car, secondAudiQ7Car, fifthAudiQ7Car],
    showroomCars: [thirdAudiQ7Car, fourthAudiQ7Car, fifthAudiQ7Car]
)
audi.orderCar()

// MARK: - create instance lexus cars
var firstLexusCar = LexusCar(model: "Lexus RX", color: "green", buildDate: "2021", price: 9000000, accessories: ["тонировка", "спортивные диски"], isServiced: false)
var secondLexusCar = LexusCar(model: "Lexus RX", color: "green", buildDate: "2020", price: 9000000, accessories: ["тонировка", "спортивные диски"], isServiced: false)
var thirdLexusCar = LexusCar(model: "Lexus RX", color: "green", buildDate: "2019", price: 9000000, accessories: ["тонировка", "спортивные диски"], isServiced: false)
var fourthLexusCar = LexusCar(model: "Lexus RX", color: "green", buildDate: "2018", price: 9000000, accessories: ["тонировка", "спортивные диски"], isServiced: false)

// MARK: - create instance lexus dealership
var lexus = Lexus(
    name: "Лексус",
    showroomCapacity: 10,
    stockCars: [firstLexusCar],
    showroomCars: [secondLexusCar, thirdLexusCar, fourthLexusCar]
)


// MARK: - create instance volvo cars
var firstVolvoCar = VolvoCar(model: "xc 60", color: "black", buildDate: "2021", price: 3000000, accessories: ["тонировка"], isServiced: true)
var secondVolvoCar = VolvoCar(model: "xc 60", color: "black", buildDate: "2020", price: 3000000, accessories: ["тонировка"], isServiced: true)
var thirdVolvoCar = VolvoCar(model: "xc 60", color: "black", buildDate: "2019", price: 3000000, accessories: ["тонировка"], isServiced: true)
var fourthVolvoCar = VolvoCar(model: "xc 60", color: "black", buildDate: "2018", price: 3000000, accessories: ["тонировка"], isServiced: true)

// MARK: - create instance volvo dealership
var volvo = Volvo(
    name: "Вольво",
    showroomCapacity: 8,
    stockCars: [firstVolvoCar, secondVolvoCar],
    showroomCars: [thirdVolvoCar, fourthVolvoCar]
)


var arrayDealerships: [Dealership] = []
arrayDealerships.append(bmw)
arrayDealerships.append(honda)
arrayDealerships.append(audi)
arrayDealerships.append(lexus)
arrayDealerships.append(volvo)

for item in arrayDealerships {
    switch item {
    case is Bmw:
        print("slogan bmw")
    case is Honda:
        print("slogan honda")
    case is Audi:
        print("slogan audi")
    case is Lexus:
        print("slogan lexus")
    case is Volvo:
        print("slogan volvo")
    default:
        print("slogan else")
    }
}


/*
 Часть 4
 Работа с расширениями. Нам нужно добавить спецпредложение для "прошлогодних" машин.
 */
bmw.checkCarsSpecialOffer()
bmw.addToShowroomForSpecialOffer()
honda.checkCarsSpecialOffer()
honda.addToShowroomForSpecialOffer()
audi.checkCarsSpecialOffer()
audi.addToShowroomForSpecialOffer()




/// Обработка  ошибок

///Задача №1

bmw.checkCarsSpecialOffer()
honda.checkCarsSpecialOffer()
audi.checkCarsSpecialOffer()


/// Задача №2
bmw.addToShowroomForSpecialOffer()
honda.addToShowroomForSpecialOffer()
audi.addToShowroomForSpecialOffer()
