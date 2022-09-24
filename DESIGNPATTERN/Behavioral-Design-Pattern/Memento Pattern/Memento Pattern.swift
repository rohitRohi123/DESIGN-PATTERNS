//
//  Memento Pattern.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 24/09/22.
//

import Foundation

class MTextArea {
    private var text: String?
 
    fileprivate func set(text: String) {
        self.text = text
    }
    
    fileprivate func restore(with momento: Memento) {
        debugPrint("Updo data = \(momento.getSavedText())")
    }
    
    fileprivate func save(text: String)-> Memento {
        return Memento(with: text)
    }
    
    struct Memento {
        private var text: String
        
        init(with text: String) {
            self.text = text
        }
        
       fileprivate func getSavedText()-> String {
            return text
        }
    }
}

class MEditor {
    private var textArea: MTextArea
    private var snapshots: Stack<MTextArea.Memento>  = Stack<MTextArea.Memento>()
    
    init(with textArea: MTextArea) {
        self.textArea = textArea
    }
    
    func write(text: String) {
        self.textArea.set(text: text)
        self.snapshots.add(snapshot: self.textArea.save(text: text))
    }
    
    func undo() {
        self.textArea.restore(with: self.snapshots.getSnapshot())
        
    }
}


/* Client Code
 let editor = MEditor(with: MTextArea())
 editor.write(text: "Like and")
 editor.write(text: "Like and Subscribe")
 editor.write(text: "Like and Subscribe to rohit")
 
 editor.undo()
 */
