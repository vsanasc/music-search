//
//  SongListViewTests.swift
//  MusicSearchIOSTests
//
//  Created by Vitor S do Nascimento on 09-11-19.
//

import XCTest
@testable import MusicSearchKit
@testable import MusicSearchIOS

class SongListViewTests: XCTestCase {
    let appContainer = MusicSearchAppDependencyContainer()
    var container: SectionDependencyContainer!
    let fakeURL = URL(string: "\(BASEURL)/fake")!

    override func setUp() {
        super.setUp()
        container = SectionDependencyContainer(appDependency: appContainer)
    }

    func test_songListViewController_initialize() {
        let sut = SongListViewController(coder: NSCoder())
        XCTAssertNil(sut)
    }
    func test_songListRootView_initialize() {
        let sut = SongListRootView(coder: NSCoder())
        XCTAssertNil(sut)
    }
    func test_songListUserInterface_initialize() {

        let songListViewController = container.makeSongListViewController()
        let userIntefarce = SongListUserInterface(
            viewController: songListViewController,
            imageCache: ImageCacheKingfisher()
        )

        let songModel = SongModel(
            artistId: 0,
            collectionId: 0,
            trackId: 0,
            artistName: "",
            collectionName: "",
            trackName: "",
            artistViewUrl: nil,
            collectionViewUrl: fakeURL,
            trackViewUrl: fakeURL,
            previewUrl: fakeURL,
            artworkUrl30: nil,
            artworkUrl60: nil,
            artworkUrl100: fakeURL,
            collectionPrice: 1.0,
            trackPrice: 1.0,
            releaseDate: Date(),
            discCount: 1,
            discNumber: 1,
            trackCount: 1,
            trackNumber: 1,
            trackTimeMillis: 0,
            country: "",
            currency: "",
            primaryGenreName: ""
        )

        let songModelViewModel = SongModelViewModel(songModel: songModel)
        userIntefarce.showOptions(item: songModelViewModel)

    }
    override func tearDown() {
        container = nil
        super.tearDown()
    }

}
