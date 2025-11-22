//
//  Task.swift
//  todo_app
//
//  Created by Antonio Rodríguez Calderón on 21/11/25.
//

import Foundation
import SwiftData

@Model
class TodoTask: Identifiable {
    
    var name: String
    var details: String?
    var dateAdded: Date
    var dateToComplete: Date?
    var isCompleted: Bool
    
    init(name: String, details: String? = nil, dateToComplete: Date? = nil) {
        self.name = name
        self.details = details
        self.dateAdded = Date()
        self.dateToComplete = dateToComplete
        self.isCompleted = false
    }
}


