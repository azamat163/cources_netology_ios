//
//  Starships.swift
//  StarWars
//
//  Created by Aleksey Rochev (Netology) on 19.11.2019.
//  Copyright © 2019 Aleksey Rochev (Netology). All rights reserved.
//

import Foundation

// MARK: - Starship

protocol Starship: CustomStringConvertible, SpaceObject {
    var name: String  { get }
    var fraction: Fraction { get }
    var canShoot: Bool { get }
}

extension Starship {
    var description: String {
        return self.name + " \(self.fraction) fraction"
    }
}

extension Starship where Self: Armed {
    var canShoot: Bool {
        return self.weapons.first(where: { $0.ammunition > 0 }) == nil ? false : true
    }
}

// MARK: - Starship Base

class StarshipImp: Starship, Shooting {
    
    // MARK: - Properties
    
    private(set) var name = ""
    private(set) var fraction = Fraction.empare
    private(set) var weapons: [Weapons]
    private(set) var canShoot: Bool
    
    var coordinate: Point
    var health: Int = 0 {
        didSet {
            if oldValue > health {
                print("Ай больно же!")
            }
        }
    }
    
    weak var shootHandler: ShootHandler?
    
    // MARK: - Lifecycle
    
    init(name: String,
         fraction: Fraction,
         coordinate: Point,
         weapons: [Weapons],
         canShoot: Bool) {
        self.name = name
        self.fraction = fraction
        self.coordinate = coordinate
        self.weapons = weapons
        self.canShoot = canShoot
    }
        
    // MARK: - Properties
    
    func fire(to coordinate: Point) throws {
        guard
            canShoot,
            var weapon = weapons.first(where: { $0.ammunition > 0 } )
        else {
            return
        }
        
        let diffX = coordinate.x - self.coordinate.x
        let diffY = coordinate.y - self.coordinate.y
        let distance = sqrt((diffX * diffX) + (diffY * diffY))
        guard weapon.distance >= Int(distance) else {
            throw WeaponsError.isMissed
        }
        
        try weapon.fire()
        shootHandler?.fire(from: weapon, to: coordinate)
    }
}
