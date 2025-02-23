//
//  TaskDetailsView.swift
//  TaskManager
//
//  Created by Ibrahim Gedami on 23/02/2025.
//

import SwiftUI

struct TaskDetailsView: View {
    
    let task: TaskModel
    @EnvironmentObject var coordinator: AppCoordinator
    
    var body: some View {
        VStack {
            if let title = task.title {
                Text(title)
                    .font(.title)
            }
            
            Button("Back") {
                coordinator.goBack()
            }
        }
        .navigationTitle("Task Details")
    }

}
