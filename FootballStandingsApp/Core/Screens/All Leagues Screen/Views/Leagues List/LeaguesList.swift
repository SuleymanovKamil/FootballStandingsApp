//
//  LeaguesList.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 04.08.2022.
//

import SwiftUI

struct LeaguesList: View {
    @ObservedObject var store: AllLeaguesMainViewPresenter
    let presenter: AllLeaguesMainViewProtocol
    var body: some View {
        List(store.leagues, id: \.id) { league in
            HStack(spacing: 12) {
                AsyncImageView(url: league.logos.light, width: 50, height: 50)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(league.name)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Text(league.abbr)
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
            }
            .onTapGesture {
                presenter.showLeagueDetailScreen(with: league)
            }
        }
    }
}

struct LeaguesList_Previews: PreviewProvider {
    static var previews: some View {
        let presenter = AllLeaguesMainViewPresenter(footballStandingsService: FootballStandingsRequest())
        LeaguesList(store: presenter, presenter: presenter)
    }
}
