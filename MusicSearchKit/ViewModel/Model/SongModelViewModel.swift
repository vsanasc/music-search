//
//  SongModelViewModel.swift
//  MusicSearchKit
//
//  Created by Vitor S do Nascimento on 08-11-19.
//

public class SongModelViewModel {
    let artistName: String
    let collectionName: String
    let trackName: String
    let previewUrl: URL
    let artworkUrl100: URL
    let trackPrice: Double
    let releaseDate: Date
    let trackTimeMillis: Int
    let primaryGenreName: String
    let shortDescription: String
    let longDescription: String
    public init(songModel: SongModel) {
        self.artistName = songModel.artistName
        self.collectionName = songModel.collectionName
        self.trackName = songModel.trackName
        self.previewUrl = songModel.previewUrl
        self.artworkUrl100 = songModel.artworkUrl100
        self.trackPrice = songModel.trackPrice
        self.releaseDate = songModel.releaseDate
        self.trackTimeMillis = songModel.trackTimeMillis
        self.primaryGenreName = songModel.primaryGenreName
        self.shortDescription = songModel.shortDescription
        self.longDescription = songModel.longDescription
    }
}
