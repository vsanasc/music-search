//
//  ReusableImageCacheTests.swift
//  MusicSearchIOSTests
//
//  Created by Vitor S do Nascimento on 09-11-19.
//

import XCTest
import UIKit
@testable import Mockingjay
@testable import MusicSearchIOS

class ReusableImageCacheTests: XCTestCase {

    let bundle = Bundle(for: ReusableImageCacheTests.self)
    let imageURL = "https://itunes.apple.com/image/fake.png"
    let imageFailURL = "https://itunes.apple.com/image/fake-fail.png"
    var image: UIImage?
    var items: [ImageCache]?

    override func setUp() {
        super.setUp()
        items = [ImageCacheKingfisher()]

        image = UIImage(contentsOfFile: bundle.path(forResource: "test", ofType: "png")!)
        stub(uri(imageURL), builder200)
        stub(uri(imageFailURL), builder404)
    }
    func builder200(request: URLRequest) -> Response {
        let imageData: Data = (image?.pngData())!
        let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
        return .success(response, .content(imageData))
    }
    func builder404(request: URLRequest) -> Response {
        let response = HTTPURLResponse(url: request.url!, statusCode: 404, httpVersion: nil, headerFields: nil)!
        return .success(response, .noContent)
    }
    func test_imageCache_success() {

        for imageCache in items! {
            let exp = expectation(description: "ImageCache: \(ImageCache.self)")

            let imageView = UIImageView()
            imageCache.setImage(imageView, url: URL(string: imageURL)!, placeholder: nil) { (data, image, error) in
                if let error = error {
                    exp.fulfill()
                    XCTFail("\(error)")
                    return
                }
                XCTAssertEqual(imageView.image?.pngData(), self.image?.pngData())
                XCTAssertEqual(imageView.image?.pngData(), data)
                exp.fulfill()
            }

            waitForExpectations(timeout: 1, handler: nil)
        }
    }
    func test_imageCache_fail() {

        for imageCache in items! {
            let exp = expectation(description: "ImageCache \(imageCache.self)")

            let imageView = UIImageView()

            imageCache.setImage(imageView, url: URL(string: imageFailURL)!, placeholder: nil) { (data, image, error) in

                XCTAssertNotNil(error)
                XCTAssertNil(data)
                XCTAssertNil(image)
                exp.fulfill()

            }

            waitForExpectations(timeout: 1, handler: nil)
        }
    }

    override func tearDown() {
        items = nil
        super.tearDown()
    }
}
