import XCTest
import Foundation
@testable import Tokenizer

final class RegexTests: XCTestCase {
    
    func test_Regex_matchedRanges_zeroMatch() {
        
        let inputString = "CREATE TABLE"
        let regex = "CREATOR"
        
        let matches = inputString.matchedRanges(for: regex)
        
        XCTAssertEqual(matches.count, 0)
    }
    
    func test_Regex_matchedRanges_oneMatch_beginning() {
        
        let inputString = "CREATE TABLE"
        let regex = "CREATE"
        
        let matches = inputString.matchedRanges(for: regex)
        
        XCTAssertEqual(matches.count, 1)
        XCTAssertEqual(matches[0], "CREATE")
        XCTAssertEqual(matches[0].startIndex, inputString.startIndex)
        XCTAssertEqual(matches[0].endIndex, inputString.index(inputString.startIndex, offsetBy: 6))
    }
    
    func test_Regex_matchedRanges_oneMatch_middle() {
        
        let inputString = "CREATE TABLE"
        let regex = "TABLE"
        
        let matches = inputString.matchedRanges(for: regex)
        
        XCTAssertEqual(matches.count, 1)
        XCTAssertEqual(matches[0], "TABLE")
        XCTAssertEqual(matches[0].startIndex, inputString.index(inputString.startIndex, offsetBy: 7))
        XCTAssertEqual(matches[0].endIndex, inputString.index(inputString.startIndex, offsetBy: 12))
    }

    static var allTests = [
        ("test_Regex_matchedRanges_zeroMatch", test_Regex_matchedRanges_zeroMatch),
        ("test_Regex_matchedRanges_oneMatch_beginning", test_Regex_matchedRanges_oneMatch_beginning),
        ("test_Regex_matchedRanges_oneMatch_middle", test_Regex_matchedRanges_oneMatch_middle),
    ]
}
