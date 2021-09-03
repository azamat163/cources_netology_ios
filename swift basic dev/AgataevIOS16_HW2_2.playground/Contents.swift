import UIKit


// Задача  №1

// структура Трек
struct Track {
    // свойства
    var name: String // имя
    var artist: String // исполнитель
    var duration: String // длительность
    var country: String // страна
}

// расширения, чтобы по названию искать в массиве треки
extension Track: Equatable {
    static func ==(lhs: Track, rhs: Track) -> Bool {
        return lhs.name == rhs.name
    }
}


// класс Категория
class Category {
    var name: String // название категории
    lazy var tracks: [Track] = [] // список треков
    var countInTracks: Int { // кол-во треков
        return tracks.count
    }
    
    // конструктор
    init(name: String) {
        self.name = name
    }
}

// расширения для класса Категория, добавим два метода добавления и удаления трека
extension Category {
    func addTrackToCategory(_ track: Track) -> Void {
        if let _ = tracks.firstIndex(of: track) {
            print("Такой трек \(track.name) уже добавлен в категорию \(self.name)")
        } else {
            tracks.append(track)
            print("Трек \(track.name) успешно добавлен в категорию \(self.name)")
            print("Общее кол-во треков в категории \(self.name) = \(self.countInTracks)")
        }
    }
    
    func deleteTrackFromCategory(_ track: Track) -> Void {
        if let index = tracks.firstIndex(of: track) {
            tracks.remove(at: index)
            print("Трек \(track.name) успешно удален из категории \(self.name)")
            print("Общее кол-во треков в категории \(self.name) = \(self.countInTracks)")
        } else {
            print("Трек \(track.name) не найден в категории \(self.name)!")
        }
    }
}

extension Category: Equatable {
    static func ==(lhs: Category, rhs: Category) -> Bool {
        return lhs.name == rhs.name
    }
}


// Задача №2


// Класс библиотека
class Library {
    // свойства библиотеки
    var name: String
    lazy var categories: [Category] = []
    var countCategories: Int {
        return categories.count
    }
    
    // конструктор
    init(name: String) {
        self.name = name
    }
}

// расширения для класса Library, добавим два метода добавления и удаления категории
extension Library {
    func addCategoryToLibrary(_ category: Category) -> Void {
        if let _ = categories.firstIndex(of: category) {
            print("Категория \(category.name) уже добавлена в библиотеку \(self.name)")
        } else {
            categories.append(category)
            print("Категория \(category.name) успешно добавлена в библиотеку \(self.name)")
            print("Общее кол-во категорий в библиотеке \(self.name) = \(self.countCategories)")
        }
    }
    
    func deleteCategoryFromLibrary(_ category: Category) -> Void {
        if let index = categories.firstIndex(of: category) {
            categories.remove(at: index)
            print("Категория \(category.name) успешно удалена из библиотеки \(self.name)")
            print("Общее кол-во категорий в библиотеке \(self.name) = \(self.countCategories)")
        } else {
            print("Категория \(category.name) не найдена в библиотеке \(self.name)!")
        }
    }
    
    // Задача №3
    
    func moveTrackToCategory(fromCategory: Category, toCategory: Category, track: Track) -> Void {
        if !categories.contains(fromCategory) && !categories.contains(toCategory) {
            print("Категории \(fromCategory.name) и \(toCategory.name) не добавлены в библиотеку \(self.name)")
        } else {
            for category in categories {
                if category == fromCategory {
                    if !fromCategory.tracks.contains(track) {
                        print("Трек \(track.name) не добавлен в категорию \(fromCategory.name). Необходимо добавить сначала трек \(track.name) в категорию \(fromCategory.name)!!!")
                    } else {
                        fromCategory.deleteTrackFromCategory(track)
                    }
                    continue
                }
                if category == toCategory {
                    toCategory.addTrackToCategory(track)
                    break
                }
            }
        }
    }
}


let trackTheCity = Track(name: "This City", artist: "Sam Fisher", duration: "3:35", country: "USA")
let trackSheWillBeLoved = Track(name: "She Will Be Loved", artist: "Maroon 5", duration: "4:34", country: "USA")
let trackLoveMeNow = Track(name: "Love Me Now", artist: "Kygo", duration: "2:35", country: "USA")

let trackUnknow = Track(name: "Unknow", artist: "Unknow", duration: "0:00", country: "unknow")

let categoryRomantic = Category(name: "Romantic")

categoryRomantic.addTrackToCategory(trackTheCity)
categoryRomantic.addTrackToCategory(trackSheWillBeLoved)
categoryRomantic.addTrackToCategory(trackLoveMeNow)

categoryRomantic.deleteTrackFromCategory(trackUnknow)

categoryRomantic.deleteTrackFromCategory(trackLoveMeNow)
categoryRomantic.addTrackToCategory(trackSheWillBeLoved)


let categoryGoodVibesRide = Category(name: "Good Vibes Ride")
let trackBadHabits = Track(name: "Bad Habits", artist: "Ed Sheeran", duration: "2:45", country: "USA")
let trackStay = Track(name: "Stay", artist: "The Kid LAROI & Justin Bieber", duration: "3:45", country: "USA")
let trackTimeOfOurLives = Track(name: "Time of Our Lives", artist: "Pitbull & Ne-Yo", duration: "4:45", country: "USA")

categoryGoodVibesRide.addTrackToCategory(trackBadHabits)
categoryGoodVibesRide.addTrackToCategory(trackStay)
categoryGoodVibesRide.addTrackToCategory(trackTimeOfOurLives)

let playlist = Library(name: "Playlists")
playlist.addCategoryToLibrary(categoryRomantic)
playlist.addCategoryToLibrary(categoryGoodVibesRide)

playlist.moveTrackToCategory(fromCategory: categoryRomantic, toCategory: categoryGoodVibesRide, track: trackSheWillBeLoved)
