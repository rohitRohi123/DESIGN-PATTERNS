//
//  Adapter - Ex1.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 13/09/22.
//

import Foundation

///Target defines the domain-specific interface used by the client code.
class SIphoneHeadPhone {  //Target
    func wiredHeadPhone()-> String {
        return "iphone wired headphone"
    }
    
}

 /// The Adaptee contains some useful behavior, but its interface is incompatible
 /// with the existing client code. The Adaptee needs some adaptation before the
 /// client code can use it.
class SIphone13 { // Adaptee
    func universalCTypePort()-> String {
        return "C-Type universal lighting port"
    }
    
}

/// The Adapter makes the Adaptee's interface compatible with the Target's
/// interface
class Adapter: SIphoneHeadPhone {
    let adaptee: SIphone13
    init(with adaptee: SIphone13) {
        self.adaptee = adaptee
    }
    
   override func wiredHeadPhone()-> String {
       return adaptee.universalCTypePort()
    }
}

/// The client code supports all classes that follow the Target interface.
class Client {
    // ...
    static func ListenSong(target headPhone: SIphoneHeadPhone) {
        debugPrint("Play song = \(headPhone.wiredHeadPhone())")
    }
    // ...
}

/// Let's see how it all works together.
class AdapterConceptual {

    func testAdapterConceptual() {
        print("Client: I can work just fine with the Target objects:")
        Client.ListenSong(target: SIphoneHeadPhone())

        let adaptee = SIphone13()
        print("Client: The Adaptee class has a weird interface. See, I don't understand it:")
        print("Adaptee: " + adaptee.universalCTypePort())

        print("Client: But I can work with it via the Adapter:")
        Client.ListenSong(target: Adapter(with: adaptee))
    }
}
