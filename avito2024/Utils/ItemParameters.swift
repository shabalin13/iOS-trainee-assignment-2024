//
//  ItemParameters.swift
//  avito2024
//
//  Created by DIMbI4 on 05.04.2024.
//

struct ItemParameters {
    
    private let term: String
    private let country: String
    private let media: String
    private let entity: String?
    private let limit: String
    private let lang: String
    private let isExplicit: String
    
    init(term: String, country: ItemCountry = .us, media: ItemMediaType = .all(.defaultEntity), limit: Int = 30, lang: String = "en_us", isExplicit: Bool = true) {
        self.term = term
        self.country = country.rawValue
        self.media = media.toString
        self.entity = media.entity
        self.limit = String(limit)
        self.lang = lang // change to use localization
        self.isExplicit = isExplicit ? "Yes" : "No"
    }
    
    func getParameters() -> [String: String] {
        var parameters = ["term": term.replacingOccurrences(of: " ", with: "+"),
                          "country": country,
                          "media": media,
                          "limit": limit,
                          "lang": lang,
                          "explicit": isExplicit]
        if let entity = entity {
            parameters["entity"] = entity
        }
        return parameters
    }
    
}
