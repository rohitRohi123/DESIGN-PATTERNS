//
//  State Pattern - Case 1.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 24/09/22.
//

import Foundation
import UIKit


class SCase1Document {
    private var state: StateProtocol?
    
    func setState(with state: StateProtocol) {
        self.state = state
    }
    
    func publishDocument() {
        self.state?.publish()
    }
    
}

protocol StateProtocol {
    func publish()
}

struct ModerateState: StateProtocol {
    private var document: SCase1Document
    
    init(with document: SCase1Document) {
        self.document = document
    }
    
    func publish() {
        debugPrint("Document published")
        document.setState(with: PublishedState(with: document))
    }
}

struct DraftState: StateProtocol {
    private var document: SCase1Document
    
    init(with document: SCase1Document) {
        self.document = document
    }
    
    func publish() {
        debugPrint("Make ready document for Moderate state")
        document.setState(with: ModerateState(with: document))
    }
}

struct PublishedState: StateProtocol {
    private var document: SCase1Document
    
    init(with document: SCase1Document) {
        self.document = document
    }
    
    func publish() {
        debugPrint("Do Nothing")

    }
}
