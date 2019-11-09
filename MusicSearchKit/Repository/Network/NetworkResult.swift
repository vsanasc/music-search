//
//  NetworkResult.swift
//  SBrainKit
//
//  Created by Vitor S do Nascimento on 04-11-19.
//  Copyright © 2019 Second Brain Project. All rights reserved.
//

public enum NetworkResult {
    case success(HTTPURLResponse)
    case error(Error)
}
