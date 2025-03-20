//
//  NewTodoInteractor.swift
//  EffectiveMobile
//
//  Created by Дмитрий Трушин on 20/03/2025.
//

import Foundation

protocol NewTodoInteractorProtocol: AnyObject {
    
}

final class NewTodoInteractor: NewTodoInteractorProtocol {
    weak var presenter: NewTodoPresenterProtocol?
}
