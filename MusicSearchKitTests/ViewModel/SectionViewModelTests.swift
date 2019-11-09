//
//  ScreenViewModelTests.swift
//  MusicSearchKitTests
//
//  Created by Vitor S do Nascimento on 08-11-19.
//

import XCTest
@testable import MusicSearchKit

class SectionViewModelTests: XCTestCase {

    func test_songListViewModel_initialize() {
        let sut = SongListViewModel()
        XCTAssertNotNil(sut)
    }

}
