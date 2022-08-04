//
//  SeasonDetailData.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 04.08.2022.
//

import Foundation

struct SeasonDetailData: Codable {
    let name, abbreviation, seasonDisplay: String
    let season: Int
    let standings: [Standing]
}
