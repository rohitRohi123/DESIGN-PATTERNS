//
//  Problem 3.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 13/09/22.
//

import Foundation

///Target defines the domain-specific interface used by the client code.
class IphoneHeadPhone {  //Target
    func wiredHeadPhone()-> String {
        return "iphone wired headphone"
    }
    
}

 /// The Adaptee contains some useful behavior, but its interface is incompatible
 /// with the existing client code. The Adaptee needs some adaptation before the
 /// client code can use it.
class Iphone13 { // Adaptee
    func universalCTypePort()-> String {
        return "C-Type universal lighting port"
    }
    
}

/// The client code supports all classes that follow the Target interface.
class PlugAndPlayMusic { //Client
    func playSong(plug headPhonePort: IphoneHeadPhone)-> String {
        return headPhonePort.wiredHeadPhone()
    }
    
}

// Because iphone 13 do not support 3.3mm head phone, so you can not directly listen song
//from 3.3mm head phone. You need an Adapter so, you can connect C-Type connector to iphone 13 lighting port and 3.3mm head phone to adapter
