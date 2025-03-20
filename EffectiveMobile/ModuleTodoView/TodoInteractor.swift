//
//  TodoInteractor.swift
//  EffectiveMobile
//
//  Created by Дмитрий Трушин on 18/03/2025.
//

import UIKit


protocol TodoInteractorProtocol: AnyObject {
    func fetchTodos()
}

final class TodoInteractor: TodoInteractorProtocol {
    
    weak var presenter: TodoPresenterProtocol?
    
    func fetchTodos() {
        NetworkManager.instance.getTodos { result in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.presenter?.didFetchTodos(success)
                }
            case .failure(let failure):
                self.presenter?.didFailFetching(failure)
            }
        }
    }
}
