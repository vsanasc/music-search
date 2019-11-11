//
//  FakeSongListRemoteAPI.swift
//  MusicSearchKitTests
//
//  Created by Vitor S do Nascimento on 09-11-19.
//

import Foundation
import PromiseKit
@testable import MusicSearchKit

class FakeSongListRemoteAPI: SongListRemoteAPI {

    func getSongs(search: String) -> Promise<[SongModel]> {
        let fakeURL = URL(string: "https://itunes.apple.com/")!
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
        let array = [SongModel](repeating: songModel, count: 20)

        return .value(array)

    }
}
