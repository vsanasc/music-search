//
//  NiblessNavigationController.swift
//  MusicSearchIOS
//
//  Created by Vitor S do Nascimento on 09-11-19.
//

import UIKit

open class NiblessNavigationController: UINavigationController {

    static public let fatalMessage = "init(coder:) has not been implemented"

    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        fatalError(NiblessNavigationController.fatalMessage)
    }
}
