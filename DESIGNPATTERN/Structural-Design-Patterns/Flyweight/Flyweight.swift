//
//  Flyweight.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 16/09/22.
//

import Foundation

// The flyweight class contains a portion of the state of a
// tree. These fields store values that are unique for each
// particular tree. For instance, you won't find here the tree
// coordinates. But the texture and colors shared between many
// trees are here. Since this data is usually BIG, you'd waste a
// lot of memory by keeping it in each tree object. Instead, we
// can extract texture, color and other repeating data into a
// separate object which lots of individual tree objects can
// reference.
class TreeType {
    var name: String
    var color: String
    var texture: String
    
    init(name: String, color: String, texture: String) {
        self.name = name
        self.color = color
        self.texture = texture
    }
    
    func draw(canvas: String, x: Int, y: Int) {
       debugPrint("draw at x = \(x) and y = \(y)")
      // 1. Create a bitmap of a given type, color & texture.
      // 2. Draw the bitmap on the canvas at X and Y coords.

    }
    
}


class TreeFactory {
    private init() {}
    static let shared: TreeFactory = TreeFactory()
    
    var treeType: [String: TreeType] = [:]
    
    func getTreetype(for treeName: String,
                     texture: String,
                     and color: String) -> TreeType {
        if treeType[treeName] != nil {
            return treeType[treeName]!
        }
        
        let treeType = TreeType(name: treeName, color: color, texture: texture)
        self.treeType[treeName] = treeType
        return treeType
    }
}


class FlyweightForest {
    var trees: [FlyweightTree] = []
    
    func planForest() {
        let flyweightFactory = TreeFactory.shared
        
        for i in 0..<500 {
            if i < 100 {
                // Plant A types of trees
                let tree = FlyweightTree(x: i, y: i, treeType: flyweightFactory.getTreetype(for: "A", texture: "Light green texture", and: "light"))
                tree.draw()
                trees.append(tree)
            }
            
            if( i > 99 && i < 200 ) {
                // Plant B types of trees
                let tree = FlyweightTree(x: i, y: i, treeType: flyweightFactory.getTreetype(for: "B", texture: "Dark Green Texture", and: "dark Green"))
                tree.draw()
                trees.append(tree)
            }
            
            if i > 199 && i < 300 {
                //Plant C types of trees
                let tree = FlyweightTree( x: i, y: i, treeType: flyweightFactory.getTreetype(for: "C", texture: "Black Texture", and: "Black"))
                tree.draw()
                trees.append(tree)
            }
            
            if i > 299 && i < 400 {
                // Plant D types of trees
                let tree = FlyweightTree(x: i, y: i, treeType: flyweightFactory.getTreetype(for: "D", texture: "While Texture", and: "White"))
                tree.draw()
                trees.append(tree)
            }
            
            if i > 399 && i < 500 {
                // Plant E types of trees
                let tree = FlyweightTree(x: i, y: i, treeType: flyweightFactory.getTreetype(for: "D", texture: "Light yellow Texture", and: "light yellow"))
                tree.draw()
                trees.append(tree)
            }
        }
    }
}

class FlyweightTree  {
    let x: Int
    let y: Int
    let treeType: TreeType
    
    init(x: Int, y:Int, treeType: TreeType) {
        self.x = x
        self.y = y
        self.treeType = treeType
    }
    
    func draw() {
        treeType.draw(canvas: "Cancas", x: self.x, y: self.y)
    }
}

/*
 FlyweightForest().planForest()
 */
