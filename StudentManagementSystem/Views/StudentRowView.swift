//
//  StudentRowView.swift
//  StudentManagementSystem
//
//  Created by RPS on 16/05/26.
//

import SwiftUI

struct StudentRowView: View {
    
    let student: Student
    
    var body: some View {
        
        HStack {
            
            VStack(alignment: .leading,
                   spacing: 5) {
                
                Text(student.name)
                    .font(.headline)
                
                Text("Student ID:")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Text(student.id.uuidString)
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .lineLimit(1)
                
                Text("Marks: \(student.marks, specifier: "%.2f")")
                    .font(.subheadline)
                    .foregroundColor(.blue)
            }
            
            Spacer()
        }
        .padding(5)
    }
}
