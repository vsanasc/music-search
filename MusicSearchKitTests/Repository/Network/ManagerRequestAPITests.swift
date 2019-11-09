//
//  ReusableNetworkTests.swift
//  SBrainKitTests
//
//  Created by Vitor S do Nascimento on 03-11-19.
//  Copyright © 2019 Second Brain Project. All rights reserved.
//

import XCTest
import Mockingjay
@testable import MusicSearchKit

class ManagerRequestAPITests: XCTestCase {

    var items: [ManagerRequestAPI]?
    let fakeURL = "https://itunes.apple.com/fake"

    override func setUp() {
        super.setUp()
        items = [URLSessionManagerRequestAPI()]
    }
    func test_urlValidation() {

        for manager in items! {
            let exp = expectation(description: "urlValidation: \(manager.self)")
            manager
                .request("", method: .get, parameters: [:], headers: [:]) { _, result in
                    switch result {
                    case .success(let response):
                        XCTFail("It's not validating the url: \(response)")
                    case .error(let error):
                        guard let err = error as? NetworkError else {
                            XCTFail("Invalid Error")
                            return
                        }
                        XCTAssertEqual(err.rawValue, NetworkError.urlError.rawValue)
                        exp.fulfill()
                    }
                }
            waitForExpectations(timeout: 3, handler: nil)
        }
    }
    func test_status_validation() {

        func builderError400(request: URLRequest) -> Response {
          let response = HTTPURLResponse(url: request.url!, statusCode: 400, httpVersion: nil, headerFields: nil)!
          return .success(response, .noContent)
        }

        stub(http(.get, uri: fakeURL), builderError400)
        for manager in items! {
            let exp = expectation(description: "status validation: \(manager.self)")
            manager
                .request(fakeURL, method: .get, parameters: [:], headers: [:]) { _, result in
                    switch result {
                    case .success(let response):
                        XCTFail("It's not validating the status code: \(response)")
                        exp.fulfill()
                    case .error(let error):
                        guard let err = error as? NetworkError else {
                            XCTFail("Invalid Error")
                            exp.fulfill()
                            return
                        }
                        XCTAssertEqual(err.rawValue, NetworkError.httpError.rawValue)
                        exp.fulfill()
                    }
                }
            waitForExpectations(timeout: 3, handler: nil)
        }
    }

    override func tearDown() {
        items = nil
        super.tearDown()
    }

}
