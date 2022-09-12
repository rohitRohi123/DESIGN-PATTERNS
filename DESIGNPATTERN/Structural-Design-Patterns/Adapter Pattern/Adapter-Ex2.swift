//
//  Adapter-Ex2.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 13/09/22.
//

import Foundation

protocol Jumping {
    func jump()
}

class Dog: Jumping {
    func jump() {
        debugPrint("Dog Jumping")
    }
}

class Cat: Jumping {
    func jump() {
        debugPrint("Cat jumping")
    }
}

//Adaptee, frog can also jump
class Frog {
    func leap() {
        debugPrint("Frog leaps")
    }
    
}


// Before Adapter
func jumpAll(animals: [Jumping], frog: Frog? = nil) {
    for animal in animals {
        animal.jump()
    }
    
    if let frog = frog {
        frog.leap()
    }
}

// After Adapter
func animalsA(animals: [Jumping]) {
    for animal in animals {
        animal.jump()
    }
}


//MARK: - Adapter by extension
extension Frog: Jumping {
    func jump() {
        self.leap()
    }
}


//MARK: - Adapter Pattern: The Dedicated Adapter Approach
class AdapterN: Jumping {
    //Adaptee
    let frog: Frog
   
    init(with frog: Frog) {
        self.frog = frog
    }

    func jump() {
        self.frog.leap()
    }
    
}

//jumpAll(animals: [Dog(), Cat(), AdapterN(with: Frog())])

