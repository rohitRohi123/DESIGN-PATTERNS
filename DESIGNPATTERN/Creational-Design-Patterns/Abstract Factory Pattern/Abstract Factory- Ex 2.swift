//
//  Abstract Factory- Ex 2.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 12/09/22.
//

import Foundation

/*
  We are going to develop a UI library, so client can create UI that is OS independent.
 */

/*
 Client Code
  let factory = GUIAbstractFactory.createFactory()
  factory.createButton()
 factory.createTextbox()
 */


struct GUIAbstractFactory {
    static func createFactory()-> IFactory? {
        let runningOS = "mac"
      
        if runningOS.lowercased() == "mac" {
            return MacFactory()
        }
        
        if runningOS.lowercased() == "window" {
            return WindowFactory()
        }
        
        if runningOS.lowercased() == "Linux" {
            return LinuxFactory()
        }
        
        return nil
    }
    
}


protocol IFactory {
    func createButton()-> IButton
    func createTextbox()-> ITextBox
}

struct LinuxFactory: IFactory {
    func createButton() -> IButton {
        return AppButton()
    }
    
    func createTextbox() -> ITextBox {
        return AppTextBox()
    }
    
}

struct WindowFactory: IFactory {
    func createButton() -> IButton {
        return AppButton()
    }
    
    func createTextbox() -> ITextBox {
        return AppTextBox()
    }
    
}

struct MacFactory: IFactory {
    func createButton() -> IButton {
        return AppButton()
    }
    
    func createTextbox() -> ITextBox {
        return AppTextBox()
    }
}

protocol IButton {
  func clicked()
    
}

protocol ITextBox {
    mutating func set(text: String)
    func getText() -> String?
}

struct AppButton: IButton {
    func clicked() {
        debugPrint("Button clicked")
    }
}

struct AppTextBox: ITextBox {
    private(set) var text: String?
    
    mutating func set(text: String) {
        self.text = text
        debugPrint("Text text = \(text)")
    }
    
    func getText()-> String? {
        return self.text
    }
}

