//
//  Season.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 04.08.2022.
//

import Foundation

struct Season: Codable {
    let year: Int
    let startDate, endDate, displayName: String
    let types: [SeasonType]
}
