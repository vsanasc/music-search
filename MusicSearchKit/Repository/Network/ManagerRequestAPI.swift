//
//  NetworkRouter.swift
//  SBrainKit
//
//  Created by Vitor S do Nascimento on 04-11-19.
//  Copyright © 2019 Second Brain Project. All rights reserved.
//
import PromiseKit

public typealias NetworkCompletion = ((_ data: Data?, _ response: NetworkResult) -> Void)

public protocol ManagerRequestAPI {
    func request(_ url: String, method: NetworkHTTPMethod, parameters: Parameters, headers: HTTPHeaders, completion: @escaping NetworkCompletion)
}
