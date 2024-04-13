//
//  SearchItemsParameters.swift
//  avito2024
//
//  Created by DIMbI4 on 05.04.2024.
//

struct SearchItemsParameters {
    
    var term: String
    var country: Country
    var mediaType: MediaType
    var limit: Limit
    var lang: String
    var explicit: Explicit
    
    init() {
        self.term = ""
        self.country = .us
        self.mediaType = .music
        self.limit = .limit30
        self.lang = "en_us"
        self.explicit = .yes
    }
    
    init(term: String, country: Country = .us, mediaType: MediaType = .music, limit: Limit = .limit30, lang: String = "en_us", explicit: Explicit = .yes) {
        self.term = term
        self.country = country
        self.mediaType = mediaType
        self.limit = limit
        self.lang = lang // later add localization
        self.explicit = explicit
    }
    
    func getParameters() -> [String: String] {
        let parameters = ["term": term.replacingOccurrences(of: " ", with: "+"),
                          "country": country.rawValue,
                          "media": mediaType.rawValue,
                          "entity": mediaType.entity,
                          "limit": limit.rawValue,
                          "lang": lang,
                          "explicit": explicit.rawValue]
        return parameters
    }
    
}
