//
//  Endpoint.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 03.08.2022.
//

import Foundation

enum Endpoints: Endpoint {
    case getLeagues
    case getLeagueDetail
    case getSeasons
    case seasonDetail
    
    var path: String {
        switch self {
        case .getLeagues:
            return API.getLeagues
        case .getLeagueDetail:
            return API.getLeagueDetail
        case .getSeasons:
            return API.getSeasons
        case .seasonDetail:
            return API.seasonDetail
        }
    }
    
    var method: RequestMethod {
        return .get
    }
}
