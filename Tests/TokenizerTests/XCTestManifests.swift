import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(RegexTests.allTests),
        testCase(TokenizerTests.allTests),
    ]
}
#endif
