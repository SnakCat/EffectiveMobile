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
    private let titleLabel = UILabel()
    private let dateLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubViews(titleLabel, dateLabel, descriptionLabel)
        setupConstraints()
        setupUI()
    }
        
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
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupUI() {
        view.backgroundColor = .black
        titleLabel.text = "Название задачи"
        titleLabel.textColor = .white
        titleLabel.font = .boldSystemFont(ofSize: 34)
            
        dateLabel.text = "13/13/13"
        dateLabel.textColor = .gray
        dateLabel.font = .systemFont(ofSize: 12)
        
        descriptionLabel.text = "Тут будет большое или не очень большое описание задачи с которой нужно работать"
        descriptionLabel.textColor = .white
        descriptionLabel.font = .systemFont(ofSize: 16)
        descriptionLabel.numberOfLines = .zero
    }
}

extension NewTodoView: NewTodoViewProtocol {
    
}
