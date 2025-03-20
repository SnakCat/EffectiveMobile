//
//  NewTodoPresenter.swift
//  EffectiveMobile
//
//  Created by Дмитрий Трушин on 20/03/2025.
//

import Foundation

protocol NewTodoPresenterProtocol: AnyObject {
    // получить из интерактера инфу
}

final class NewTodoPresenter: NewTodoPresenterProtocol {
    weak var view: NewTodoViewProtocol?
    var interactor: NewTodoInteractorProtocol
    var router: NewTodoRouterProtocol
    
    init(interactor: NewTodoInteractorProtocol, router: NewTodoRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}
