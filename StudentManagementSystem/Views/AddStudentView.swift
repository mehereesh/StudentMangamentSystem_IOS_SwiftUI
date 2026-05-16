//
//  AddStudentView.swift
//  StudentManagementSystem
//
//  Created by RPS on 16/05/26.
//
import SwiftUI

struct AddStudentView: View {
    
    @ObservedObject var viewModel: StudentViewModel
    
    @State private var name: String = ""
    @State private var marks: String = ""
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Text("Add New Student")
                .font(.largeTitle)
                .bold()
            
            // Name Field
            TextField("Enter Student Name",
                      text: $name)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            
            // Marks Field
            TextField("Enter Marks",
                      text: $marks)
                .keyboardType(.decimalPad)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            
            // Save Button
            Button(action: {
                
                if let marksValue = Double(marks) {
                    
                    viewModel.addStudent(
                        name: name,
                        marks: marksValue
                    )
                    
                    // Clear Fields
                    name = ""
                    marks = ""
                }
            }) {
                
                Text("Save Student")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Add Student")
    }
}
