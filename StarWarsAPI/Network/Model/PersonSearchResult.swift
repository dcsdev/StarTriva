import Foundation

public struct PersonSearchResult {
    let count           :Int;
    let next            :Int?;
    let previous        :Int?;
    let results         :[Person]
}

extension PersonSearchResult: Decodable {
    enum PersonSearchResultKeys: String, CodingKey {
        case count
        case next
        case previous
        case results
    }
    
    public init(from decoder: Decoder) throws {
        let personSearchResult = try decoder.container(keyedBy: PersonSearchResultKeys.self)
        
        count       = try personSearchResult.decode(Int.self        , forKey: .count)
        next        = try personSearchResult.decode(Int?.self       , forKey: .next)
        previous    = try personSearchResult.decode(Int?.self       , forKey: .previous)
        results     = try personSearchResult.decode([Person].self   , forKey: .results)
    }
}



