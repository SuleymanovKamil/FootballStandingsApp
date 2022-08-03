//
//  Standing.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 04.08.2022.
//

import Foundation

struct Standing: Codable {
    let team: Team?
    let note: Note?
    let stats: [Stats]
}
