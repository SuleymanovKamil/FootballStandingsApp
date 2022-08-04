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
    case seasonDetail(id: String, year: Int)
    
    var path: String {
        switch self {
        case .getLeagues:
            return "leagues"
        case .getSeasons(let id):
            return "leagues/\(id)/seasons"
        case .seasonDetail(let id, let year):
            return "leagues/\(id)/standings?season=\(year)&sort=asc"
        }
    }
    
    var method: RequestMethod { .get }
}
