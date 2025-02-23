//
//  TaskModel.swift
//  TaskManager
//
//  Created by Ibrahim Gedami on 23/02/2025.
//

import Foundation

struct TaskModel: Codable, Identifiable, Hashable {
    
    let id, userId: Int?
    let title: String?
    let completed: Bool?
    
}
