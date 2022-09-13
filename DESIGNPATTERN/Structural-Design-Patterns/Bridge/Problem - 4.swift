//
//  Problem - 4.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 13/09/22.
//

import Foundation

class Shape {
    let width: Int
    let height: Int
    init(width: Int, height: Int) {
        self.width = width
        self.height = height
    }
    
    func draw() {
        debugPrint("Shape drawn with width = \(width) and height = \(height)")
    }

}

// Want to create two shape Circle and Square
class Circle: Shape {
    override func draw() {
        debugPrint("Circle drawn with radius = \(width / 2) and height = \(height)")
    }
    
}

class Square: Shape {
    override func draw() {
        debugPrint("Square drawn with width = \(width + height / 2) and height = \(width + height / 2)")
    }
    
}

//Want to color full shape like Red and Blue
class RedCircle: Circle {
    override func draw() {
        super.draw()
        debugPrint("Circle Color = Red")
    }
    
}

class BlueCircle: Circle {
    override func draw() {
        super.draw()
        debugPrint("Circle Color = Blue")
    }
    
}

class RedSquare: Square {
    override func draw() {
        super.draw()
        debugPrint("Square Color = Red")
    }
    
}

class SquareCircle: Square {
    override func draw() {
        super.draw()
        debugPrint("Square Color = Blue")
    }
    
}

//Now we want to add new shape i.e triangle
class Triange: Shape {
    override func draw() {
        debugPrint("drawn a triangle with width = \(width) and height = \(height)")
    }
}

//Now we want to add new color i.e pink and yellow shapes
//Now you need to require create three subclasses of each type shape.
// As we more variation our classes hierarchy increase exponentially
