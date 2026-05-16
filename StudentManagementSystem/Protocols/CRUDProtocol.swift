//
//  CRUDProtocol.swift
//  StudentManagementSystem
//
//  Created by RPS on 16/05/26.
//

import Foundation

protocol CRUDProtocol {
    
    associatedtype Item
    
    func create(_ item: Item) throws
    
    func fetchAll() -> [Item]
    
    func update(id: UUID,
                with item: Item) throws
    
    func delete(id: UUID) throws
}
