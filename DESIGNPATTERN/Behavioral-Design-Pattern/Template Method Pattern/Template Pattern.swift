//
//  Template Pattern.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 25/09/22.
//

import Foundation

protocol BaseGameLoder {
    func load()
    func clearTempFiles()
    func loadLocalData()
    func loadSound()
    func loadBackgroundSound()
    func initialiseProfile()
}

extension BaseGameLoder {
    func load() {
        clearTempFiles()
        loadLocalData()
        loadSound()
        loadBackgroundSound()
        initialiseProfile()
    }
    
    func clearTempFiles() {
        debugPrint("Delete temparary files")
    }
    
    func loadBackgroundSound() {
        debugPrint("Load Background Sound")
    }
}


class TWarcraftScreen: BaseGameLoder {
    func loadLocalData() {
        debugPrint("Load Warcraft objects")
    }
    
    func loadSound() {
        debugPrint("Load Warcraft sound")
    }
    
    func initialiseProfile() {
        debugPrint("Initialize war craft profiles")
    }
    
 }

class TDiabloScreen: BaseGameLoder {
    func loadLocalData() {
        debugPrint("Load Diab objects")
    }
    
    func loadSound() {
        debugPrint("Load Diab sound")
    }
    
    func initialiseProfile() {
        debugPrint("Initialize Diab craft profiles")
    }
 }
