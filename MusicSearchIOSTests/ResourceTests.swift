//
//  ResourceTests.swift
//  MusicSearchIOSTests
//
//  Created by Vitor S do Nascimento on 10-11-19.
//

import XCTest
@testable import MusicSearchIOS

class ResourceTests: XCTestCase {

    func test_resource() {
        XCTAssertNotNil(Res.color)
        XCTAssertNotNil(Res.localization)
        XCTAssertNotNil(Res.image)
    }

}
