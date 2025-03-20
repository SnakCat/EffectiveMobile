//
//  NewTodoAssenbly.swift
//  EffectiveMobile
//
//  Created by Дмитрий Трушин on 20/03/2025.
//

import UIKit

final class NewTodoAssembly {
    static func newAssembly() -> NewTodoView { // добавить свойства из интерактора
        let interactor = NewTodoInteractor() // прокинусть свойства 
        let router = NewTodoRouter()
        let presenter = NewTodoPresenter(interactor: interactor, router: router)
        let viewController = NewTodoView()
        viewController.presenter = presenter
        presenter.view = viewController
        interactor.presenter = presenter
        router.view = viewController
        return viewController
    }
}
