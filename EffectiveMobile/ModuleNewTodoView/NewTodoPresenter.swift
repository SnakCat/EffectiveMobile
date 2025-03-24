//
//  NewTodoPresenter.swift
//  EffectiveMobile
//
//  Created by Дмитрий Трушин on 20/03/2025.
//

import Foundation

protocol NewTodoPresenterProtocol: AnyObject {
    func didFetchTodos(_ todos: [TodoEntity])
    func didFailWithError(_ error: CoreDataError)
}

final class NewTodoPresenter: NewTodoPresenterProtocol {
    
    weak var view: NewTodoViewProtocol?
    var interactor: NewTodoInteractorProtocol
    var router: NewTodoRouterProtocol
    
    init(interactor: NewTodoInteractorProtocol, router: NewTodoRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func didFetchTodos(_ todos: [TodoEntity]) {
        <#code#>
    }
    
    func didFailWithError(_ error: CoreDataError) {
        <#code#>
    }
}
