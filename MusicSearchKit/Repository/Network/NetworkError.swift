//
//  NetworkError.swift
//  MusicSearchKit
//
//  Created by Vitor S do Nascimento on 08-11-19.
//

import Foundation

public enum NetworkError: String, Error {
    case unknownError
    case httpError
    case urlError
}
