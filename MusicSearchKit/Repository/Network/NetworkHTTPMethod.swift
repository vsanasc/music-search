//
//  NetworkRequestAPI.swift
//  MusicSearchKit
//
//  Created by Vitor S do Nascimento on 08-11-19.
//

import Mockingjay

public enum NetworkHTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
    case options = "OPTIONS"
    case head = "HEAD"
    var mockingjayMethod: HTTPMethod {
        switch self {
        case .get:
            return .get
        case .post:
            return .post
        case .put:
            return .put
        case .delete:
            return .delete
        case .patch:
            return .patch
        case .options:
            return .options
        case .head:
            return .head
        }
    }
}
