//
//  UIViewController+child.swift
//  MusicSearchIOS
//
//  Created by Vitor S do Nascimento on 09-11-19.
//

import UIKit

extension UIViewController {

  public func addScreen(childViewController child: UIViewController) {
    if child.parent != nil {
        child.parent?.children.forEach(removeScreen)
    }

    addChild(child)
    view.addSubview(child.view)

    child.view.translatesAutoresizingMaskIntoConstraints = false
    let constraints = [
      view.leadingAnchor.constraint(equalTo: child.view.leadingAnchor),
      view.trailingAnchor.constraint(equalTo: child.view.trailingAnchor),
      view.topAnchor.constraint(equalTo: child.view.topAnchor),
      view.bottomAnchor.constraint(equalTo: child.view.bottomAnchor)
    ]
    constraints.forEach { $0.isActive = true }
    view.addConstraints(constraints)

    child.didMove(toParent: self)
  }

  public func removeScreen(childViewController child: UIViewController) {
    child.willMove(toParent: nil)
    child.view.removeFromSuperview()
    child.removeFromParent()
  }
}
