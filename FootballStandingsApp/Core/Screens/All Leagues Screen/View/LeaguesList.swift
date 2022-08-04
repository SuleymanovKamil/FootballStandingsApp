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
                AsyncImage(url: URL(string: league.logos.light)) { image in
                    image.resizable()
                } placeholder: {
                    Image(systemName: "photo.circle")
                        .resizable()
                        .foregroundColor(.gray)
                        .frame(width: 50, height: 50)
                }
                .frame(width: 50, height: 50)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(league.name)
                    Text(league.abbr)
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
            }
            .onTapGesture {
                presenter.showLeagueDetailScreen(with: league)
            }
        }
        .navigationBarTitle("All Leagues")
        .listStyle(.plain)
    }
}
