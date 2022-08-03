//
//  LeagueDetailView.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 04.08.2022.
//

import SwiftUI

struct LeagueDetailView: View {
    @ObservedObject private var store: LeagueDetailPresenter
    private var presenter: LeagueDetailProtocol
    
    init(store: LeagueDetailPresenter, presenter: LeagueDetailProtocol) {
        self.store = store
        self.presenter = presenter
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            VStack {
//                if let seasons = store.seasons, let name = seasons.name {
//                    Text(name)
//                }
            }
            
            if store.isErrorViewActive {
                ErrorView(errorText: store.errorDescription)
            }
        }
    }
}


struct LeagueDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let presenter = AllLeaguesMainViewPresenter(footballStandingsService: FootballStandingsRequest())
        AllLeaguesMainView(store:presenter, presenter: presenter)
    }
}


