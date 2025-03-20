//
//  NewTodoInteractor.swift
//  EffectiveMobile
//
//  Created by Дмитрий Трушин on 20/03/2025.
//

import Foundation

protocol NewTodoInteractorProtocol: AnyObject {
    // метод что мы будем прокидывать 
}

final class NewTodoInteractor: NewTodoInteractorProtocol {
    weak var presenter: NewTodoPresenterProtocol?
    // описать свойства которые будут приходить из первого модуля
}
