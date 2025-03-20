//
//  TodoAssembly.swift
//  EffectiveMobile
//
//  Created by Дмитрий Трушин on 18/03/2025.
//

import Foundation
import UIKit

final class TodoAssembly {
    
    static func assembly() -> TodoViewController {
        let interactor = TodoInteractor()
        let router = TodoRouter()
        let presenter = TodoPresenter(interactor: interactor, router: router)
        let viewController = TodoViewController()
        viewController.presenter = presenter
        presenter.view = viewController
        interactor.presenter = presenter
        router.view = viewController
        return viewController
    }
}
