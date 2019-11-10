//
//  SongModel.swift
//  MusicSearchKit
//
//  Created by Vitor S do Nascimento on 08-11-19.
//

public struct SongResponseModel: Decodable {
    let resultCount: Int
    let results: [SongModel]

    enum CodingKeys: String, CodingKey {
        case resultCount, results
    }
}

public struct SongModel: Decodable {
    let wrapperType: String?
    let kind: String?
    let artistId: Int?
    let collectionId: Int?
    let trackId: Int?
    let artistName: String?
    let collectionName: String?
    let trackName: String?
    let artistViewUrl: URL?
    let collectionViewUrl: URL?
    let trackViewUrl: URL?
    let previewUrl: URL?
    let artworkUrl30: URL?
    let artworkUrl60: URL?
    let artworkUrl100: URL?
    let collectionPrice: Double?
    let trackPrice: Double?
    let releaseDate: Date?
    let discCount: Int?
    let discNumber: Int?
    let trackCount: Int?
    let trackNumber: Int?
    let trackTimeMillis: Int?
    let country: String?
    let currency: String?
    let primaryGenreName: String?

    enum CodingKeys: String, CodingKey {
        case wrapperType
        case kind
        case artistId
        case collectionId
        case trackId
        case artistName
        case collectionName
        case trackName
        case artistViewUrl
        case collectionViewUrl
        case trackViewUrl
        case previewUrl
        case artworkUrl30
        case artworkUrl60
        case artworkUrl100
        case collectionPrice
        case trackPrice
        case releaseDate
        case discCount
        case discNumber
        case trackCount
        case trackNumber
        case trackTimeMillis
        case country
        case currency
        case primaryGenreName
    }
}
