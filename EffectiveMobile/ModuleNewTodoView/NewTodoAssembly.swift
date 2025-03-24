//
//  NewTodoAssembly.swift
//  EffectiveMobile
//
//  Created by Дмитрий Трушин on 20/03/2025.
//

import UIKit

final class NewTodoAssembly {
    
    static func newAssembly(_ todo: TodoModel?) -> NewTodoViewController {
        let interactor = NewTodoInteractor()
        let router = NewTodoRouter()
        let presenter = NewTodoPresenter(interactor: interactor, router: router)
        let viewController = NewTodoViewController(todo: todo)
        viewController.presenter = presenter
        presenter.view = viewController
        interactor.presenter = presenter
        router.view = viewController
        return viewController
    }
}
