//
//  Array+Extension.swift
//  StudentManagementSystem
//
//  Created by RPS on 16/05/26.
//
import Foundation

extension Array {
    
    // Safe Index Access
    subscript(safe index: Int) -> Element? {
        
        guard indices.contains(index) else {
            return nil
        }
        
        return self[index]
    }
}
