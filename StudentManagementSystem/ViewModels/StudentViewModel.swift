//
//  StudentViewModel.swift
//  StudentManagementSystem
//
//  Created by RPS on 16/05/26.
//
import Foundation
import SwiftUI

class StudentViewModel: ObservableObject {
    
    @Published var students: [Student] = []
    
    @Published var errorMessage: String = ""
    
    private let repository = StudentRepository()
    
    init() {
        loadDummyStudents()
    }
    
    // Load Sample Data
    func loadDummyStudents() {
        
        do {
            
            try repository.create(
                Student(name: "John", marks: 85)
            )
            
            try repository.create(
                Student(name: "Emma", marks: 92)
            )
            
            try repository.create(
                Student(name: "David", marks: 76)
            )
            
            students = repository.fetchAll()
            
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    // Add Student
    func addStudent(name: String,
                    marks: Double) {
        
        do {
            
            guard marks >= 0 &&
                    marks <= 100 else {
                
                throw NSError(
                    domain: "Marks Error",
                    code: 400,
                    userInfo: [
                        NSLocalizedDescriptionKey:
                            "Marks should be between 0 and 100"
                    ]
                )
            }
            
            let student = Student(
                name: name,
                marks: marks
            )
            
            try repository.create(student)
            
            students = repository.fetchAll()
            
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    // Update Marks
    func updateMarks(student: Student,
                     newMarks: Double) {
        
        do {
            
            try repository.updateMarks(
                studentId: student.id,
                marks: newMarks
            )
            
            students = repository.fetchAll()
            
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    // Delete Student
    func deleteStudent(student: Student) {
        
        do {
            
            try repository.delete(id: student.id)
            
            students = repository.fetchAll()
            
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
