//
//  ScreenViewModelTests.swift
//  MusicSearchKitTests
//
//  Created by Vitor S do Nascimento on 08-11-19.
//

import XCTest
import RxSwift
@testable import MusicSearchKit

class SongListViewModelTests: XCTestCase {

    private let disposeBag = DisposeBag()

    override func setUp() {
        super.setUp()

        StubService.stubSongList()
    }

    func test_loadSongs_success() {

        let exp = expectation(description: "songListViewModel_loadSongs_success")
        let repository = FakeSongListRemoteAPI()

        let sut = SongListViewModel(repository: repository)
        sut.loadSongs(search: "something")
        sut
            .dataList
            .subscribe(
                onNext: { (items) in
                    XCTAssertEqual(items.count, 20)
                    XCTAssertEqual(items.first?.trackName, "Track name")
                    exp.fulfill()
                }, onError: { (error) in
                    XCTFail("\(error)")
                    exp.fulfill()
                }).disposed(by: disposeBag)

        waitForExpectations(timeout: 3.0, handler: nil)
    }

    func test_loadSongs_fail() {

        let exp = expectation(description: "songListViewModel_loadSongs_fail")
        let repository = FakeSongListRemoteAPIError()

        let sut = SongListViewModel(repository: repository)
        sut.loadSongs(search: "something")

        sut
            .dataList
            .subscribe(
                onNext: { (_) in
                    XCTFail("That request must fail")
                    exp.fulfill()
                })
                .disposed(by: disposeBag)
        sut
            .errorMessages
            .subscribe(onNext: { (errorMessage) in
                XCTAssertTrue(errorMessage.title != "")
                XCTAssertTrue(errorMessage.message != "")
                exp.fulfill()
            })
            .disposed(by: disposeBag)

        waitForExpectations(timeout: 3.0, handler: nil)
    }

    override func tearDown() {
        super.tearDown()
    }

}
