//
//  Problem 11.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 24/09/22.
//

import Foundation

class Document {
    private(set) var state: String
    
    init(with state: String) {
        self.state = state
    }
    
    func publish() {
        switch state {
          case "draft":
             debugPrint("Make document Ready for moderate")
            
           case "moderate":
             debugPrint("Make document ready for pushlish")
            
           case "published":
              debugPrint("Do nothing")
            
           default:
               debugPrint("Document is in invalid state")
        }
    }
}

//As your app evolved and you added more and more state your app become
// Very hard to maintain and it also increase the probability of modify the document class.
