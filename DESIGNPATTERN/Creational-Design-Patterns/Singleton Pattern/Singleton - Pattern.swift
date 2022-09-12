//
//  Singleton - Pattern.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 12/09/22.
//

import Foundation

/*
 let singleton1 = Singleton.shared
 let singleton2 = Singleton.shared
 let singleton3 = Singleton.shared
 let singleton4 = Singleton.shared
 debugPrint("Value of singleton = \(singleton1.a)") // Output: 20
 singleton4.a = 200
 
 debugPrint("Value of singleton1 = \(singleton1.a), singleton2 = \(singleton2.a), singleton3 = \(singleton3.a) and singleton4 = \(singleton4.a)") // Output: 200
 
 */

class Singleton {
    static let shared = Singleton()
    
    var a: Int = 20
    
}
