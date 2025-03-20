//
//  Error.swift
//  EffectiveMobile
//
//  Created by Дмитрий Трушин on 18/03/2025.
//

import Foundation

enum RequestError: Error {
    case errorRequest
}

enum CoreDataError: Error {
    case error(String)
}
