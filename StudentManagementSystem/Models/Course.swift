//
//  Course.swift
//  StudentManagementSystem
//
//  Created by RPS on 16/05/26.
//

import Foundation

struct Course: Identifiable, Codable {
    
    let id: UUID
    var name: String
    
    init(id: UUID = UUID(),
         name: String) {
        
        self.id = id
        self.name = name
    }
}
