//
//  TaskService.swift
//  TaskManager
//
//  Created by Ibrahim Gedami on 23/02/2025.
//

import Foundation
import Combine

protocol TaskServiceProtocol {
    
    func fetchTasks() async throws -> [TaskModel]
    func fetchTasksPublisher() -> AnyPublisher<[TaskModel], Error>
    
}

actor TaskService: TaskServiceProtocol {
    
    private let baseURL: String = "https://jsonplaceholder.typicode.com/todos"

    // MARK: - Async/Await Version
    func fetchTasks() async throws -> [TaskModel] {
        guard let url = URL(string: baseURL) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode([TaskModel].self, from: data)
    }
    
    // MARK: - Combine Version (Needs to be accessed outside the actor)
    nonisolated func fetchTasksPublisher() -> AnyPublisher<[TaskModel], Error> {
        guard let url = URL(string: baseURL) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [TaskModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

}
