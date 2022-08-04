//
//  RequestError.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 03.08.2022.
//

enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorised
    case unexpectedStatusCode
    case unknown
    
    var customMessage: String {
        switch self {
        case .decode:
            return "Decode error"
        case .unauthorised:
            return "Session expired"
        default:
            return "Unknown error"
        }
    }
}
