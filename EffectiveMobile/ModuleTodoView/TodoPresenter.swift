//
//  TodoPresenter.swift
//  EffectiveMobile
//
//  Created by Дмитрий Трушин on 18/03/2025.
//

import Foundation

protocol TodoPresenterProtocol: AnyObject {
    func onViewDidLoad()
    func didFetchTodos(_ todos: [TodoModel])
    func didFailFetching(_ error: RequestError)
    func onTapNewTodoButton()
    func onTapEditTodo(_ todo: TodoModel)
}

final class TodoPresenter: TodoPresenterProtocol {
    weak var view: TodoViewProtocol?
    var interactor: TodoInteractorProtocol
    var router: TodoRouterProtocol
    
    init(interactor: TodoInteractorProtocol, router: TodoRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func onViewDidLoad() {
        interactor.fetchTodos()
    }
    
    func onTapNewTodoButton() {
        router.showNewTodoView()
    }
    
    func onTapEditTodo(_ todo: TodoModel) {
        router.showEditTodo(todo)
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
