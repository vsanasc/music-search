//
//  ReusableExtensionsTests.swift
//  MusicSearchIOSTests
//
//  Created by Vitor S do Nascimento on 09-11-19.
//

import XCTest
import MusicSearchKit
@testable import MusicSearchIOS

class ReusableExtensionsTests: XCTestCase {

    func test_viewController_addScreen() {
        let parentVC = UIViewController()
        let childVC = UIViewController()

        parentVC.addScreen(childViewController: childVC)

        guard let queryChild = parentVC.children.first else {
            XCTFail("Child not found")
            return
        }
        XCTAssertEqual(childVC, queryChild)

    }

    func test_viewController_removeScreen() {
        let parentVC = UIViewController()
        let childVC = UIViewController()

        parentVC.addChild(childVC)
        parentVC.view.addSubview(childVC.view)

        parentVC.removeScreen(childViewController: childVC)

        XCTAssertEqual(parentVC.children.count, 0)
    }
    func test_view_addSubviews() {
        let parent = UIView()
        let view0 = UIView()
        let view1 = UIView()
        let view2 = UIView()

        parent.addSubviews(view0, view1, view2)

        XCTAssertEqual(parent.subviews.count, 3)
        parent.subviews.forEach {
            XCTAssertEqual($0.translatesAutoresizingMaskIntoConstraints, false)
        }
    }
    func test_present_error() {
        let exp = expectation(description: "presentError")
        let errorMessage = ErrorMessage()
        let viewController = UIApplication.shared.windows.first?.rootViewController
        viewController?.present(errorMessage) {
            XCTAssertTrue(viewController?.presentedViewController is UIAlertController)
            exp.fulfill()
        }
        waitForExpectations(timeout: 3.0, handler: nil)
    }

}
