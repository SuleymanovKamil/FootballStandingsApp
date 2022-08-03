//
//  League.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 03.08.2022.
//

import Foundation

struct League: Codable {
    let id, name, abbr: String
    let logos: Logo
}
