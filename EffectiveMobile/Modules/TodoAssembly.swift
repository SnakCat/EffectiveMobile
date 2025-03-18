//
//  TodoAssembly.swift
//  EffectiveMobile
//
//  Created by Дмитрий Трушин on 18/03/2025.
//

import Foundation
import UIKit

final class TodoAssembly {
    
    static func assembly() -> UIViewController {
        let interactor = TodoInteractor()// принимать API CD
        let presenter = TodoPresenter(interactor: interactor)
        let viewController = TodoViewController(presenter: presenter)
        let router = TodoRouter(view: viewController)
        presenter.view = viewController
        interactor.presenter = presenter
        return viewController
    }
}
