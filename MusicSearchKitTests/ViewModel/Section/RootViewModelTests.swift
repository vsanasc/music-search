//
//  RootViewModelTests.swift
//  MusicSearchKitTests
//
//  Created by Vitor S do Nascimento on 09-11-19.
//

import XCTest
@testable import MusicSearchKit

class RootViewModelTests: XCTestCase {

    func test_rootViewModel_initialize() {
        let sut = RootViewModel()
        XCTAssertNotNil(sut)
    }
}
