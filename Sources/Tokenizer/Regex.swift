
import Foundation


extension String {
    
    
    func matchedRanges(for regex: String) -> [Substring] {

        let inputString = self
        
        do {
            
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: inputString,
                                        range: NSRange(inputString.startIndex..., in: inputString))
            
            return results.map {
                let range = Range($0.range, in: inputString)!
                return inputString[range]
            }
            
        } catch let error {
            
            print("regex error: \(error.localizedDescription)")
            return []
        }
    }
}
