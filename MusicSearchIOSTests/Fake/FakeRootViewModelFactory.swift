//
//  FakeRootViewModelFactory.swift
//  MusicSearchIOSTests
//
//  Created by Vitor S do Nascimento on 09-11-19.
//

import Foundation
import MusicSearchKit
import MusicSearchIOS

class FakeRootViewModelFactory: RootViewModelFactory {
    func makeRootViewModelFactory() -> RootViewModel {
        return RootViewModel()
    }
}
