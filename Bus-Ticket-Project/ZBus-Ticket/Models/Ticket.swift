//
//  Ticket.swift
//  ZBus-Ticket
//
//  Created by Zeynep Özcan on 21.03.2024.
//

import Foundation

class Ticket {
    var passenger: Passenger?
    var date: Date?
    var time: Time?
    var seats: [Int]?
    var seatCount: Int?
    
    init() {
        passenger = Passenger()
        date = Date()
        time = Time()
        seats = []
        seatCount = 0
    }
    
    init(passenger: Passenger, date: Date, time: Time, seats: [Int], seatCount: Int) {
        self.passenger = passenger
        self.date = date
        self.time = time
        self.seats = seats
        self.seatCount = seatCount
    }
    
    func print() -> String {
        var str1: String = passenger?.print() ?? ""
        str1 += "\n\(date?.print() ?? "")"
        str1 += "\n\(time?.print() ?? "")"
        str1 += "\nSeats: \(seats ?? [])"
        //let str: String = passenger?.print() ?? "" + "lübürük"
        //+ "\n\(date?.print() ?? "") " + "\n\(time?.print() ?? "") " + "\nSeats: \(seats ?? [])"
                          
        
        return str1
        
    }
    
}


var ticket = Ticket()




