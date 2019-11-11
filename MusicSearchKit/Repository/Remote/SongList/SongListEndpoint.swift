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
            var termString = "*"
            if term != "" {
                termString = term.encodeUrl
            }
            return "/search?term=\(termString)&media=music&limit=\(limit)"
        }
    }

}
