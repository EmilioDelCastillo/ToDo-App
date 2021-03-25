//
//  Conversion.swift
//  ToDo App
//
//  Created by Emilio Del Castillo on 25/03/2021.
//

import Foundation

extension String {
    var bool: Bool {
        switch self.lowercased() {
        case "true":
            fallthrough
        case "yes":
            return true
        default:
            return false
        }
    }
}

extension Bool {
    var string: String {
        if self {
            return "true"
        } else {
            return "false"
        }
    }
    
    /**
     Reverse the boolean. If true, become false, if false, become true.
     */
    mutating func reverse() {
        self = !self
    }
}
