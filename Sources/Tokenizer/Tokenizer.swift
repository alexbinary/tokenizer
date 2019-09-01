
import Foundation


struct Tokenizer {
    
    let staticKnownTokens: [Token]
    let dynamicKnownTokens: [Token]
    
    func tokenize(_ inputString: String) throws -> [Token] {
        
        var knownTokens: [Token] = []
        knownTokens.append(contentsOf: staticKnownTokens)
        knownTokens.append(contentsOf: dynamicKnownTokens)
        
        var readTokens: [Token] = []
        
        var currentInputString = inputString
        
        while !currentInputString.isEmpty {
        
            var tokenRange: Range<String.Index>? = nil
            
            let matchedToken = knownTokens.first { token in
                
                let regex = "^\(token.regex)"
                
                let matchedRanges = currentInputString.matchedRanges(for: regex)
                if matchedRanges.count > 0 {
                
                    tokenRange = matchedRanges.first
                    return true
                }
                
                return false
            }
            
            if let t = matchedToken {
                
                readTokens.append(t)
            
            } else {
            
                // user error, trying to tokenize a string with tokens
                // that are not designed for that use case
                throw "unexpected input --\(currentInputString)--"
            }
            
            currentInputString.removeSubrange(tokenRange!)
        }
        
        return readTokens
    }
}


struct Token: Equatable {
    
    let name: String
    let regex: String
}


extension String: Error { }
