//
//  Problem 5.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 13/09/22.
//

import Foundation

struct Product {
    var name: String
    var price: String
}

class Box {
    var name:String = ""
    var containItems: [Any] = []
    
    func packageBox(with product: Product) {
        self.containItems.append(product)
    }
}


class Container: Box {
    func packageContainer(with box: [Box]) {
        self.containItems += box
    }
}

//Now our box can contain box with product & containers with nested container
// So to get price for product that inside the nested container, we need to recursion and loops to track down the product price and you should also know internal implementation for the class.

//Composite pattern resolve this problem by using COMMON INTERFACE.
