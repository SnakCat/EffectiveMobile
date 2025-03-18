//
//  UIViewExtension.swift
//  EffectiveMobile
//
//  Created by Дмитрий Трушин on 18/03/2025.
//

import UIKit

extension UIView {
    func addSubViews(_ view: UIView...) {
        view.forEach(addSubview)
    }
}
