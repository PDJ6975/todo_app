//
//  Category.swift
//  todo_app
//
//  Created by Antonio Rodríguez Calderón on 29/11/25.
//

import Foundation
import SwiftData

@Model
class Category: Identifiable {
    
    var name: String
    var icon: String
    var color: String
    
    // Explicamos propiedades de la relación
    @Relationship(deleteRule: .nullify, inverse: \TodoTask.category)
    var tasks: [TodoTask] = []
    
    init(name: String, icon: String, color: String) {
        self.name = name
        self.icon = icon
        self.color = color
    }
    
}
