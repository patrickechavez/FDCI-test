//
//  FDCIError.swift
//  fdci-iOS-technical
//
//  Created by John Patrick Echavez on 11/26/24.
//

import Foundation

enum FDCIError: String, Error {
    case unableToComplete    = "Unable to complete your request, Please check your internet connection."
    case invalidResponse     = "Invalid response from the server. Please try again."
    case invalidData         = "The data received from the server was invalid. Please try again."
}
