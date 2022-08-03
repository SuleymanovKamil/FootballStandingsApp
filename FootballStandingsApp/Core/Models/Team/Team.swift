//
//  Team.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 04.08.2022.
//

import Foundation

struct Team: Codable {
    let id, uid, location, name: String?
    let abbreviation, displayName, shortDisplayName: String?
    let isActive: Bool?
    let logos: [TeamLogo]?
}
