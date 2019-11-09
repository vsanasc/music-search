//
//  ReusableTests.swift
//  SBrainKitTests
//
//  Created by Vitor S do Nascimento on 02-11-19.
//  Copyright © 2019 Second Brain Project. All rights reserved.
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

}
