//
//  Endpoint.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 03.08.2022.
//

import Foundation

enum Endpoint: EndpointProrocol {
    case getLeagues
    case getLeagueDetail(id: String)
    case getSeasons(id: String)
    case seasonDetail(id: String)
    
    var path: String {
        switch self {
        case .getLeagues:
            return "leagues"
        case .getLeagueDetail(let id):
            return "leagues/\(id)"
        case .getSeasons(let id):
            return "leagues/\(id)/seasons"
        case .seasonDetail(let id):
            return "leagues/\(id)/standings"
        }
    }
    
    var method: RequestMethod { .get }
}
