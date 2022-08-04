//
//  SeasonType.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 04.08.2022.
//

import Foundation

struct SeasonType: Codable {
    let id, name, abbreviation, startDate, endDate: String
    let hasStandings: Bool
}
