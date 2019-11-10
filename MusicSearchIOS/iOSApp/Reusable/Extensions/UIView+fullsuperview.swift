//
//  UIView+fullsuperview.swift
//  MusicSearchIOS
//
//  Created by Vitor S do Nascimento on 09-11-19.
//

import UIKit

extension UIView {
    func fullSuperview() {
        guard let parent = self.superview else {
            return
        }
        let constraints: [NSLayoutConstraint] = [
            topAnchor.constraint(equalTo: parent.topAnchor),
            leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            trailingAnchor.constraint(equalTo: parent.trailingAnchor),
            bottomAnchor.constraint(equalTo: parent.bottomAnchor)
        ]
        constraints.forEach { $0.isActive = true }
        NSLayoutConstraint.activate(constraints)
    }
}
