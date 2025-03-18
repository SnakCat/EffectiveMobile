//
//  NetworkManager.swift
//  EffectiveMobile
//
//  Created by Дмитрий Трушин on 18/03/2025.
//

import Alamofire

final class NetworkManager {
    
    static let instance = NetworkManager()
    private init() { }
    
    enum Constants {
        static let baseURL = "https://dummyjson.com"
    }
    
    enum EndPoint {
        static let todos = "/todos"
    }
    
    func getTodos(completion: @escaping(Result<[TodoModel], RequestError>) -> ()) {
        AF.request(Constants.baseURL + EndPoint.todos)
            .validate()
            .responseDecodable(of: TodoResponse.self) { todosResponse in
            switch todosResponse.result {
            case .success(let todoResponse):
                completion(.success(todoResponse.todos))
            case .failure:
                completion(.failure(.errorRequest))
                
            }
        }
    }
}
