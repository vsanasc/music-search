//
//  MusicSearchKitTests.swift
//  MusicSearchKitTests
//
//  Created by Vitor S do Nascimento on 08-11-19.
//

import Foundation
import XCTest
@testable import MusicSearchKit

class ModelTests: XCTestCase {

    let decoder = JSONDecoderDateFormatter()
    let bundle = Bundle(for: ModelTests.self)

    func test_songModel_decoder() {
        guard let dataJSON = bundle.readJSONData(for: "song") else {
            XCTFail("Data json song doesn't be nil")
            return
        }
        guard let sut = try? decoder.decode(SongModel.self, from: dataJSON) else {
            XCTFail("Decoder fail")
            return
        }
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.artistName, "Californication")
    }

    func test_errorMessage_initialize() {
        let sut = ErrorMessage(title: "Title", message: "Message")
        let sut2 = ErrorMessage()
        XCTAssertNotNil(sut)
        XCTAssertNotNil(sut2)
    }
}
