//
//  NewTodoView.swift
//  EffectiveMobile
//
//  Created by Дмитрий Трушин on 19/03/2025.
//

import UIKit

protocol NewTodoViewProtocol: AnyObject {
    
}

final class NewTodoViewController: UIViewController {
    
    //MARK: properties
    var presenter: NewTodoPresenterProtocol?
    private let titleLabel = UITextField()
    private let dateLabel = UILabel()
    private let descriptionLabel = UITextView()
    var todo: TodoModel?
    
    //init
    init(todo: TodoModel? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.todo = todo
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubViews(titleLabel, dateLabel, descriptionLabel)
        setupConstraints()
        setupUI()
    }
        
    //MARK: helpers methods
    
    //constraints
    private func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            descriptionLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    //UI
    private func setupUI() {
        view.backgroundColor = .black
        titleLabel.text = todo?.id.description
        titleLabel.textColor = .white
        titleLabel.font = .boldSystemFont(ofSize: 34)
        titleLabel.placeholder = "Введите название"
            
        dateLabel.text = todo?.createdAt
        dateLabel.textColor = .gray
        dateLabel.font = .systemFont(ofSize: 12)
        
        descriptionLabel.text = todo?.todo
        descriptionLabel.textColor = .white
        descriptionLabel.font = .systemFont(ofSize: 16)
        descriptionLabel.backgroundColor = .clear
    }
}

//MARK: extension protocol
extension NewTodoViewController: NewTodoViewProtocol {
    
}
