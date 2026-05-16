//
//  StudentRepository.swift
//  StudentManagementSystem
//
//  Created by RPS on 16/05/26.
//

import Foundation

class StudentRepository: GenericRepository<Student> {
    
    // Update Student Marks
    func updateMarks(studentId: UUID,
                     marks: Double) throws {
        
        // Validate Marks
        guard marks >= 0 && marks <= 100 else {
            
            throw NSError(
                domain: "Marks Error",
                code: 400,
                userInfo: [
                    NSLocalizedDescriptionKey:
                        "Marks should be between 0 and 100"
                ]
            )
        }
        
        var students = fetchAll()
        
        // Find Student
        guard let index = students.firstIndex(where: {
            $0.id == studentId
        }) else {
            
            throw NSError(
                domain: "Student Error",
                code: 404,
                userInfo: [
                    NSLocalizedDescriptionKey:
                        "Student not found"
                ]
            )
        }
        
        // Update Marks
        students[index].marks = marks
        
        try update(id: studentId,
                   with: students[index])
        
        print("Marks updated successfully")
    }
}
