//
//  NiblessViewController.swift
//  MusicSearchIOS
//
//  Created by Vitor S do Nascimento on 09-11-19.
//

import UIKit

open class NiblessViewController: UIViewController {

    static public let fatalMessage = "init(coder:) has not been implemented"

    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError(NiblessViewController.fatalMessage)
    }

}
