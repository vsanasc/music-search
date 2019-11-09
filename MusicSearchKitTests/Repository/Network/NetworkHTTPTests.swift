//
//  NetworkHTTPMethodTests.swift
//  SBrainKitTests
//
//  Created by Vitor S do Nascimento on 04-11-19.
//  Copyright © 2019 Second Brain Project. All rights reserved.
//

import XCTest
@testable import MusicSearchKit
import Mockingjay

class NetworkHTTPTests: XCTestCase {

    override func setUp() {
        super.setUp()
        StubService.stuball()
    }

    func test_mockingjay_convertion() {
        let methods: [NetworkHTTPMethod] = [.get, .post, .put, .delete, .patch, .options, .head]
        let methodsMockingjay: [HTTPMethod] = [.get, .post, .put, .delete, .patch, .options, .head]

        for (index, method) in methods.enumerated() {
            XCTAssertEqual(method.mockingjayMethod, methodsMockingjay[index])
        }
    }
}
