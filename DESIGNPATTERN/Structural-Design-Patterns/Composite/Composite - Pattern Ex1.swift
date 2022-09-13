//
//  Composite - Pattern Ex1.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 13/09/22.
//

import Foundation

protocol PackagePrice {
    func total()-> Int
    
}


struct CProduct: PackagePrice {
    var name: String
    var price: Int
    
    func total()-> Int {
        return self.price
    }
}

class CBox: PackagePrice {
    var product: CProduct
    
    init(product: CProduct) {
        self.product = product
    }
    
    func total() -> Int {
        return product.price
    }
}

class CompoundBox: PackagePrice {
    var boxes: [PackagePrice] = []
 
    func add(package: PackagePrice) {
        self.boxes.append(package)
    }
    
    func total() -> Int {
        var total: Int = 0
        for box in boxes {
            total += box.total()
        }
        
        return total
    }
}

class Courier {
    var packages: CompoundBox?
    
    func load() {
        packages = CompoundBox()
        packages?.add(package: CBox(product: CProduct(name: "Flower", price: 100)))
        packages?.add(package: CProduct(name: "Chocolate", price: 200))
        
        var surpriseContainer = CompoundBox()
        surpriseContainer.add(package: CBox(product: CProduct(name: "Flower", price: 100)))
        surpriseContainer.add(package: CProduct(name: "Chocolate", price: 200))
        
        packages?.add(package: CProduct(name: "Chocolate", price: 200))
        packages?.add(package: surpriseContainer)
    }
    
    func packageTotalPrice() {
        debugPrint("Package total price = \(packages?.total())")
        
    }
}


/*
 let courrier = Courier()
 courrier.load()
 courrier.packageTotalPrice()
 */
