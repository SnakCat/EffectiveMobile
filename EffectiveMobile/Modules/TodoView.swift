//
//  TodoView.swift
//  EffectiveMobile
//
//  Created by Дмитрий Трушин on 18/03/2025.
//

import UIKit

protocol TodoViewProtocolOutput: AnyObject {
    
}

final class TodoViewController: UIViewController, TodoViewProtocolOutput {
    var presenter: TodoPresenterProtocolInput
    
    init(presenter: TodoPresenterProtocolInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}
