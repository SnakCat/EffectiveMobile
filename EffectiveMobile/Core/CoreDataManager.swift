//
//  CoreDataManager.swift
//  EffectiveMobile
//
//  Created by Дмитрий Трушин on 18/03/2025.
//

import CoreData
import UIKit.UIApplication

final class CoreDataManager {
    
    static let instance = CoreDataManager()
    private init() { }
    
    func saveTodo(todoName: String, createdDate: Date, todoDescription: String, isCompleted: Bool) -> Result<Void, CoreDataError> {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return .failure(.error("AppDelegate not found"))
        }
        let managerContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "TodoEntity", in: managerContext)!
        let todo = NSManagedObject(entity: entity, insertInto: managerContext)
        
        todo.setValue(todoName, forKey: "todoName")
        todo.setValue(createdDate, forKey: "createdDate")
        todo.setValue(todoDescription, forKey: "todoDescription")
        todo.setValue(isCompleted, forKey: "isCompleted")
        
        do {
            try managerContext.save()
        } catch {
            return .failure(.error("Cloud not save \(error)"))
        }
        return .success(())
    }
    
    func loadTodo() -> Result<[TodoEntity], CoreDataError> {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return .failure(.error("AppDelegate not found"))
        }
        let managerContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<TodoEntity>(entityName: "TodoEntity")
        
        do {
            let object = try managerContext.fetch(fetchRequest)
            return .success(object)
        } catch {
            return .failure(.error("Cloud not fetch \(error)"))
        }
    }
    
    func deleteTodo(_ todo: TodoEntity) -> Result<Void, CoreDataError> {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return .failure(.error("AppDelegate not found"))
        }
        let managerContext = appDelegate.persistentContainer.viewContext
        do {
            managerContext.delete(todo)
            try managerContext.save()
            return .success(())
        } catch {
            return .failure(.error("Error deletind todo \(error)"))
        }
    }
}

