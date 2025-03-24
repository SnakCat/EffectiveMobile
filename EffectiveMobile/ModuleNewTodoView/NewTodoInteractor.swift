//
//  NewTodoInteractor.swift
//  EffectiveMobile
//
//  Created by Дмитрий Трушин on 20/03/2025.
//

import Foundation

protocol NewTodoInteractorProtocol: AnyObject {
    func saveTodo(name: String, description: String, isCompleted: Bool)
    func fetchTodo()
    func deleteTodoItem(_ todo: TodoEntity)
}

final class NewTodoInteractor: NewTodoInteractorProtocol {
    
    weak var presenter: NewTodoPresenterProtocol?
    
    //load coreData
    func fetchTodo() {
        switch CoreDataManager.instance.loadTodo() {
        case .success(let success):
            presenter?.didFetchTodos(success)
        case .failure(let failure):
            presenter?.didFailWithError(failure)
        }
    }
    
    //save coreData
    func saveTodo(name: String, description: String, isCompleted: Bool = false) {
        let result = CoreDataManager.instance.saveTodo(
            todoName: name,
            createdDate: Date(),
            todoDescription: description,
            isCompleted: isCompleted
        )
        switch result {
        case .success(let success):
            fetchTodo()
        case .failure(let failure):
            presenter?.didFailWithError(failure)
        }
    }
    
    //delete coreData
    func deleteTodoItem(_ todo: TodoEntity) {
        let result = CoreDataManager.instance.deleteTodo(todo)
        switch result {
        case .success(let success):
            fetchTodo()
        case .failure(let failure):
            presenter?.didFailWithError(failure)
        }
    }
}
