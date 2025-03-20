//
//  TodoRouter.swift
//  EffectiveMobile
//
//  Created by Дмитрий Трушин on 18/03/2025.
//

import UIKit

protocol TodoRouterProtocol: AnyObject {
    func showNewTodoView()
}

final class TodoRouter: TodoRouterProtocol {
    weak var view: TodoViewProtocol?
    
    func showNewTodoView() {
        let newTodoViewController = NewTodoAssembly.newAssembly()
        if let sourceView = view as? UIViewController {
            sourceView.present(newTodoViewController, animated: true)
        }
    }
}

