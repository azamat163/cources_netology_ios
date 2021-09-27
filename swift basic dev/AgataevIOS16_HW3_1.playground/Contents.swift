import UIKit

// Задача 1

// енам жанров
enum Genre {
    case pop, rap, dance, alternativa, rock
}

// енам странов
enum Country {
    case usa, russia, england, polish, germany, france
}

// класс Артист
class Artist {
    // свойства артиста
    final var name: String // имя артиста
    var country: Country // страна
    var genre: Genre // жанр
    
    init(name: String, country: Country, genre: Genre) {
        self.name = name
        self.country = country
        self.genre = genre
    }
}

extension Artist {
    // метод написать трек
    func writeTrack(trackName: String) -> Void {
            print("Я \(self.name) написал трек \(trackName)")
    }
    
    // метод исполнить трек
    func playTrack(trackName: String) -> Void {
        print("Я \(self.name) исполнил трек \(trackName)")
    }
}


// Задание 2

// позволяет в будующем защищаться от наследование и нельзя переопределить методы
final class ArianaGrandeArtist: Artist {
    // защищаем от перезаписи
    private(set) var fullName: String
    
    init(name: String, country: Country, genre: Genre, fullName: String) {
        self.fullName = fullName
        super.init(name: name, country: country, genre: genre)
    }
    
    // новый метод
    func printFullName() -> Void {
        print("Я \(self.name) мое полное имя \(fullName)")
    }
}

// позволяет в будующем защищаться от наследование и нельзя переопределить методы
final class SatyrArtist: Artist {
    // защищаем от перезаписи
    private(set) var age: Int
    
    init(name: String, country: Country, genre: Genre, age: Int) {
        self.age = age
        super.init(name: name, country: country, genre: genre)
    }
    
    // новый метод
    func printAge() -> Void {
        print("Я \(self.name) мне \(self.age) лет")
    }
    
}

// позволяет в будующем защищаться от наследование и нельзя переопределить методы
final class Bi2Artist: Artist {
    // защищаем от перезаписи
    private(set) var countTrack: Int
    
    init(name: String, country: Country, genre: Genre, countTrack: Int) {
        self.countTrack = countTrack
        super.init(name: name, country: country, genre: genre)
    }
    
    // новый метод
    func printCountTrack() -> Void {
        print("Я \(self.name) у нас написано и исполнено \(self.countTrack) треков")
    }
}


let arianaGrande = ArianaGrandeArtist(name: "Ariana", country: .usa, genre: .pop, fullName: "Grande")
let satyr = SatyrArtist(name: "Satyr", country: .russia, genre: .rap, age: 28)
let bi2 = Bi2Artist(name: "Bi-2", country: .russia, genre: .rock, countTrack: 35)
// bi2.countTrack = 34 ошибка


// Задача 3
// Так как все остальные классы наследованы от Artist
var artists: [Artist] = []
artists.append(arianaGrande)
artists.append(satyr)
artists.append(bi2)

//3
/*
 Разобрался как переопределять инициализатор, свойства и методы супер класса (override)
 Разобрался как последовательно инициализировать дочерний класс с добавленным новым свойствои (self.new = new -> super.init())
 Разобрался как с помощью final можно защищаться от наследования и перезаписи (final)
 Разобрался какие виды бывают инициализоторов, (required init, init?, convience)
 
 */

// 4
// Даю себе оценку 4, но нужно еще попрактиковатьс чтобы твердо все закрепить
