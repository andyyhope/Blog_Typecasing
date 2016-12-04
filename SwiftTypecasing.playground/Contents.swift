// Swift: Typecasing
// Enums as data models?
//
// Author: Andyy Hope
// Twitter: @andyyhope
import Foundation
// MARK: - Models
struct Hero {
    let name: String
    let power: String
    init?(json: [String : AnyObject]) {
        guard
            let name = json["name"] as? String,
            let power = json["power"] as? String
            else { return nil }
        self.name = name
        self.power = power
    }
}

struct Princess {
    let name: String
    let kingdom: String
    
    init?(json: [String : AnyObject]) {
        guard
            let name = json["name"] as? String,
            let kingdom = json["kingdom"] as? String
            else { return nil }
        
        self.name = name
        self.kingdom = kingdom
    }
}

struct Civilian {
    let name: String
    
    init?(json: [String : AnyObject]) {
        guard let name = json["name"] as? String else { return nil }
        
        self.name = name
    }
}

enum Character {
    case hero(Hero)
    case princess(Princess)
    case civilian(Civilian)
    
    private enum `Type`: String {
        case hero, princess, civilian
        static let key = "type"
    }
    
    init?(json: [String : AnyObject]) {
        guard
            let string = json[Type.key] as? String,
            let type = Type(rawValue: string)
            else { return nil }
        
        switch type {
        case .hero:
            guard let hero = Hero(json: json) else { return nil }
            self = .hero(hero)
            
        case .princess:
            guard let princess = Princess(json: json) else { return nil }
            self = .princess(princess)
            
        case .civilian:
            guard let civilian = Civilian(json: json) else { return nil }
            self = .civilian(civilian)
        }
    }
}


// MARK: - Typecasing

let characters: [Character] = []

characters.forEach { (character) in
    
    switch character {
    case .hero(let hero):
        print(hero.power)
        
    case .princess(let princess):
        print(princess.kingdom)
        
    case .civilian(let civilian):
        print(civilian.name)
    }
}


// MARK: - Typecasing with Pattern Matching

func printPower(character: Character) {
    if case .hero(let hero) = character {
        print(hero.power)
    }
}
