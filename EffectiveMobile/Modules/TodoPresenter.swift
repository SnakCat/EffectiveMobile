//
//  TodoPresenter.swift
//  EffectiveMobile
//
//  Created by Дмитрий Трушин on 18/03/2025.
//

import Foundation

protocol TodoPresenterProtocolInput {
    
}

protocol TodoPresenterProtocolOutput {
    
}

final class TodoPresenter: TodoPresenterProtocolOutput, TodoPresenterProtocolInput {
    var view: TodoViewProtocolOutput?
    private let interactor: TodoInteractorProtocolInput
    
    init(interactor: TodoInteractorProtocolInput) {
        self.interactor = interactor
    }
}
