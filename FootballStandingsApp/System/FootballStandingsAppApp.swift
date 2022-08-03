//
//  FootballStandingsAppApp.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 03.08.2022.
//

import SwiftUI

@main
struct FootballStandingsAppApp: App {
    var body: some Scene {
        WindowGroup {
            let presenter = AllLeaguesMainViewPresenter(footballStandingsService: FootballStandingsRequest())
            AllLeaguesMainView(store:presenter, presenter: presenter)
        }
    }
}
