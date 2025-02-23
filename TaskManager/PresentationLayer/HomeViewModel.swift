//
//  HomeViewModel.swift
//  TaskManager
//
//  Created by Ibrahim Gedami on 23/02/2025.
//

import Foundation
import Combine

@MainActor
final class HomeViewModel: ObservableObject {
    
    @Published var tasks: [TaskModel] = []
    private var cancellables = Set<AnyCancellable>()
    private let taskService: TaskService // Store as an actor
    
    // Inject TaskService as an actor
    init(taskService: TaskService = TaskService()) {
        self.taskService = taskService
    }
    
    // Fetch tasks using async/await
    func fetchTasks() async {
        do {
            tasks = try await taskService.fetchTasks()
        } catch {
            debugPrint("Error fetching tasks: \(error)")
        }
    }
    
    // Fetch tasks using Combine
    func fetchTasksCombine() {
        taskService.fetchTasksPublisher()
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    debugPrint("Error: \(error)")
                }
            }, receiveValue: { [weak self] tasks in
                self?.tasks = tasks
            })
            .store(in: &cancellables)
    }
}
