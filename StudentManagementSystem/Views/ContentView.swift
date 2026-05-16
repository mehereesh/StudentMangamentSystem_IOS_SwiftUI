//
//  ContentView.swift
//  StudentManagementSystem
//
//  Created by RPS on 16/05/26.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = StudentViewModel()
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                // Error Message
                if !viewModel.errorMessage.isEmpty {
                    
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
                
                // Student List
                List {
                    
                    ForEach(viewModel.students) { student in
                        
                        StudentRowView(student: student)
                    }
                    .onDelete(perform: deleteStudent)
                }
                
                // Navigation Button
                NavigationLink(destination:
                                AddStudentView(viewModel: viewModel)) {
                    
                    Text("Add Student")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding()
                }
            }
            .navigationTitle("Student Management")
        }
    }
    
    // Delete Function
    func deleteStudent(at offsets: IndexSet) {
        
        for index in offsets {
            
            let student = viewModel.students[index]
            
            viewModel.deleteStudent(student: student)
        }
    }
}
