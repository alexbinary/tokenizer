import XCTest
import Foundation
@testable import Tokenizer

final class TokenizerTests: XCTestCase {
    
    func test_Regex_matchedRanges_zeroMatch() {
        
        let inputString = "CREATE TABLE"
        let regex = "CREATOR"
        
        let ranges = inputString.matchedRanges(for: regex)
        
        XCTAssertEqual(ranges.count, 0)
    }
    
    func test_Regex_matchedRanges_oneMatch_beginning() {
        
        let inputString = "CREATE TABLE"
        let regex = "CREATE"
        
        let ranges = inputString.matchedRanges(for: regex)
        
        XCTAssertEqual(ranges.count, 1)
        XCTAssertEqual(ranges[0].lowerBound, inputString.startIndex)
        XCTAssertEqual(ranges[0].upperBound, inputString.index(inputString.startIndex, offsetBy: 6))
    }
    
    func test_Regex_matchedRanges_oneMatch_middle() {
        
        let inputString = "CREATE TABLE"
        let regex = "TABLE"
        
        let ranges = inputString.matchedRanges(for: regex)
        
        XCTAssertEqual(ranges.count, 1)
        XCTAssertEqual(ranges[0].lowerBound, inputString.index(inputString.startIndex, offsetBy: 7))
        XCTAssertEqual(ranges[0].upperBound, inputString.index(inputString.startIndex, offsetBy: 12))
    }

    static var allTests = [
        ("test_Regex_matchedRanges_zeroMatch", test_Regex_matchedRanges_zeroMatch),
        ("test_Regex_matchedRanges_oneMatch_beginning", test_Regex_matchedRanges_oneMatch_beginning),
        ("test_Regex_matchedRanges_oneMatch_middle", test_Regex_matchedRanges_oneMatch_middle),
    ]
}
