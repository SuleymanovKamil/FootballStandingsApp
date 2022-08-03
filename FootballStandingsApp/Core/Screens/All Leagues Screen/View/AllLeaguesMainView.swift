//
//  AllLeaguesMainView.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 03.08.2022.
//

import SwiftUI

struct AllLeaguesMainView: View {
    @ObservedObject private var store: AllLeaguesMainViewPresenter
    private var presenter: AllLeaguesMainViewProtocol
    
    init(store: AllLeaguesMainViewPresenter, presenter: AllLeaguesMainViewProtocol) {
        self.store = store
        self.presenter = presenter
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .center) {
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
                
                if store.isErrorViewActive {
                    ErrorView(errorText: store.errorDescription)
                }
                
                NavigationLink(isActive: $store.showLeagueDetailView) {
                    if let presenter = store.showLeagueDetailPresenter {
                        LeagueDetailView(store: presenter, presenter: presenter)
                    }
                } label: { EmptyView() }
            }
        }
    }
}

struct AllLeaguesMainView_Previews: PreviewProvider {
    static var previews: some View {
        let presenter = AllLeaguesMainViewPresenter(footballStandingsService: FootballStandingsRequest())
        AllLeaguesMainView(store:presenter, presenter: presenter)
    }
}
