//
//  Country.swift
//  avito2024
//
//  Created by DIMbI4 on 05.04.2024.
//

enum Country: String, CaseIterable {
    
    case us = "US"
    case ru = "RU"
    
    static func fromIdx(idx: Int) -> Country? {
        let allCases = self.allCases
        guard idx >= 0 && idx < allCases.count else {
            return nil
        }
        return allCases[idx]
    }
    
}
