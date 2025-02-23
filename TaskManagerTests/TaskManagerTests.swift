//
//  TaskManagerTests.swift
//  TaskManagerTests
//
//  Created by Ibrahim Gedami on 23/02/2025.
//

import Testing
@testable import TaskManager

struct TaskServiceTests {
    
    let taskService = TaskService()
    
    @Test
    func testFetchTasks() async throws {
        let tasks = try await taskService.fetchTasks()
//        expect(tasks).toNotBeEmpty()
    }

}
