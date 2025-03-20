//
//  TodoView.swift
//  EffectiveMobile
//
//  Created by Дмитрий Трушин on 18/03/2025.
//

import UIKit

protocol TodoViewProtocol: AnyObject {
    func displayTodos(_ todos: [TodoModel])
    func displayError(_ error: RequestError)
    func updateCountLabel(text: String)
    func reloadTable()
}

final class TodoViewController: UIViewController, UISearchBarDelegate {
    
    private let titleLabel = UILabel()
    private let searchBar = UISearchBar()
    private let tableView = UITableView()
    var todos: [TodoModel] = []
    var presenter: TodoPresenterProtocol?
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    private let footerView = UIView()
    private let counterLabel = UILabel()
    private let addTodoButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        setupConstraints()
        setupUI()
        setupSearchBar()
        setupTableView()
        self.activityIndicator.stopAnimating()
        presenter?.onViewDidLoad()
    }
    
    private func addSubView() {
        view.addSubViews(titleLabel, searchBar, tableView, activityIndicator, footerView)
        footerView.addSubViews(counterLabel, addTodoButton)
    }
    
    private func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        footerView.translatesAutoresizingMaskIntoConstraints = false
        counterLabel.translatesAutoresizingMaskIntoConstraints = false
        addTodoButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            searchBar.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: footerView.topAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            footerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            footerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            footerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            footerView.heightAnchor.constraint(equalToConstant: 84),
            
            counterLabel.topAnchor.constraint(equalTo: footerView.topAnchor, constant: 20),
            counterLabel.centerXAnchor.constraint(equalTo: footerView.centerXAnchor),
            
            addTodoButton.topAnchor.constraint(equalTo: footerView.topAnchor, constant: 14),
            addTodoButton.trailingAnchor.constraint(equalTo: footerView.trailingAnchor, constant: -22)
        ])
    }
    
    private func setupUI() {
        view.backgroundColor = .black
        titleLabel.text = "Задачи"
        titleLabel.textColor = .white
        titleLabel.font = .boldSystemFont(ofSize: 34)
        footerView.backgroundColor = .gray
        counterLabel.textColor = .white
        counterLabel.font = .systemFont(ofSize: 11)
        let image = UIImage(systemName: "square.and.pencil")?.withTintColor(.systemYellow, renderingMode: .alwaysOriginal)
        addTodoButton.setImage(image, for: .normal)
        addTodoButton.addTarget(self, action: #selector(addTodoButtonTapped), for: .touchUpInside)
        
    }
    
    @objc func addTodoButtonTapped() {
        presenter?.onTapNewTodoButton()
    }
    
    private func setupSearchBar() {
        searchBar.placeholder = "Search"
        searchBar.searchBarStyle = .minimal
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.backgroundColor = UIColor.darkGray
            textField.layer.cornerRadius = 12
            textField.clipsToBounds = true
            textField.textColor = .white
            if let leftView = textField.leftView as? UIImageView {
                leftView.tintColor = .lightGray
            }
        }
        searchBar.delegate = self
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .lightGray
        tableView.backgroundColor = .black
    }
}

extension TodoViewController: TodoViewProtocol {
    
    func displayTodos(_ todos: [TodoModel]) {
        self.activityIndicator.stopAnimating()
        self.todos = todos
        self.tableView.reloadData()
    }
    
    func displayError(_ error: RequestError) {
        self.activityIndicator.stopAnimating()
    }
    
    func updateCountLabel(text: String) {
        counterLabel.text = text
    }
    
    func reloadTable() {
        tableView.reloadData()
    }
    
}

extension TodoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomCell {
            let todo = todos[indexPath.row]
            cell.configureCell(todo: todo)
            cell.backgroundColor = .clear
            cell.contentView.backgroundColor = .black
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView,
                   contextMenuConfigurationForRowAt indexPath: IndexPath,
                   point: CGPoint) -> UIContextMenuConfiguration? {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.contentView.backgroundColor = UIColor.darkGray
        }
        
        let todo = todos[indexPath.row]
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
            let edit = UIAction(title: "Редактировать", image: UIImage(systemName: "pencil")) { _ in
                self.presenter?.onTapEditTodo(todo)
            }
            
            let share = UIAction(title: "Поделиться", image: UIImage(systemName: "square.and.arrow.up")) { _ in
                
            }
            
            let delete = UIAction(title: "Удалить", image: UIImage(systemName: "trash"), attributes: .destructive) { _ in
                
            }
            
            return UIMenu(title: "", children: [edit, share, delete])
        }
    }
}
