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

    let search = "something"
    override func setUp() {
        super.setUp()
        songListRemote = SongListAPI(manager: FakeManagerRequestAPI())
        StubService.stubSongList()
    }

    func test_songListAPI_search() {

        let exp = expectation(description: "songListAPI")
        songListRemote?
            .getSongs(search: search)
            .done { items in
                XCTAssertEqual(items.count, 20)
                XCTAssertEqual(items.first?.artistId, 269570329)
                exp.fulfill()
            }
            .catch { error in
                XCTFail("\(error)")
                exp.fulfill()
            }
        waitForExpectations(timeout: 3, handler: nil)
    }

    override func tearDown() {
        songListRemote = nil
        super.tearDown()
    }
}
