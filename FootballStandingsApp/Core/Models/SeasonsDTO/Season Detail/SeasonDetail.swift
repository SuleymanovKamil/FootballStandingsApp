//
//  SeasonDetail.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 03.08.2022.
//

import Foundation

struct SeasonDetail: Codable {
    let id, name, abbreviation, startDate: String
    let endDate: String
    let hasStandings: Bool
}

