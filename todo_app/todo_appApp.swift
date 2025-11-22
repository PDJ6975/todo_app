//
//  todo_appApp.swift
//  todo_app
//
//  Created by Antonio Rodríguez Calderón on 21/11/25.
//

import SwiftUI
import SwiftData

@main
struct todo_appApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: TodoTask.self)
    }
}
