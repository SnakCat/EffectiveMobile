//
//  TodoInteractor.swift
//  EffectiveMobile
//
//  Created by Дмитрий Трушин on 18/03/2025.
//

import UIKit


protocol TodoInteractorInput {
    func fetchTodos()
}
protocol TodoInteractorOutput {
    
}


final class TodoInteractor: TodoInteractorInput {
    
    var presenter: TodoPresenterOutput?
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
    func fetchTodos() {
        activityIndicator.startAnimating()
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
