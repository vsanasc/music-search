//
//  SongModelViewModel.swift
//  MusicSearchKit
//
//  Created by Vitor S do Nascimento on 08-11-19.
//

public class SongModelViewModel {
    public let artistName: String?
    public let collectionName: String?
    public let trackName: String?
    public let previewUrl: URL?
    public let artworkUrl100: URL?
    public let trackPrice: Double?
    public let releaseDate: Date?
    public let trackTimeMillis: Int?
    public let primaryGenreName: String?
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
    }
}
