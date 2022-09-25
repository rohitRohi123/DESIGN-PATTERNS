//
//  Problem 13.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 25/09/22.
//

import Foundation

class WarcraftScreen {
    func loading() {
        clearTempFiles()
        loadLocalData()
        loadSound()
        loadBackgroundSound()
        initialiseProfile()
    }
    
    func clearTempFiles() {
        debugPrint("ClearTempFiles")
    }
    
    func loadLocalData() {
        debugPrint("Load Warcraft objects")
    }
    
    func loadSound() {
        debugPrint("Load Warcraft sound")
    }
    
    func loadBackgroundSound() {
        debugPrint("Background sound loaded")
    }
    
    func initialiseProfile() {
        debugPrint("Initialize war craft profiles")
    }
 }


class DiabloScreen {
    func loading() {
        clearTempFiles()
        loadLocalData()
        loadSound()
        loadBackgroundSound()
        initialiseProfile()
    }
    
    func clearTempFiles() {
        debugPrint("ClearTempFiles")
    }
    
    func loadLocalData() {
        debugPrint("Load Diab objects")
    }
    
    func loadSound() {
        debugPrint("Load Diab sound")
    }
    
    func loadBackgroundSound() {
        debugPrint("Backround sound loaded")
    }
    
    func initialiseProfile() {
        debugPrint("Initialize Diablo profiles")
    }
 }


//As you can see there are duplicate code in both classes
