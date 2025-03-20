//
//  TodoRouter.swift
//  EffectiveMobile
//
//  Created by Дмитрий Трушин on 18/03/2025.
//

import UIKit

protocol TodoRouterProtocol: AnyObject {
    
}

final class TodoRouter: TodoRouterProtocol {
    weak var view: TodoViewProtocol?
}
