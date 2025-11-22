//
//  AddTaskViewNew.swift
//  todo_app
//
//  Created by Antonio Rodríguez Calderón on 22/11/25.
//

import SwiftUI
import SwiftData

struct AddTaskViewNew: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss // Para cerrar el sheet
    
    @State private var taskName: String = ""
    @State private var taskDetail: String = ""
    @State private var hasDeadline: Bool = false
    @State private var deadline: Date = Date()
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Nombre") {
                    TextField("Nombre de la tarea...", text: $taskName)
                }
                
                Section("Descripción") {
                    TextField("Añade los detalles...",text: $taskDetail, axis: .vertical) // vertical para texto hacia abajo
                        .lineLimit(3...6) // Por defecto 3 líneas, máximo 6
                }
                
                Section("Fecha Límite") {
                    Toggle("Añadir fecha", isOn: $hasDeadline)
                    
                    if hasDeadline {
                        DatePicker("Fecha", selection: $deadline, displayedComponents: [.date,.hourAndMinute])
                    }
                }
            }
            .navigationTitle(Text("Agregar Tarea"))
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Guardar") {
                        let newTask = TodoTask(name: taskName, details: taskDetail, dateToComplete: hasDeadline ? deadline : nil)
                        modelContext.insert(newTask)
                        dismiss()
                    }
                    .disabled(taskName.isEmpty)
                }
            }
        }
    }
}

#Preview {
    AddTaskViewNew()
        .modelContainer(for: TodoTask.self)
}
