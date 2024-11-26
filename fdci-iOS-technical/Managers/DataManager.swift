//
//  DataManager.swift
//  fdci-iOS-technical
//
//  Created by John Patrick Echavez on 11/26/24.
//

import Foundation

class DataManager {
    static let shared   = DataManager()

    private var name: String
    
    private init() {
        self.name = ""
    }
    
    func setName(name: String) {
        self.name = name
    }
    
    func getName() -> String {
        return self.name
    }

}
