//
//  WeaponsJedi.swift
//  StarWars
//
//  Created by Aleksey Rochev (Netology) on 19.11.2019.
//  Copyright © 2019 Aleksey Rochev (Netology). All rights reserved.
//

import Foundation

struct Bomb: Weapons {
    var name: String = "Lazer Blaster"
    var damage: Int = 100
    var distance: Int = 20000
    var rateOfFire: Int = 2
    var ammunition: Int = 2
}

struct LazerBlaster: Weapons {
    var name: String = "Lazer Blaster"
    var damage: Int = 10
    var distance: Int = 10000
    var rateOfFire: Int = 60
    var ammunition: Int = 100
}
