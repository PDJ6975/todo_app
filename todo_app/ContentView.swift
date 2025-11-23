//
//  ContentView.swift
//  todo_app
//
//  Created by Antonio Rodríguez Calderón on 21/11/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Query var tasks: [TodoTask]
    @Environment(\.modelContext) private var modelContext
    @State private var showingAddTask = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(tasks) {
                    task in HStack {
                        Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle" )
                            .foregroundColor(task.isCompleted ? .green : .primary)
                        Text(task.name)
                            .strikethrough(task.isCompleted)
                            .foregroundColor(task.isCompleted ? .gray : .primary)
                    }
                    .onTapGesture {
                        task.isCompleted.toggle()
                    }
                }
                .onDelete(perform: deleteTask)
            }
            .navigationTitle("Mis Tareas")
            .toolbar {
                Button(action: {
                    showingAddTask = true
                }) {Image (systemName: "plus")}
            }
            .sheet(isPresented: $showingAddTask) {
                AddTaskViewNew()
            }
        }
    }
    
    func deleteTask(at offsets: IndexSet) {
        for index in offsets {
            let task = tasks[index]
            modelContext.delete(task)
        }
    }
    
}

#Preview {
    ContentView()
        .modelContainer(for: TodoTask.self)
}
