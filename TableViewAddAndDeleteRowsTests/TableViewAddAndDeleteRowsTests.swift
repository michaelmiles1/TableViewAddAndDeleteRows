//
//  TableViewAddAndDeleteRowsTests.swift
//  TableViewAddAndDeleteRowsTests
//
//  Created by Michael Miles on 3/9/22.
//

import XCTest
@testable import TableViewAddAndDeleteRows

class TableViewAddAndDeleteRowsTests: XCTestCase {

    func testMainPerformance() throws {
        // This is an example of a performance test case.
        let bigArray = ["Burger King",
                        "Chick-fil-A",
                        "In-N-Out",
                        "McDonalds",
                        "Wendys"]
        let smallArray = ["Burger King",
                          "In-N-Out",
                          "Wendys"]
        let vc = ViewController()
        measure {
            vc.indexPathsForNewItems(bigArray: bigArray, smallArray: smallArray)
            // Put the code you want to measure the time of here.
        }
    }
    
    func testAltPerformance() throws {
        // This is an example of a performance test case.
        let bigArray = ["Burger King",
                        "Chick-fil-A",
                        "In-N-Out",
                        "McDonalds",
                        "Wendys"]
        let smallArray = ["Burger King",
                          "In-N-Out",
                          "Wendys"]
        let vc = ViewController()
        measure {
            vc.alternateIndexPathsForNewItems(bigArray: bigArray, smallArray: smallArray)
            // Put the code you want to measure the time of here.
        }
    }
    
    func testDifferencePerformance() throws {
        // This is an example of a performance test case.
        let bigArray = ["Burger King",
                        "Chick-fil-A",
                        "In-N-Out",
                        "McDonalds",
                        "Wendys"]
        let smallArray = ["Burger King",
                          "In-N-Out",
                          "Wendys"]
        let vc = ViewController()
        measure {
            vc.useArrayDifferenceForNewItems(bigArray: bigArray, smallArray: smallArray)
            // Put the code you want to measure the time of here.
        }
    }

}
