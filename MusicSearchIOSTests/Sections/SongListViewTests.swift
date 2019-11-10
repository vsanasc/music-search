//
//  SongListViewTests.swift
//  MusicSearchIOSTests
//
//  Created by Vitor S do Nascimento on 09-11-19.
//

import XCTest
@testable import MusicSearchIOS

class SongListViewTests: XCTestCase {

    func test_songListViewController_initialize() {
        let sut = SongListViewController(coder: NSCoder())
        XCTAssertNil(sut)
    }
    func test_songListRootView_initialize() {
        let sut = SongListRootView(coder: NSCoder())
        XCTAssertNil(sut)
    }

}
