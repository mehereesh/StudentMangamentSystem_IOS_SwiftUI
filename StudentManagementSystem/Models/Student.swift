//
//  Student.swift
//  StudentManagementSystem
//
//  Created by RPS on 16/05/26.
//

import Foundation

struct Student: Identifiable, Codable {
    
    let id: UUID
    var name: String
    var marks: Double
    
    init(id: UUID = UUID(),
         name: String,
         marks: Double) {
        
        self.id = id
        self.name = name
        self.marks = marks
    }
}
