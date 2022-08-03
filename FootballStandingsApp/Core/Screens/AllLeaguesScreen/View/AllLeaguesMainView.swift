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
            List(store.leagues, id: \.id) { league in
                NavigationLink {
                    Text(league.name)
                } label: {
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
                        
                        Text(league.name)
                    }
                }
            }
            .navigationBarTitle("All Leagues")
            .listStyle(.plain)
        }
    }
}

struct AllLeaguesMainView_Previews: PreviewProvider {
    static var previews: some View {
        let presenter = AllLeaguesMainViewPresenter(footballStandingsService: FootballStandingsRequest())
        AllLeaguesMainView(store:presenter, presenter: presenter)
    }
}
