//
//  Prototype-Pattern.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 12/09/22.
//

import Foundation

/*Client Code
 let monster = Monster(health: "good", level: 9)
 let copy = monster.copy()
 debugPrint("new copied monster health = \(copy.health) and level = \(copy.level)")
 
 let eyeballMoster = EyeBallMonster(health: "good", level: 9, redness: 100)
 let copied = eyeballMoster.copy()
 
 debugPrint("new copied monster health = \(copied.health) and level = \(copied.level) and red ness = \(copied.redness)")
 
 let tempArr = [monster, eyeballMoster]
 debugPrint("Deep array copy = \(tempArr.deepCopy())")
 */

//PROTOTYPE PROTOCOL
protocol Copying: AnyObject {
    init(_ prototype: Self)
}

extension Copying {
    func copy()-> Self {
        return type(of: self).init(self)
    }
}


//Ex 1:
class Monster: Copying {
    var health: String
    var level: Int
    
    init(health: String, level: Int) {
        self.health = health
        self.level = level
    }
    
    required convenience init(_ prototype: Monster) {
        self.init(health: prototype.health, level: prototype.level)
    }
}

//MARK: - When we create subclass of Prototype Baseclass then we need to handle new added properties in subclasses.
class EyeBallMonster: Monster {
    var redness: Int
    
    init(health: String, level: Int, redness: Int) {
        self.redness = redness
        super.init(health: health, level: level)
    }
    
    required convenience init(_ prototype: Monster) {
        let monster = prototype as! EyeBallMonster
        self.init(health: monster.health, level: monster.level, redness: monster.redness)
    }
}


extension Array where Element: Copying {
   func deepCopy() -> [Element] {
    return map { $0.copy() }
  }
}
