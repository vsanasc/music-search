//
//  SongModelViewModel.swift
//  MusicSearchKitTests
//
//  Created by Vitor S do Nascimento on 08-11-19.
//

import XCTest
@testable import MusicSearchKit

class ModelViewModelTests: XCTestCase {

    let fakeURL = URL(string: "https://itunes.apple.com/")!

    func test_songModelViewModel_initialize() {
        let songModel = SongModel(
            artistId: 0,
            collectionId: 100,
            trackId: 0,
            artistName: "",
            collectionName: "",
            trackName: "Track name",
            artistViewUrl: fakeURL,
            collectionViewUrl: fakeURL,
            trackViewUrl: fakeURL,
            previewUrl: fakeURL,
            artworkUrl30: fakeURL,
            artworkUrl60: fakeURL,
            artworkUrl100: fakeURL,
            collectionPrice: 1.0,
            trackPrice: 1.0,
            releaseDate: Date(),
            discCount: 1,
            discNumber: 1,
            trackCount: 1,
            trackNumber: 1,
            trackTimeMillis: 1,
            country: "",
            currency: "",
            primaryGenreName: ""
        )
        let songModelViewModel = SongModelViewModel(songModel: songModel)
        XCTAssertEqual(songModel.artistName, songModelViewModel.artistName)
        XCTAssertEqual(songModel.trackName, songModelViewModel.trackName)
    }
}
