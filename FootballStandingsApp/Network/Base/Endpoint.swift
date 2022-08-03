//
//  RequestError.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 03.08.2022.
//

protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var method: RequestMethod { get }
}

extension Endpoint {
    var baseURL: String { "https://api-football-standings.azharimm.site/" }
}
