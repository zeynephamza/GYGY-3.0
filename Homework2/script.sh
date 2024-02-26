#!/usr/bin/env swift

import Foundation

let cities: [String] = ["Nairobi", "Berlin", "Tokyo", "Helsinki", "Rio"]
print("Cities =  \(cities)")
print("Please select a city:")

let city: String = readLine(strippingNewline: true) ?? ""

if let index = cities.firstIndex(of: city) {
   print("\(city) found in array at the \(index). index.")
} else {
   print("\(city) could not found.")
}
