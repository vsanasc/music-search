//
//  RootViewTests.swift
//  MusicSearchIOSTests
//
//  Created by Vitor S do Nascimento on 09-11-19.
//

import XCTest
@testable import MusicSearchIOS

class RootViewTests: XCTestCase {

    func test_rootViewController_initialize() {
        let sut = RootViewController(
            rootViewModelFactory: FakeRootViewModelFactory(),
            appDependency: MusicSearchAppDependencyContainer()
        )
        XCTAssertNotNil(sut)
        XCTAssertNil(RootViewController(coder: NSCoder()))
    }

}
