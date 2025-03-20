//
//  NewTodoAssenbly.swift
//  EffectiveMobile
//
//  Created by Дмитрий Трушин on 20/03/2025.
//

import UIKit

final class NewTodoAssenbly {
    static func newAssembly() -> NewTodoView {
        let interactor = NewTodoInteractor()
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
