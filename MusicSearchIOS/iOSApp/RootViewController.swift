//
//  RootViewController.swift
//  MusicSearchIOS
//
//  Created by Vitor S do Nascimento on 09-11-19.
//

import UIKit
import MusicSearchKit

public class RootViewController: UIViewController {
    private let rootViewModel: RootViewModel

    public init(rootViewModelFactory: RootViewModelFactory) {
        self.rootViewModel = rootViewModelFactory.makeRootViewModelFactory()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        return nil
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
}

public protocol RootViewModelFactory {
    func makeRootViewModelFactory() -> RootViewModel
}
