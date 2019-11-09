//
//  NetworkResult.swift
//  MusicSearchKit
//
//  Created by Vitor S do Nascimento on 08-11-19.
//

public enum NetworkResult {
    case success(HTTPURLResponse)
    case error(Error)
}
