//
//  RequestError.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 03.08.2022.
//

protocol EndpointProtocol {
    var baseURL: String { get }
    var path: String { get }
    var method: RequestMethod { get }
}

extension EndpointProtocol {
    var baseURL: String { "https://api-football-standings.azharimm.site/" }
}
