//
//  Builder Patterns Use1.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 12/09/22.
//

import Foundation
import UIKit
//Agenda
//1. Use the builder pattern to contruct a complex object.
//2. We are going to construct Desktop screen


/* CLIENT CODE 
 let macbookBuilder = MacbookDesktopBuilder()
 let thinkpadBuilder = ThinkPadDesktopBuilder()
 let hpBuilder = HPDesktopBuilder()
  
 let director = Director(with: macbookBuilder)
 let desktop = director.buildDesktop()
 desktop?.showSpecs();
 
 director.update(builder: hpBuilder)
 let hpdesktop = director.buildDesktop()
 hpdesktop?.showSpecs();
 
 director.update(builder: thinkpadBuilder)
 let thinkpaddesktop = director.buildDesktop()
 thinkpaddesktop?.showSpecs();
 */


class Director {
    private var builder: IBuilder
    init(with builder: IBuilder) {
        self.builder = builder
    }
    
    func update(builder: IBuilder) {
        self.builder = builder
    }
    
    func buildDesktop()-> DesktopProtocol? {
        builder.buildName()
        builder.buildScreenSize()
        builder.buildColor()
        builder.buildRam()
        builder.buildMotherboard()
        builder.buildMouseport()
        builder.buildKeyboardport()
        builder.buildBattery()
        return builder.getDesktop()
    }
    
}



protocol IBuilder {
    func buildName()
    func buildScreenSize()
    func buildColor()
    func buildRam()
    func buildMotherboard()
    func buildMouseport()
    func buildKeyboardport()
    func buildBattery()
    func getDesktop()-> DesktopProtocol
}

class HPDesktopBuilder: IBuilder {
    fileprivate let hpDesktop: DesktopProtocol = Desktop()
    
    func buildName() {
        hpDesktop.set(name: "HP Desktop")
    }
    
    func buildScreenSize() {
        hpDesktop.set(screenSize: CGSize(width: 1024, height: 1024))
    }
    
    func buildColor() {
        hpDesktop.set(color: "Black")
    }
    
    func buildRam() {
        hpDesktop.set(ram: "6 GB RAM")
    }
    
    func buildMotherboard() {
        hpDesktop.set(motherBoard: "Intel motherboard")
    }
    
    func buildMouseport() {
        hpDesktop.set(mousePort: "USB")
    }
    
    func buildKeyboardport() {
        hpDesktop.set(keyboardPort: "USB")
    }
    
    func buildBattery() {
        hpDesktop.set(battery: "HP 200")
    }
    
    func getDesktop() -> DesktopProtocol {
        return self.hpDesktop
    }
}

class ThinkPadDesktopBuilder: IBuilder {
    fileprivate let thinkpadDesktop: DesktopProtocol = Desktop()
    
    func buildName() {
        thinkpadDesktop.set(name: "Think PAD")
    }
    
    func buildScreenSize() {
        thinkpadDesktop.set(screenSize: CGSize(width: 1024, height: 1024))
    }
    
    func buildColor() {
        thinkpadDesktop.set(color: "Black")
    }
    
    func buildRam() {
        thinkpadDesktop.set(ram: "8 GB RAM")
    }
    
    func buildMotherboard() {
        thinkpadDesktop.set(motherBoard: "Intel motherboard")
    }
    
    func buildMouseport() {
        thinkpadDesktop.set(mousePort: "USB")
    }
    
    func buildKeyboardport() {
        thinkpadDesktop.set(keyboardPort: "USB")
    }
    
    func buildBattery() {
        thinkpadDesktop.set(battery: "HP 200")
    }
    
    func getDesktop() -> DesktopProtocol {
        return self.thinkpadDesktop
    }
}

class MacbookDesktopBuilder: IBuilder {
    fileprivate let macbookDesktop: DesktopProtocol = Desktop()
    
    func buildName() {
        macbookDesktop.set(name: "MAC BOOK PRO+")
    }
    
    func buildScreenSize() {
        macbookDesktop.set(screenSize: CGSize(width: 1024, height: 1024))
    }
    
    func buildColor() {
        macbookDesktop.set(color: "Siler")
    }
    
    func buildRam() {
        macbookDesktop.set(ram: "16 GB RAM")
    }
    
    func buildMotherboard() {
        macbookDesktop.set(motherBoard: "M3 Chip")
    }
    
    func buildMouseport() {
        macbookDesktop.set(mousePort: "C-Type")
    }
    
    func buildKeyboardport() {
        macbookDesktop.set(keyboardPort: "C-Type")
    }
    
    func buildBattery() {
        macbookDesktop.set(battery: "Apple battery")
    }
    
    func getDesktop() -> DesktopProtocol {
        return self.macbookDesktop
    }
}

protocol DesktopProtocol {
    func set(name: String)
    func getName()-> String?
    func set(screenSize: CGSize)
    func getSize()-> CGSize?
    func set(color: String)
    func getColor()-> String?
    func set(ram: String)
    func getRam()-> String?
    func set(motherBoard: String)
    func getMotherBoard()-> String?
    func set(mousePort: String)
    func getMousePort()-> String?
    func set(keyboardPort: String)
    func getKeyboardPort()-> String?
    func set(battery: String)
    func getBattery()-> String?
    func showSpecs()
}

class Desktop: DesktopProtocol {
    private var name: String?
    private var screenSize: CGSize?
    private var color: String?
    private var ram: String?
    private var motherBoard: String?
    private var mousePort: String?
    private var keyboardPort: String?
    private var battery: String?
    
    func set(name: String) {
        self.name = name
    }
    
    func getName()-> String? {
        return self.name
    }
    
    func set(screenSize: CGSize) {
        self.screenSize = screenSize
    }
    
    func getSize()-> CGSize? {
        return self.screenSize
    }
    
    func set(color: String) {
        self.color = color
    }
    
    func getColor()-> String? {
        return self.color
    }
    
    func set(ram: String) {
        self.ram = ram
    }
     
    func getRam()-> String? {
        return self.ram
    }
    
    func set(motherBoard: String) {
        self.motherBoard = motherBoard
    }
    
    func getMotherBoard()-> String? {
        return self.motherBoard
    }
    
    func set(mousePort: String) {
        self.mousePort = mousePort
    }
    
    func getMousePort()-> String? {
        return self.mousePort
    }
    
    func set(keyboardPort: String) {
        self.keyboardPort = keyboardPort
    }
    
    func getKeyboardPort()-> String? {
        return self.keyboardPort
    }
    
    func set(battery: String) {
        self.battery = battery
    }
    
    func getBattery()-> String? {
        return self.battery
    }
    
    
    func showSpecs() {
         debugPrint("Destop Specifications = name \(name), screen size \(screenSize), color: \(color), ram: \(ram), motherboard: \(motherBoard),  mousePort = \(mousePort), keyboard = \(keyboardPort) and battery = \(battery)")
    }
    
}
