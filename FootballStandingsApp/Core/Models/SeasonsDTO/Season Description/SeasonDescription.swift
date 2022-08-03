//
//  SeasonDescription.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 03.08.2022.
//

import Foundation

struct SeasonDescription: Codable {
    let year: Int
    let startDate, endDate, displayName: String
    let types: [SeasonDetail]
}
