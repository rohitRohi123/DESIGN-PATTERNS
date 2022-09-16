//
//  Problem 6.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 16/09/22.
//

import Foundation

class Forest {
    var trees: [Tree] = []
    
    func planForest() {
        for i in 0..<500 {
            if i < 100 {
                // Plant A types of trees
                let tree = Tree(name: "A", color: "light Green", texture: "Light Green Texture", x: i, y: i)
                tree.draw()
                trees.append(tree)
            }
            
            if( i > 99 && i < 200 ) {
                // Plant B types of trees
                let tree = Tree(name: "B", color: "dark Green", texture: "Dark Green Texture", x: i, y: i)
                tree.draw()
                trees.append(tree)
            }
            
            if i > 199 && i < 300 {
                //Plant C types of trees
                let tree = Tree(name: "C", color: "Black", texture: "Black Texture", x: i, y: i)
                tree.draw()
                trees.append(tree)
            }
            
            if i > 299 && i < 400 {
                // Plant D types of trees
                let tree = Tree(name: "D", color: "White", texture: "While Texture", x: i, y: i)
                tree.draw()
                trees.append(tree)
            }
            
            if i > 399 && i < 500 {
                // Plant E types of trees
                let tree = Tree(name: "E", color: "light yellow", texture: "Light yellow Texture", x: i, y: i)
                tree.draw()
                trees.append(tree)
            }
        }
    }
}

class Tree  {
    let name: String
    let color: String //Consume high memory
    let texture: String //Consume high memory
    let x: Int
    let y: Int
    
    init(name: String, color: String, texture: String,
         x: Int, y: Int) {
        self.name = name
        self.color = color
        self.texture = texture
        self.x = x
        self.y = y
    }
    
    func draw() {
        debugPrint("\(name) Tree drawn color = \(color), texture = \(texture), and position = x \(x), y = \(y) ")
    }
}


//Problem
// As you can see from forest class in our forest we have 100's types of same tree
// All these 100 tree have same texture & color but these instantiate 100 texture & Color objects
// If we assume texture consume 100 MB & color consume 100KB
// then 100plans consume 100 * 100 MB = 10,000 MB that is 9.76 GB

//Solution:
//All 100's plants have same texture and color so, it's intrinsic state of the object
// Create one object with this texture and color
// and all plants points that's one texture and color object so, now it's consume 100 MB only. 
