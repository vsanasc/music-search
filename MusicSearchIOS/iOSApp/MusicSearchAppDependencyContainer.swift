//
//  MusicSearchAppDependencyContainer.swift
//  MusicSearchIOS
//
//  Created by Vitor S do Nascimento on 08-11-19.
//

import Foundation
import MusicSearchKit

public class MusicSearchAppDependencyContainer {

    // MARK: - Shared Dependencies
    let sharedManagerRequestAPI: ManagerRequestAPI
    let sharedImageCache: ImageCache

    // MARK: - Initialize
    public init() {
        sharedManagerRequestAPI = URLSessionManagerRequestAPI()
        sharedImageCache = ImageCacheKingfisher()
    }

    public func makeRootViewController() -> RootViewController {
        return RootViewController(rootViewModelFactory: self)
    }
}

extension MusicSearchAppDependencyContainer: RootViewModelFactory {
    public func makeRootViewModelFactory() -> RootViewModel {
        return RootViewModel()
    }
}
