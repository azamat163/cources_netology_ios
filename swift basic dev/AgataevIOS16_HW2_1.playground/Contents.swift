import UIKit

// Базовый протокол(интерфейс), в котором описаны основные свойства и методы, в котором будут применятся в классе
protocol BaseProtocol {
    var tvInfo: (String, String) { get set }
    var isTurnOn: Bool { get set }
    func showNowOnTv() -> String
}

// Задача №1

class FirstTelevision: BaseProtocol {
    // Создали enum каналов
    enum TelevisionChannel {
        case muztv, friday, russiatoday, rentv, tnt
    }
    
    // свойства класса
    var tvInfo: (String, String)
    var isTurnOn: Bool
    var currentChannel: TelevisionChannel
    
    // инициализатор класса
    init(tvInfo: (String, String), isTurnOn: Bool, currentChannel: TelevisionChannel) {
        self.tvInfo = tvInfo
        self.isTurnOn = isTurnOn
        self.currentChannel = currentChannel
    }
    
    // метод который показывает текущий канал
    func showNowOnTv() -> String {
        if isTurnOn {
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
        } else {
            return "телевизор \(tvInfo.0) выключен. Необходимо включить!"
        }
    }
}


let firstTv = FirstTelevision(tvInfo: ("samsung", "ue50tu7170u"), isTurnOn: true, currentChannel: .muztv)
print(firstTv.showNowOnTv())

firstTv.tvInfo = ("Xiami", "4S 43")
firstTv.isTurnOn = false
firstTv.currentChannel = .russiatoday
print(firstTv.showNowOnTv())



// Задача №2
// структура Настройка
struct Setting {
    let volume: Double
    let isColor: Bool
    
    // добавляем инициализатор с целью проверки на громкость
    init(volume: Double, isColor: Bool) {
        self.volume = Setting.getVolume(volume)
        self.isColor = isColor
    }

    // функция проверка громкости
    static func getVolume(_ volume: Double) -> Double {
        switch volume {
        case let i where i < 0:
            return 0
        case let i where i > 1:
            return 1
        default:
            return volume
        }
    }
}

class SecondTelevision: FirstTelevision {
    // свойства класса
    var setting: Setting
    
    // инициализатор класса
    init(tvInfo: (String, String), isTurnOn: Bool, currentChannel: TelevisionChannel, setting: Setting) {
        self.setting = setting
        super.init(tvInfo: tvInfo, isTurnOn: isTurnOn, currentChannel: currentChannel)
    }
    
    // метод который показывает текущий канал
    override func showNowOnTv() -> String {
        if isTurnOn {
            switch currentChannel {
            case .muztv:
                return "телевизор по канал муз-тв c громкостью \(self.setting.volume)"
            case .friday:
                return "канал пятница  c громкостью \(self.setting.volume)"
            case .russiatoday:
                return "канал Russia Today  c громкостью \(self.setting.volume)"
            case .rentv:
                return "канал Рен-тв  c громкостью \(self.setting.volume)"
            case .tnt:
                return "канал тнт  c громкостью \(self.setting.volume)"
            }
        } else {
            return "телевизор \(tvInfo.0) выключен. Необходимо включить!"
        }
    }
}

let setting = Setting(volume: 0.5, isColor: true)
let secondTv = SecondTelevision(tvInfo: ("samsung", "ue50tu7170u"), isTurnOn: true, currentChannel: .muztv, setting: Setting(volume: -2, isColor: true))
print(secondTv.showNowOnTv())

secondTv.tvInfo = ("LG", "OLED55E9P 55")
secondTv.setting = Setting(volume: 0.6, isColor: false)
secondTv.currentChannel = .russiatoday
print(secondTv.showNowOnTv())


// Задача №3
class ThirdTelevision: BaseProtocol {
    // енам входа просмотров
    enum Input {
        case channel(String)
        case port(String)
    }
    
    // свойства класса
    var tvInfo: (String, String)
    var isTurnOn: Bool
    var input: Input
    
    // инициализатор класса
    init(tvInfo: (String, String), isTurnOn: Bool, input: Input) {
        self.tvInfo = tvInfo
        self.isTurnOn = isTurnOn
        self.input = input
    }
    
    // метод который показывает текущий канал
    func showNowOnTv() -> String {
        if isTurnOn {
            switch input {
            case .channel(let telechannel):
                return "канал \(telechannel)"
            case .port(let port):
                return "по порту \(port)"
            }
        } else {
            return "телевизор \(tvInfo.0) выключен. Необходимо включить!"
        }
    }
}

let thirdTvChannelTurnOn = ThirdTelevision(tvInfo: ("LG", "OLED55E9P 55"), isTurnOn: true, input: .channel("muz-tv"))
print(thirdTvChannelTurnOn.showNowOnTv())
let thirdTvChannelTurnOff = ThirdTelevision(tvInfo: ("LG", "OLED55E9P 55"), isTurnOn: false, input: .channel("muz-tv"))
print(thirdTvChannelTurnOff.showNowOnTv())

let thirdTvPortTurnOn = ThirdTelevision(tvInfo: ("Samsung", "OLED55E9P 55"), isTurnOn: true, input: .port("COM"))
print(thirdTvPortTurnOn.showNowOnTv())
let thirdTvPortTurnOff = ThirdTelevision(tvInfo: ("Samsung", "OLED55E9P 55"), isTurnOn: false, input: .port("COM"))
print(thirdTvPortTurnOff.showNowOnTv())
