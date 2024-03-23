//
//  Time.swift
//  ZBus-Ticket
//
//  Created by Zeynep Özcan on 21.03.2024.
//

import Foundation

class Time {
    var hour: Int?
    var minute: Int?
    
    init() {
        hour = 0
        minute = 0
    }
    
    init(hour: Int, minute: Int) {
        self.hour = hour
        self.minute = minute
    }
    
    func print() -> String {
        var str: String = "Time: \(hour ?? 0) : \(minute ?? 0)"
        
        return str
    }
}

var time = Time()
