//
//  Endpoint.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 03.08.2022.
//

import Foundation

enum Endpoint: EndpointProtocol {
    case getLeagues
    case getSeasons(id: String)
    case seasonDetail(id: String)
    
    var path: String {
        switch self {
        case .getLeagues:
            return "leagues"
        case .getSeasons(let id):
            return "leagues/\(id)/seasons"
        case .seasonDetail(let id):
            return "leagues/\(id)/standings"
        }
    }
    
    var method: RequestMethod { .get }
}
