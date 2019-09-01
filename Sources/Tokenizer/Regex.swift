
import Foundation


extension String {
    
    
    func matchedRanges(for regex: String) -> [Range<String.Index>] {

        let inputString = self
        
        do {
            
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: inputString,
                                        range: NSRange(inputString.startIndex..., in: inputString))
            
            return results.map { Range($0.range, in: inputString)! }
            
        } catch let error {
            
            print("regex error: \(error.localizedDescription)")
            return []
        }
    }
}
