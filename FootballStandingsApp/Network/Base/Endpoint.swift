//
//  RequestError.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 03.08.2022.
//

protocol Endpoint {
    var path: String { get }
    var method: RequestMethod { get }
}
