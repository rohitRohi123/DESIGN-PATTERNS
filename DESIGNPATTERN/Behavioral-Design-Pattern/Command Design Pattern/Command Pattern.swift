//
//  Command Pattern.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 21/09/22.
//

import Foundation

class PlayWithRemote {
    private var onButton: DeviceButton?
    private var offButton: DeviceButton?
    private var volumeUpButton: DeviceButton?
    private var volumeDownButton: DeviceButton?
    
    init(with device: ElectronicDevice) {
        let onComman = DeviceOnCommand(with: device)
        let offComman = DeviceOffCommand(with: device)
        let volumeUpCommand = DeviceVolumeUpCommand(with: device)
        let volumeDownCommand = DeviceVolumeDownCommand(with: device)
        
        onButton = DeviceButton(with: onComman)
        offButton = DeviceButton(with: offComman)
        volumeUpButton = DeviceButton(with: volumeUpCommand)
        volumeDownButton = DeviceButton(with: volumeDownCommand)
    }
    
    func onTV() {
        onButton?.press()
    }
    
    func offTV() {
        offButton?.press()
    }
    
    func volumeUp() {
        volumeUpButton?.press()
    }
    
    func volumenDown() {
        volumeDownButton?.press()
    }
}


class TVRemote {
    static func getDevice()-> ElectronicDevice {
        return Telivesion()
        
    }
    
}

//MARK: - Invoker
class DeviceButton { //Invoker, and invoker know nothing about command
    private let command: Command
    init(with command: Command) {
        self.command = command
        
    }
    
    func press() {
        self.command.execute()
    }
}

//MARK: - Commands
protocol Command {
    func execute()
}

struct DeviceOnCommand: Command {
    private let device: ElectronicDevice
    
    init(with device: ElectronicDevice) {
        self.device = device
    }
    
    func execute() {
        self.device.on()
    }
    
}

struct DeviceOffCommand: Command {
    private let device: ElectronicDevice
    
    init(with device: ElectronicDevice) {
        self.device = device
    }
    
    func execute() {
        self.device.off()
    }
    
}


struct DeviceVolumeUpCommand: Command {
    private let device: ElectronicDevice
    
    init(with device: ElectronicDevice) {
        self.device = device
    }
    
    func execute() {
        self.device.volumeUp()
    }
    
}

struct DeviceVolumeDownCommand: Command {
    private let device: ElectronicDevice
    
    init(with device: ElectronicDevice) {
        self.device = device
    }
    
    func execute() {
        self.device.volumeDown()
    }
    
}


//MARK: - Receiver
protocol ElectronicDevice { //Interface for receiver
    func on()
    func off()
    func volumeUp()
    func volumeDown()
}


class Telivesion: ElectronicDevice { // Receiver
    private var volume: Int = 0
    
    func on() {
        debugPrint("Device is on")
    }
    
    func off() {
        debugPrint("Device is off")
    }
    
    func volumeUp() {
        self.volume += 1
        debugPrint("Current volume = \(self.volume)")
    }
    
    func volumeDown() {
        self.volume -= 1
        debugPrint("Current volume = \(self.volume)")
    }
    
}


/* Client Code
 let tvRemote =  PlayWithRemote(with: TVRemote.getDevice())
 tvRemote.onTV()
 tvRemote.volumeUp()
 tvRemote.volumeUp()
 tvRemote.volumeUp()
 tvRemote.volumenDown()
 tvRemote.volumenDown()
 tvRemote.offTV()
 */
