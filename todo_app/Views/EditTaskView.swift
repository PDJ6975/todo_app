//
//  EditTaskView.swift
//  todo_app
//
//  Created by Antonio Rodríguez Calderón on 23/11/25.
//

import SwiftUI
import SwiftData

struct EditTaskView: View {
    
    @Bindable var task: TodoTask
    @State private var hasDeadline: Bool = false
    @State private var deadline: Date = Date()
    
    init(task: TodoTask) {
        self.task = task
        _hasDeadline = State(initialValue: task.dateToComplete != nil)
        _deadline = State(initialValue: task.dateToComplete ?? Date())
    }
    
    var body: some View {
       NavigationStack {
            Form {
                
                Section("Nombre") {
                    TextField("Nombre de la tarea...", text: $task.name)
                }
                
                Section("Detalles") {
                    TextField("Añade los detalles...", text: Binding (
                        get: { task.details ?? ""},
                        set: { task.details = $0 }))
                }
                
                Section("Fecha Límite") {
                    
                    Toggle("Añadir fecha", isOn: $hasDeadline)
                    
                    if hasDeadline {
                        DatePicker("Fecha", selection: $deadline, displayedComponents: [.date,.hourAndMinute])
                    }
                    
                }
                
           }
            .onChange(of: hasDeadline, { oldValue, newValue in
                if newValue {
                    task.dateToComplete = deadline
                } else {
                    task.dateToComplete = nil
                }
            })
            .onChange(of: deadline, { oldValue, newValue in
                if hasDeadline {
                    task.dateToComplete = newValue
                }
            })
            .navigationTitle(Text("Detalles de la Tarea"))
        }
    }
}

#Preview {
    EditTaskView(task: TodoTask(name: "Tarea de ejemplo",details: "Prueba",dateToComplete: Date())).modelContainer(for: TodoTask.self)
}
