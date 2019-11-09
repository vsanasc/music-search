//
//  NetworkRouter.swift
//  MusicSearchKit
//
//  Created by Vitor S do Nascimento on 08-11-19.
//

import PromiseKit

public typealias NetworkCompletion = ((_ data: Data?, _ response: NetworkResult) -> Void)

public protocol ManagerRequestAPI {
    func request(_ url: String, method: NetworkHTTPMethod, parameters: Parameters, headers: HTTPHeaders, completion: @escaping NetworkCompletion)
}
