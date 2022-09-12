//
//  Problem-2.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 12/09/22.
//

import Foundation
import UIKit

//MARK: - Build A CAR
class MyCar {
    var name: String
    var engine: String
    var chassis: String
    var headLight: String
    
    var seat: String
    var isLuxurySeat: Bool
    var seatColor: UIColor
    
    var gear: String
    var isAutoGear: Bool
    
    var window: String
    var isLuxuryWindow: Bool
    
    var rooftop: String
    var isSlideRooftop: Bool
    var isCompleteSlideRoofTop: Bool
    
    var carMusic: String
    var isLuxuryCarMusicSystem: Bool
    
    init(name: String,
         engine: String,
         chassis: String,
         headLight: String,
         seat: String,
         isLuxurySeat: Bool = false,
         seatColor: UIColor,
         gear: String,
         isAutoGear: Bool = false,
         window: String,
         isLuxuryWindow: Bool = false,
         rooftop: String,
         isSlideRooftop: Bool = false,
         isCompleteSlideRoofTop: Bool = false,
         carMusic: String,
         isLuxuryCarMusicSystem: Bool = false) {
        self.name = name
        self.engine = engine
        self.chassis = chassis
        self.headLight = headLight
        self.seat = seat
        self.isLuxurySeat = isLuxurySeat
        self.seatColor = seatColor
        self.gear = gear
        self.isAutoGear = isAutoGear
        self.window = window
        self.isLuxuryWindow = isLuxuryWindow
        self.rooftop = rooftop
        self.isSlideRooftop = isSlideRooftop
        self.isCompleteSlideRoofTop = isCompleteSlideRoofTop
        self.carMusic = carMusic
        self.isLuxuryCarMusicSystem = isLuxuryCarMusicSystem
    }

    //Now you want to Construct car with different configuration, so you have to write different initializer with different configuration but this make code unreadable so, for the solution of such type of conditions you can use Builder Pattern.
}

