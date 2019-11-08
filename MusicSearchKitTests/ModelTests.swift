//
//  MusicSearchKitTests.swift
//  MusicSearchKitTests
//
//  Created by Vitor S do Nascimento on 08-11-19.
//

import XCTest
@testable import MusicSearchKit

class ModelTests: XCTestCase {

    func test_songModel_initialize() {
        let sut = SongModel(name: "test")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.name, "test")
    }
}
