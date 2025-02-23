//
//  AppCoordinator.swift
//  TaskManager
//
//  Created by Ibrahim Gedami on 23/02/2025.
//

import Foundation
import SwiftUI

@MainActor
class AppCoordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    
    var navigationBinding: Binding<NavigationPath> {
        Binding(
            get: { [weak self] in self?.path ?? NavigationPath() },
            set: { [weak self] newPath in self?.path = newPath }
        )
    }
    
    func start() -> some View {
        NavigationStack(path: navigationBinding) {
            HomeView()
                .environmentObject(self)
        }
    }
    
    func navigateToDetails(task: TaskModel) {
        path.append(AppRoute.details(task))
    }
    
    func goBack() {
        path.removeLast()
    }

}

enum AppRoute: Hashable {
    
    case details(TaskModel)
    
}
