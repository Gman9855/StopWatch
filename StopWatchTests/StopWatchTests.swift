//
//  StopWatchTests.swift
//  StopWatchTests
//
//  Created by Gershy Lev on 6/22/22.
//

import XCTest
@testable import StopWatch

class StopWatchTests: XCTestCase {
    
    var viewModel: StopWatchViewModel!

    override func setUpWithError() throws {
        viewModel = StopWatchViewModel()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        viewModel = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testStopwatchStart() {
        viewModel.startTimer()
        let exp = expectation(description: "Test after 5 seconds")
        let result = XCTWaiter.wait(for: [exp], timeout: 5.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertEqual(viewModel.time, 5)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testStopwatchPause() {
        viewModel.startTimer()
        let exp = expectation(description: "Test for 3 seconds")
        let result = XCTWaiter.wait(for: [exp], timeout: 3.0)
        if result == XCTWaiter.Result.timedOut {
            viewModel.pauseTimer()
            let exp2 = expectation(description: "Pause for 3 seconds")
            let res2 = XCTWaiter.wait(for: [exp2], timeout: 3.0)
            if res2 == XCTWaiter.Result.timedOut {
                XCTAssertEqual(viewModel.time, 3)
            } else {
                XCTFail("Delay interrupted")
            }
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testStopwatchContinue() {
        viewModel.startTimer()
        let exp = expectation(description: "Test for 3 seconds")
        let result = XCTWaiter.wait(for: [exp], timeout: 2.0)
        if result == XCTWaiter.Result.timedOut {
            viewModel.pauseTimer()
            let exp2 = expectation(description: "Pause for 3 seconds")
            let res2 = XCTWaiter.wait(for: [exp2], timeout: 2.0)
            if res2 == XCTWaiter.Result.timedOut {
                viewModel.continueTimer()
                let exp3 = expectation(description: "Continue for 3 seconds")
                let res3 = XCTWaiter.wait(for: [exp3], timeout: 2.0)
                if res3 == XCTWaiter.Result.timedOut {
                    XCTAssertEqual(viewModel.time, 4)
                } else {
                    XCTFail("Delay interrupted")
                }
            } else {
                XCTFail("Delay interrupted")
            }
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testStopwatchReset() {
        viewModel.startTimer()
        let exp = expectation(description: "Test for 3 seconds")
        let result = XCTWaiter.wait(for: [exp], timeout: 3.0)
        if result == XCTWaiter.Result.timedOut {
            viewModel.resetTimer()
            XCTAssertEqual(viewModel.time, 0)
        } else {
            XCTFail("Delay interrupted")
        }
    }
}
