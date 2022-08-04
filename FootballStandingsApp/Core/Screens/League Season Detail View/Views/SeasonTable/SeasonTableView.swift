//
//  SeasonTableView.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 04.08.2022.
//

import SwiftUI

struct SeasonTableView: View {
    @ObservedObject private var store: LeagueSeasonDetailPresenter
    private var presenter: LeagueSeasonDetailProtocol
    
    init(store: LeagueSeasonDetailPresenter, presenter: LeagueSeasonDetailProtocol) {
        self.store = store
        self.presenter = presenter
    }
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SeasonTableView_Previews: PreviewProvider {
    static var previews: some View {
        let presenter = AllLeaguesMainViewPresenter(footballStandingsService: FootballStandingsRequest())
        AllLeaguesMainView(store:presenter, presenter: presenter)
    }
}
