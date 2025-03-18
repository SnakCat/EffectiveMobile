//
//  TodoInteractor.swift
//  EffectiveMobile
//
//  Created by Дмитрий Трушин on 18/03/2025.
//

import UIKit


protocol TodoInteractorProtocolInput {
    func fetchTodos()
}

protocol TodoInteractorProtocolOutput {
    
}


final class TodoInteractor: TodoInteractorProtocolInput {
    var presenter: TodoPresenterProtocolOutput?

    func fetchTodos() {

    }
    
    
}
