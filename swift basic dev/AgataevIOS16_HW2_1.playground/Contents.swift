import UIKit

// Задача №1

// Создали enum каналов
enum TelevisionChannel {
    case muztv, friday, russiatoday, rentv, tnt
}

// Базовый протокол(интерфейс), в котором описаны основные свойства и методы, в котором будут применятся в классе
protocol BaseProtocol {
    var model: String { get set }
    var isTurnOn: Bool { get set }
    var currentChannel: TelevisionChannel { get set }
    func showNowOnTv() -> String
    
}

class TelevisionOne: BaseProtocol {
    // свойства класса
    internal var model: String
    internal var isTurnOn: Bool
    internal var currentChannel: TelevisionChannel
    
    // инициализатор класса
    init(model: String, isTurnOn: Bool, currentChannel: TelevisionChannel) {
        self.model = model
        self.isTurnOn = isTurnOn
        self.currentChannel = currentChannel
    }
    
    // метод который показывает текущий канал
    internal func showNowOnTv() -> String {
        switch currentChannel {
        case .muztv:
            return "канал муз-тв"
        case .friday:
            return "канал пятница"
        case .russiatoday:
            return "канал Russia Today"
        case .rentv:
            return "канал Рен-тв"
        case .tnt:
            return "канал тнт"
        }
    }
}


let tv = TelevisionOne(model: "Samsung", isTurnOn: true, currentChannel: .muztv)
print(tv.showNowOnTv())

tv.model = "Xiami"
tv.currentChannel = .russiatoday
print(tv.showNowOnTv())



// Задача №2

// структура Настройка
struct Setting {
    let volume: Double
    let isColor: Bool
}

class TelevisionTwo: BaseProtocol {
    // свойства класса
    internal var model: String
    internal var isTurnOn: Bool
    internal var currentChannel: TelevisionChannel
    internal var setting: Setting
    
    // инициализатор класса
    init(model: String, isTurnOn: Bool, currentChannel: TelevisionChannel, setting: Setting) {
        self.model = model
        self.isTurnOn = isTurnOn
        self.currentChannel = currentChannel
        self.setting = setting
    }
    
    // метод который показывает текущий канал
    internal func showNowOnTv() -> String {
        switch currentChannel {
        case .muztv:
            return "канал муз-тв c громкостью \(self.setting.volume)"
        case .friday:
            return "канал пятница  c громкостью \(self.setting.volume)"
        case .russiatoday:
            return "канал Russia Today  c громкостью \(self.setting.volume)"
        case .rentv:
            return "канал Рен-тв  c громкостью \(self.setting.volume)"
        case .tnt:
            return "канал тнт  c громкостью \(self.setting.volume)"
        }
    }
}


let setting = Setting(volume: 0.5, isColor: true)
let tvTwo = TelevisionTwo(model: "Samsung", isTurnOn: true, currentChannel: .muztv, setting: setting)
print(tvTwo.showNowOnTv())

tvTwo.model = "Xiami"
tvTwo.currentChannel = .russiatoday
print(tvTwo.showNowOnTv())


// Задача №3


enum Channel {
    case telechannel(String)
    case port(String)
}

class TelevisionThree {
    // свойства класса
    internal var model: String
    internal var isTurnOn: Bool
    internal var channel: Channel
    
    // инициализатор класса
    init(model: String, isTurnOn: Bool, channel: Channel) {
        self.model = model
        self.isTurnOn = isTurnOn
        self.channel = channel
    }
    
    // метод который показывает текущий канал
    internal func showNowOnTv() -> String {
        switch channel {
        case .telechannel(let telechannel):
            return "канал \(telechannel)"
        case .port(let port):
            return "по порту \(port)"
        }
    }
}

let tvThree1 = TelevisionThree(model: "Samsung", isTurnOn: true, channel: Channel.telechannel("muz-tv"))
print(tvThree1.showNowOnTv())

let tvThree2 = TelevisionThree(model: "Samsung", isTurnOn: true, channel: Channel.port("COM"))
print(tvThree2.showNowOnTv())
