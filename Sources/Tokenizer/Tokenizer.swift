
import Foundation


struct Tokenizer {
    
    let staticKnownTokens: [Token]
    let dynamicKnownTokens: [Token]
    
    func tokenize(_ inputString: String) throws -> [TokenMatch] {
        
        var knownTokens: [Token] = []
        knownTokens.append(contentsOf: staticKnownTokens)
        knownTokens.append(contentsOf: dynamicKnownTokens)
        
        var readTokens: [TokenMatch] = []
        
        var currentInputString = inputString
        
        while !currentInputString.isEmpty {
        
            var tokenMatch: Substring? = nil
            
            let matchedToken = knownTokens.first { token in
                
                let regex = "^\(token.regex)"
                
                let matches = currentInputString.matchedRanges(for: regex)
                if matches.count > 0 {
                
                    tokenMatch = matches.first
                    return true
                }
                
                return false
            }
            
            if let t = matchedToken {
                
                readTokens.append(TokenMatch(tokenName: t.name, value: String(tokenMatch!)))
            
            } else {
            
                // user error, trying to tokenize a string with tokens
                // that are not designed for that use case
                throw "unexpected input --\(currentInputString)--"
            }
            
            currentInputString.removeSubrange(tokenMatch!.startIndex..<tokenMatch!.endIndex)
        }
        
        return readTokens
    }
}


struct Token {
    
    let name: String
    let regex: String
}


struct TokenMatch: Equatable {
    
    let tokenName: String
    let value: String
}


extension String: Error { }
