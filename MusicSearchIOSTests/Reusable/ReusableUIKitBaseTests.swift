//
//  ReusableUIKitBaseTests.swift
//  MusicSearchIOSTests
//
//  Created by Vitor S do Nascimento on 09-11-19.
//

import XCTest
@testable import MusicSearchIOS

class ReusableUIKitBaseTests: XCTestCase {

    func test_label_base() {
        let label = BaseLabel()
        XCTAssertEqual(label.numberOfLines, 1)
        XCTAssertNil(BaseLabel(coder: NSCoder()))
    }

    func test_imageView_base() {
        let imageView = BaseImageView()
        XCTAssertEqual(imageView.contentMode, .scaleAspectFill)
        XCTAssertNil(BaseImageView(coder: NSCoder()))
    }

}
