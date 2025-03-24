//
//  TodoEntity.swift
//  EffectiveMobile
//
//  Created by Дмитрий Трушин on 18/03/2025.
//

import Foundation
import UIKit


struct TodoModel: Codable {
    let id: Int
    let todo: String
    let isCompleted: Bool
    let userId: Int
    let createdAt: String?
    
    var formattedDate: String {
        if let createdAt = createdAt, !createdAt.isEmpty {
            return formatDate(createdAt)
        } else {
            return "Дата не указана"
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case todo
        case isCompleted = "completed"
        case userId
        case createdAt
    }
        
    private func formatDate(_ dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let date = formatter.date(from: dateString) {
            formatter.dateFormat = "dd/MM/yy"
            return formatter.string(from: date)
        }
        return "Некорректная дата"
    }
}

struct TodoResponse: Codable {
    let todos: [TodoModel]
}
