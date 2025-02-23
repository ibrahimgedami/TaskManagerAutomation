//
//  TaskManagerApp.swift
//  TaskManager
//
//  Created by Ibrahim Gedami on 23/02/2025.
//

import SwiftUI

@main
struct TaskManagerApp: App {
    
    @StateObject private var coordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            coordinator.start()
                .environmentObject(coordinator)
        }
    }
    
}

