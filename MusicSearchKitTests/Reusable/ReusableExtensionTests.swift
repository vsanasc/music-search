//
//  ReusableTests.swift
//  MusicSearchKitTests
//
//  Created by Vitor S do Nascimento on 08-11-19.
//

import XCTest
@testable import MusicSearchKit

class ReusableExtensionTests: XCTestCase {
    let bundle = Bundle(for: ReusableExtensionTests.self)

    func test_bundle_notFoundFile() {
        let sut = bundle.readJSONData(for: "nonexistent_file")
        XCTAssertNil(sut)
    }

    func test_bundle_readJSONArray() {
        let array = bundle.readJSONArray(for: "array")

        guard let testValue = array?.first?["test"] as? Bool else {
            XCTFail("Failed to get test param")
            return
        }
        XCTAssertTrue(testValue)

    }

    func test_bundle_readJSONObject() {
        let array = bundle.readJSONObject(for: "object")
        guard let testValue = array?["test"] as? Bool else {
            XCTFail("Failed to get test param")
            return
        }
        XCTAssertTrue(testValue)
    }

    func test_string_removeslashes() {
        let inputString = "https://google.com/testing/removeslashes/"
        let outputString = "https:google.comtestingremoveslashes"

        XCTAssertEqual(inputString.removeslashes, outputString)
    }

    func test_string_encodeurl() {
        let inputString = "testing url encoding"
        let outputString = "testing%20url%20encoding"

        XCTAssertEqual(inputString.encodeUrl, outputString)
    }

}
