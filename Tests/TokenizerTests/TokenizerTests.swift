import XCTest
import Foundation
@testable import Tokenizer

final class TokenizerTests: XCTestCase {
    
    func test_tokenizer_badinput() {
        
        let inputString = "CREATETABLEFOO"
        
        let staticKnownTokens = [
            Token(name: "CREATE", regex: "CREATE"),
            Token(name: "TABLE", regex: "TABLE"),
        ]
        
        let tokenizer = Tokenizer(staticKnownTokens: staticKnownTokens, dynamicKnownTokens: [])
        
        XCTAssertThrowsError(try tokenizer.tokenize(inputString))
    }
    
    func test_tokenizer() {
        
        let inputString = "CREATE TABLE COLORS(NAME TEXT,RGB TEXT);"
        
        let staticKnownTokens = [
            Token(name: "CREATE", regex: "CREATE"),
            Token(name: "WHITESPACE", regex: "\\s+"),
            Token(name: "TABLE", regex: "TABLE"),
            Token(name: "SEMICOLON", regex: ";"),
            Token(name: "TYPETEXT", regex: "TEXT"),
            Token(name: "OPENPAREN", regex: "\\("),
            Token(name: "CLOSEPAREN", regex: "\\)"),
            Token(name: "COMMA", regex: ","),
        ]
        let dynamicKnownTokens = [
            Token(name: "IDENTIFIER", regex: "[A-Z]+"),
        ]
        
        let tokenizer = Tokenizer(staticKnownTokens: staticKnownTokens, dynamicKnownTokens: dynamicKnownTokens)
        let tokens = try! tokenizer.tokenize(inputString)
        
        XCTAssertEqual(tokens, [
            TokenMatch(tokenName: "CREATE", value: "CREATE"),
            TokenMatch(tokenName: "WHITESPACE", value: " "),
            TokenMatch(tokenName: "TABLE", value: "TABLE"),
            TokenMatch(tokenName: "WHITESPACE", value: " "),
            TokenMatch(tokenName: "IDENTIFIER", value: "COLORS"),
            TokenMatch(tokenName: "OPENPAREN", value: "("),
            TokenMatch(tokenName: "IDENTIFIER", value: "NAME"),
            TokenMatch(tokenName: "WHITESPACE", value: " "),
            TokenMatch(tokenName: "TYPETEXT", value: "TEXT"),
            TokenMatch(tokenName: "COMMA", value: ","),
            TokenMatch(tokenName: "IDENTIFIER", value: "RGB"),
            TokenMatch(tokenName: "WHITESPACE", value: " "),
            TokenMatch(tokenName: "TYPETEXT", value: "TEXT"),
            TokenMatch(tokenName: "CLOSEPAREN", value: ")"),
            TokenMatch(tokenName: "SEMICOLON", value: ";"),
        ])
    }

    static var allTests = [
        ("test_tokenizer_badinput", test_tokenizer_badinput),
        ("test_tokenizer", test_tokenizer),
    ]
}
