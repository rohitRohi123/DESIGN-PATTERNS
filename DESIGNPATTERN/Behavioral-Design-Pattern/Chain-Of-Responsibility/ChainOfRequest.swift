//
//  ChainOfRequest.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 20/09/22.
//

import Foundation

protocol Chain {
    func setNext(chain: Chain)
    func mathOperation(with number: Numbers)
}

class MathOperation: Chain {
    private var next: Chain?
    
    func setNext(chain: Chain) {
        self.next = chain
    }
    
    func mathOperation(with number: Numbers) {
        next?.mathOperation(with: number)
    }
}

class AddNumbers: Chain {
    private var next: Chain?
    
    func setNext(chain: Chain) {
        self.next = chain
    }
    
    func mathOperation(with number: Numbers) {
        if number.calWanted() == "add" {
            debugPrint("\(number.getNum1()) + \(number.getNum2()) = \(number.getNum1() + number.getNum2())")
            return
        }
        
        next?.mathOperation(with: number)
    }
}

class Substract: Chain {
    private var next: Chain?
    
    func setNext(chain: Chain) {
        self.next = chain
    }
    
    func mathOperation(with number: Numbers) {
        if number.calWanted() == "sub" {
            debugPrint("\(number.getNum1()) - \(number.getNum2()) = \(number.getNum1() - number.getNum2())")
            return
        }
        
        next?.mathOperation(with: number)
    }
    
}

class Multiply: Chain {
    private var next: Chain?
    
    func setNext(chain: Chain) {
        self.next = chain
    }
    
    func mathOperation(with number: Numbers) {
        if number.calWanted() == "mul" {
            debugPrint("\(number.getNum1()) * \(number.getNum2()) = \(number.getNum1() * number.getNum2())")
            return
        }
        
        next?.mathOperation(with: number)
    }
    
}

class Divide: Chain {
    private var next: Chain?
    
    func setNext(chain: Chain) {
        self.next = chain
    }
    
    func mathOperation(with number: Numbers) {
        if number.calWanted() == "div" {
            debugPrint("\(number.getNum1()) / \(number.getNum2()) = \(number.getNum1() / number.getNum2())")
            return
        }
        
        next?.mathOperation(with: number)
    }
    
}

struct Numbers {
    private let num1: Int
    private let num2: Int
    private var calcWanted: String
    
    init(num1: Int, num2: Int, calcWanted: String) {
        self.num1 = num1
        self.num2 = num2
        self.calcWanted = calcWanted
    }
 
    func getNum1()-> Int {return num1; }
    func getNum2()-> Int {return num2; }
    
    func calWanted()-> String {return calcWanted; }
}


/* Client Code
 let number = Numbers(num1: 10, num2: 20, calcWanted: "mul")
 let addOperation = AddNumbers()
 let multiOperation = Multiply()
 let divideOperation = Divide()
 let subOperation = Substract()
 
 subOperation.setNext(chain: divideOperation)
 divideOperation.setNext(chain: multiOperation)
 multiOperation.setNext(chain: addOperation)
 
 let mathOperation = MathOperation()
 mathOperation.setNext(chain: subOperation)
 mathOperation.mathOperation(with: number)
 
 */
