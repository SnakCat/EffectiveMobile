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
        view?.reloadTable()
        refreshCountLabel(todos)
    }
    
    func didFailFetching(_ error: RequestError) {
        view?.displayError(error)
    }
    
    func refreshCountLabel(_ todos: [TodoModel]) {
        let count = todos.count
        let word = count == 1 ? "задача" : (count >= 2 && count <= 4 ? "задачи" : "задач")
        let text = "\(count) \(word)"
        view?.updateCountLabel(text: text)
    }
}
