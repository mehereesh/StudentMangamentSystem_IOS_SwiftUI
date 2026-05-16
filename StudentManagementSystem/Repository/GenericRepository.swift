//
//  GenericRepository.swift
//  StudentManagementSystem
//
//  Created by RPS on 16/05/26.
//

import Foundation

class GenericRepository<T: Identifiable & Codable>: CRUDProtocol where T.ID == UUID {
    
    private var items: [T] = []
    
    // Create
    func create(_ item: T) throws {
        items.append(item)
    }
    
    // Fetch
    func fetchAll() -> [T] {
        return items
    }
    
    // Update
    func update(id: UUID, with item: T) throws {
        
        guard let index = items.firstIndex(where: {
            $0.id == id
        }) else {
            
            throw NSError(
                domain: "Student Error",
                code: 404,
                userInfo: [
                    NSLocalizedDescriptionKey: "Item not found"
                ]
            )
        }
        
        items[index] = item
    }
    
    // Delete
    func delete(id: UUID) throws {
        
        guard let index = items.firstIndex(where: {
            $0.id == id
        }) else {
            
            throw NSError(
                domain: "Student Error",
                code: 404,
                userInfo: [
                    NSLocalizedDescriptionKey: "Item not found"
                ]
            )
        }
        
        items.remove(at: index)
    }
}
