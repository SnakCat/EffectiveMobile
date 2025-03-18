//
//  TodoPresenter.swift
//  EffectiveMobile
//
//  Created by Дмитрий Трушин on 18/03/2025.
//

import Foundation

protocol TodoPresenterInput {
    func onViewDidLoad()
}

protocol TodoPresenterOutput {
    func didFetchTodos(_ todos: [TodoModel])
    func didFailFetching(_ error: RequestError)
}

final class TodoPresenter: TodoPresenterOutput, TodoPresenterInput {
    var view: TodoViewInput?
    private let interactor: TodoInteractorInput
    
    init(interactor: TodoInteractorInput) {
        self.interactor = interactor
    }
    
    func onViewDidLoad() {
        interactor.fetchTodos()
    }
    
    func didFetchTodos(_ todos: [TodoModel]) {
        view?.displayTodos(todos)
    }
    
    func didFailFetching(_ error: RequestError) {
        view?.displayError(error)
    }
}
