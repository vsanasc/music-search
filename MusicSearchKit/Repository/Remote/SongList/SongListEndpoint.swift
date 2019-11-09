//
//  SongListEndpoint.swift
//  MusicSearchKit
//
//  Created by Vitor S do Nascimento on 09-11-19.
//

public enum SongListEndpoint: Endpoint {
    case search(term: String, limit: Int = 20)
    public var path: String {
        switch self {
        case .search(let term, let limit):
            return "/search?term=\(term)&mediaType=music&limit\(limit)"
        }
    }

}
