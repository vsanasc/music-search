//
//  DependencyContainerTests.swift
//  MusicSearchIOSTests
//
//  Created by Vitor S do Nascimento on 08-11-19.
//

import XCTest
@testable import MusicSearchIOS

class DependencyContainerTests: XCTestCase {

    func test_appDependencyContainer_initialize() {
        let sut = MusicSearchAppDependencyContainer()
        XCTAssertNotNil(sut)
    }

}
