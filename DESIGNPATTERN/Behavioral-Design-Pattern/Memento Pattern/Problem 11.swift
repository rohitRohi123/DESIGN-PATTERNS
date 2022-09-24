//
//  Problem 11.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 24/09/22.
//

import Foundation

struct Stack<Item> {
    private(set) var snapshots: [Item] = []
    
    mutating func add(snapshot: Item) {
        self.snapshots.append(snapshot)
    }
    
    mutating func getSnapshot()-> Item {
        return self.snapshots.removeLast()
    }
}


class TextArea {
    private var text: String?
    private var bold: Bool?
    private var underline: Bool?
    private var itelic: Bool?
    private var alignment: String?
    
    func updateTextArea(with text: String) {
        self.text = text
        
    }
    
    func getSnapshot() -> Snapshot {
        return Snapshot.init(text: text, bold: bold, underline: underline, itelic: itelic, alignment: alignment)
    }
    
}

struct Snapshot {
    var text: String?
    var bold: Bool?
    var underline: Bool?
    var itelic: Bool?
    var alignment: String?
    
}

class Editor {
    private(set) var textArea: TextArea
    private var snapshot: Stack<Snapshot> = Stack<Snapshot>()
    
    init(with textArea: TextArea) {
        self.textArea = textArea
    }
    
    func setText(with text: String) {
        textArea.updateTextArea(with: text)
        self.snapshot.add(snapshot: textArea.getSnapshot())
        
    }
    
    func undo() {
        guard snapshot.snapshots.count > 0 else {return }
        
        let snapshot = snapshot.getSnapshot()
        textArea.updateTextArea(with: snapshot.text ?? "")
    }
}

/* Problem
     // Here you changed private attribute of TextArea, into public in snapshot
    //  So, it increase dependency and if you change something in Snapshot then it required
   //   to change where you used that snapshot
 */
