//
//  Composite - Pattern.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 13/09/22.
//

import Foundation

// The component interface declares common operations for both
// simple and complex objects of a composition.
protocol Graphics {
    func move(x: Int, y: Int)
    func draw()
}

// The leaf class represents end objects of a composition. A
// leaf object can't have any sub-objects. Usually, it's leaf
// objects that do the actual work, while composite objects only
// delegate to their sub-components.
class Dot: Graphics {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    func move(x: Int, y: Int) {
        self.x += x
        self.y += y
    }
    
    func draw() {
        debugPrint("Draw graphics at point x = \(x) and y = \(y)")
    }
    
}

class CircleGraphics: Dot {
    var radius: Int
    
    init(x: Int, y: Int, radius: Int) {
        self.radius = radius
        super.init(x: x, y: y)
    }
    
    override func draw() {
        debugPrint("Draw circle with point x = \(x), y = \(y) and radius = \(radius)")
    }
}


// The composite class represents complex components that may
// have children. Composite objects usually delegate the actual
// work to their children and then "sum up" the result.
class CompoundGraphic: Graphics {
    var children:[Graphics] = []

    // A composite object can add or remove other components
    // (both simple or complex) to or from its child list.
    func add(child: Graphics) {
        // Add a child to the array of children.
        self.children.append(child)
    }
    
    func remove(child: Graphics) {
        // Remove a child from the array of children.
        
    }
    
    func move(x: Int, y: Int) {
        for child in children {
            child.move(x: x, y: y)
        }
    // A composite executes its primary logic in a particular
    // way. It traverses recursively through all its children,
    // collecting and summing up their results. Since the
    // composite's children pass these calls to their own
    // children and so forth, the whole object tree is traversed
    // as a result.
   }
            
    func draw() {
        // 1. For each child component:
        //     - Draw the component.
        //     - Update the bounding rectangle.
        // 2. Draw a dashed rectangle using the bounding
        // coordinates.
    }
}

// The client code works with all the components via their base
// interface. This way the client code can support simple leaf
// components as well as complex composites.
class ImageEditor {
    var all: CompoundGraphic?

    func load() {
        all = CompoundGraphic()
        all?.add(child: Dot(x:1, y: 2))
        all?.add(child: CircleGraphics(x: 10, y: 20, radius: 10))
        // ..
    }
    // Combine selected components into one complex composite
    // component.
    func groupSelected(components: [Graphics]) {
        let group = CompoundGraphic()
        
        for component in components {
            group.add(child: component)
            all?.remove(child: component)
            all?.add(child: group)
            // All components will be drawn.
            all?.draw()
        }
          
     }
    
}
