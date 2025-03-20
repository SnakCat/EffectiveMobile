//
//  NewTodoView.swift
//  EffectiveMobile
//
//  Created by Дмитрий Трушин on 19/03/2025.
//

import UIKit

protocol NewTodoViewProtocol: AnyObject {
    // метод для отображения информации 
}

final class NewTodoView: UIViewController {
    var presenter: NewTodoPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

extension NewTodoView: NewTodoViewProtocol {
    
}
