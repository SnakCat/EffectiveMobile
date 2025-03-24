//
//  TodoRouter.swift
//  EffectiveMobile
//
//  Created by Дмитрий Трушин on 18/03/2025.
//

import UIKit

protocol TodoRouterProtocol: AnyObject {
    func showNewTodoView()
    func showEditTodo(_ todo: TodoModel)
}

final class TodoRouter: TodoRouterProtocol {
    
    weak var view: TodoViewController?
    
    func showNewTodoView() {
        let newTodoViewController = NewTodoAssembly.newAssembly(nil)
        view?.navigationController?.pushViewController(newTodoViewController, animated: true)
    }
    
    func showEditTodo(_ todo: TodoModel) {
        let editTodoViewController = NewTodoAssembly.newAssembly(todo)
        view?.navigationController?.pushViewController(editTodoViewController, animated: true)
        
    }
}

