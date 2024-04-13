//
//  DisplayedItem.swift
//  avito2024
//
//  Created by DIMbI4 on 12.04.2024.
//

import Foundation

struct DisplayedItem: Hashable {
    
    private let id = UUID()
    let contentNameLabelText: String
    let secondaryLabelText: String
    let descriptionLabelText: String
    let explicit: Bool?
    let imageURL: URL?
    
    init(contentNameLabelText: String, secondaryLabelText: String, descriptionLabelText: String, explicit: Bool?, imageURL: URL?) {
        self.contentNameLabelText = contentNameLabelText
        self.secondaryLabelText = secondaryLabelText
        self.descriptionLabelText = descriptionLabelText
        self.explicit = explicit
        self.imageURL = imageURL
    }
    
}
