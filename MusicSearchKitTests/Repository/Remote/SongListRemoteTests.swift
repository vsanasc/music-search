//
//  SongListRemoteTests.swift
//  MusicSearchKitTests
//
//  Created by Vitor S do Nascimento on 09-11-19.
//

import XCTest
import Mockingjay
@testable import MusicSearchKit

class SongListRemoteTests: XCTestCase {
    var songListRemote: SongListRemoteAPI?

    override func setUp() {
        super.setUp()
        songListRemote = SongListAPI(manager: FakeManagerRequestAPI())
    }

    func test_songListAPI_search() {
        StubService.stubSongList()

        let exp = expectation(description: "songListAPI")
        songListRemote?
            .getSongs(search: "")
            .done { items in
                XCTAssertEqual(items.count, 200)
                XCTAssertEqual(items.first?.artistId, 312095)
                exp.fulfill()
            }
            .catch { error in
                XCTFail("\(error)")
                exp.fulfill()
            }
        waitForExpectations(timeout: 3, handler: nil)
    }
    func test_songListAPI_fail() {
        let exp = expectation(description: "songListAPI_fail")
        songListRemote?
            .getSongs(search: "fail")
            .done { _ in
                XCTFail("Must be failed")
                exp.fulfill()
            }
            .catch { error in
                print(error)
                exp.fulfill()
            }
        waitForExpectations(timeout: 3, handler: nil)
    }

    override func tearDown() {
        songListRemote = nil
        super.tearDown()
    }
}
