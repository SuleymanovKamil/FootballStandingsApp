//
//  Stat.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 03.08.2022.
//

import Foundation

struct Stats: Codable {
    let name: String?
    let displayName: String?
    let shortDisplayName: String?
    let statDescription: String?
    let abbreviation: String?
    let type: String?
    let value: Int?
    let displayValue: String?
    let id, summary: String?
}
