//
//  UIViewController+presentErrorMessage.swift
//  MusicSearchIOS
//
//  Created by Vitor S do Nascimento on 09-11-19.
//

import UIKit
import MusicSearchKit

extension UIViewController {

    func present(_ errorMessage: ErrorMessage, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: errorMessage.title,
                                      message: errorMessage.message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true, completion: completion)
    }
}
