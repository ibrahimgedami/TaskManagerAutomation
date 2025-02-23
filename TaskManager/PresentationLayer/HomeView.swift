//
//  HomeView.swift
//  TaskManager
//
//  Created by Ibrahim Gedami on 23/02/2025.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
        
    var body: some View {
        NavigationStack {
            List(viewModel.tasks) { task in
                HStack {
                    if let title = task.title {
                        Text(title)
                    }
                    Spacer()
                    if let isCompleted = task.completed,
                       isCompleted {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundStyle(.green)
                    }
                }
            }
            .task {
                await viewModel.fetchTasks()
            }
            .navigationTitle("Tasks")
        }
    }

}
