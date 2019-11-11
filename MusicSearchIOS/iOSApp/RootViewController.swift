//
//  RootViewController.swift
//  MusicSearchIOS
//
//  Created by Vitor S do Nascimento on 09-11-19.
//

import UIKit
import MusicSearchKit

public class RootViewController: UINavigationController {
    private let rootViewModel: RootViewModel
    private let sectionDependencyContainer: SectionDependencyContainer
    public init(
        rootViewModelFactory: RootViewModelFactory,
        appDependency: MusicSearchAppDependencyContainer
    ) {
        self.rootViewModel = rootViewModelFactory.makeRootViewModelFactory()
        self.sectionDependencyContainer = SectionDependencyContainer(appDependency: appDependency)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        return nil
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        let songList = sectionDependencyContainer.makeSongListViewController()
        pushViewController(songList, animated: false)
    }
}

public protocol RootViewModelFactory {
    func makeRootViewModelFactory() -> RootViewModel
}
