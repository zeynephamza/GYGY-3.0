//
//  Date.swift
//  ZBus-Ticket
//
//  Created by Zeynep Özcan on 21.03.2024.
//

import Foundation


class Date {
    var day: Int?
    var month: Int?
    var year: Int?
    
    init() {
        day = 1
        month = 1
        year = 2024
    }
    
    init(day: Int, month: Int, year: Int) {
        self.day = day
        self.month = month
        self.year = year
    }
    
    func print() -> String {
        let str: String = "Date: \(day ?? 1)/\(month ?? 1)/\(year ?? 1)"
        
        return str
    }
}

var date = Date()
