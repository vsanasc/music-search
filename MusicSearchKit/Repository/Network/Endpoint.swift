//
//  EndpointType.swift
//  MusicSearchKit
//
//  Created by Vitor S do Nascimento on 08-11-19.
//

public typealias Parameters = [String: Any]
public typealias HTTPHeaders = [String: String]

let BASEURL = "https://itunes.apple.com"

public protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var method: NetworkHTTPMethod { get }
    var headers: HTTPHeaders { get }
}

public extension Endpoint {
    var baseURL: String {
        return BASEURL
    }
    var method: NetworkHTTPMethod { return .get }
    var headers: HTTPHeaders { return [:] }
    var fullpath: String {
        return "\(baseURL)\(path)"
    }
}
