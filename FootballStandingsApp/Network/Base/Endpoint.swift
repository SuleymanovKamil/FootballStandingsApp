//
//  RequestError.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 03.08.2022.
//

protocol EndpointProrocol {
    var baseURL: String { get }
    var path: String { get }
    var method: RequestMethod { get }
}

extension EndpointProrocol {
    var baseURL: String { "https://api-football-standings.azharimm.site/" }
}
