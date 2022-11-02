//
//  Adapter - Ex1.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 13/09/22.
//

import Foundation

///Target defines the domain-specific interface used by the client code.
class IphoneHeadPhone_Sol {  //Target
    func wiredHeadPhone()-> String {
        return "iphone wired headphone"
    }
    
}

 /// The Adaptee contains some useful behavior, but its interface is incompatible
 /// with the existing client code. The Adaptee needs some adaptation before the
 /// client code can use it.
class Iphone13_Sol { // Adaptee
    func universalCTypePort()-> String {
        return "C-Type universal lighting port"
    }
    
}

/// The Adapter makes the Adaptee's interface compatible with the Target's
/// interface
class Adapter: IphoneHeadPhone_Sol {
    let adaptee: Iphone13_Sol
    init(with adaptee: Iphone13_Sol) {
        self.adaptee = adaptee
    }
    
   override func wiredHeadPhone()-> String {
       return adaptee.universalCTypePort()
    }
}

/// The client code supports all classes that follow the Target interface.
class Client {
    // ...
    static func ListenSong(target headPhone: IphoneHeadPhone_Sol) {
        debugPrint("Play song = \(headPhone.wiredHeadPhone())")
    }
    // ...
}

/// Let's see how it all works together.
class AdapterConceptual {

    func testAdapterConceptual() {
        print("Client: I can work just fine with the Target objects:")
        Client.ListenSong(target: IphoneHeadPhone_Sol())

        let adaptee = Iphone13_Sol()
        print("Client: The Adaptee class has a weird interface. See, I don't understand it:")
        print("Adaptee: " + adaptee.universalCTypePort())

        print("Client: But I can work with it via the Adapter:")
        Client.ListenSong(target: Adapter(with: adaptee))
    }
}
