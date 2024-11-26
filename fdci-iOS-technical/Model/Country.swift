//
//  Country.swift
//  fdci-iOS-technical
//
//  Created by John Patrick Echavez on 11/26/24.
//

import Foundation

struct Country: Codable {
    struct Name: Codable {
        struct NativeName: Codable {
            struct Language: Codable {
                let official: String
                let common: String
            }
            let eng: Language
        }
        let common: String
        let official: String
        let nativeName: NativeName
    }
    
    struct Currency: Codable {
        let name: String
        let symbol: String
    }
    
    struct IDD: Codable {
        let root: String
        let suffixes: [String]
    }
    
    let name: Name
    let tld: [String]
    let cca2: String
    let ccn3: String
    let cca3: String
    let independent: Bool
    let status: String
    let unMember: Bool
    let currencies: [String: Currency]
    let idd: IDD
    let capital: [String]
    let altSpellings: [String]
    let region: String
}
