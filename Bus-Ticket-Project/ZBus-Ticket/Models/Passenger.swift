//
//  Passenger.swift
//  ZBus-Ticket
//
//  Created by Zeynep Özcan on 21.03.2024.
//

import Foundation

class Passenger {
    var name: String?
    var surname: String?
    var id: Int?
    
    init() {
        name = ""
        surname = ""
        id = 0
    }
    
    init(name: String, surname: String, id: Int) {
        self.name = name
        self.surname = surname
        self.id = id
    }
    
    func print() -> String{
        var str: String = "Name: \(name ?? "")\nSurname: \(surname ?? "")\nId:\(id ?? 0) "
        
        return str
    }
}

var passenger = Passenger()
