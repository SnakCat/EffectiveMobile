//
//  NewTodoView.swift
//  EffectiveMobile
//
//  Created by Дмитрий Трушин on 19/03/2025.
//

import UIKit

protocol NewTodoViewProtocol: AnyObject {
    
}

final class NewTodoView: UIViewController {
    var presenter: NewTodoPresenterProtocol?
}

extension NewTodoView: NewTodoViewProtocol {
    
}
