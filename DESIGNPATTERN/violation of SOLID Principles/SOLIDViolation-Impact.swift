//
//  SOLIDViolantion-Impact.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 13/12/22.
//

import Foundation

class Hotel {
    private var availableRooms: [Room]
    private var availableGuest: [Guest] = []
    
    init(availableRooms: [Room]) {
        self.availableRooms = availableRooms
    }
    
    func bookRoom(for guest: String,
                  and startDate: Date,
                  endDate: Date) {
        guard availableRooms.count > 0 else {
            debugPrint("No room available")
            return
        }
        
        let renter = Guest(name: guest, room: availableRooms.removeLast(), bookingStartDate: startDate, bookingEndtDate: endDate)
        availableGuest.append(renter)
    }
    
}


class Person {
    let name: String
    let surname: String
    let age: Int

     init(name: String,
          surname: String,
          age: Int) {
           self.name = name
           self.surname = surname
           self.age = age
     }
    
}

// Here you do not care about Renter’s age & surname. But Child class get by as Derived value. So, it increase memory foot print.
class Guest:  Person {
    fileprivate var room: Room?
    fileprivate var bookingStartDate: Date?
    fileprivate var bookingEndtDate: Date?
    
    override init(name: String, surname: String, age: Int) {
        super.init(name: name, surname: "", age: 0)
    }
    
    convenience init(name: String,
                     room: Room,
                     bookingStartDate: Date,
                     bookingEndtDate:Date) {
        self.init(name: name, surname: "", age: 0)
        
        self.room = room
        self.bookingStartDate = bookingStartDate
        self.bookingEndtDate = bookingEndtDate
    }
}

struct Room {
    let type: RoomType
    init(type: RoomType) {
        self.type = type
    }
    
    enum RoomType {
        case standard, classic, delux, gold
    }
}


//
class YourViewController {
     // UI Code
    //  Data Manipulation code
   //   UI Presentation Logic
  //    API Code
}

//Road Transportation,
class XYZTransport {
    var availableVehicle: [ABCTruck]
 
    init(availableVehicle: [ABCTruck]) {
        self.availableVehicle = availableVehicle
    }
    
     func bookedVehicle() {
           var vehicle =   availableVehicle.removeLast()
           vehicle.source = ""
           vehicle.destination = ""
    }

     func startShipping(with vehicle: ABCTruck) {
           
    }

   func trackDelivery(with vehicle: ABCTruck) {

  }
}

