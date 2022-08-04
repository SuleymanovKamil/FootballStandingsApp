//
//  LeagueDetailView.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 04.08.2022.
//

import SwiftUI

struct LeagueDetailView: View {
    @ObservedObject var store: LeagueDetailPresenter
    var presenter: LeagueDetailProtocol
    
    init(store: LeagueDetailPresenter, presenter: LeagueDetailProtocol) {
        self.store = store
        self.presenter = presenter
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            VStack {
                switch store.status {
                case .loading:
                    ProgressView()
                case .loaded:
                    SeasonList(store: store, presenter: presenter)
                case .error:
                    ErrorView(errorText: store.errorDescription)
                }
            }
        }
        .navigationTitle("Seasons")
        
        NavigationLink(isActive: $store.showSeasonsDetailView) {
            if let presenter = store.leagueSeasonDetailPresenter {
                SeasonTableView(store: presenter, presenter: presenter)
            }
        } label: { EmptyView() }
    }
}


struct LeagueDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let presenter = AllLeaguesMainViewPresenter(footballStandingsService: FootballStandingsRequest())
        AllLeaguesMainView(store:presenter, presenter: presenter)
    }
}




