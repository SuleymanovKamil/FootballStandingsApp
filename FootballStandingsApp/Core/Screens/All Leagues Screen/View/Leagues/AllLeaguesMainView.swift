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
                switch store.status {
                case .loading:
                    ProgressView()
                case .loaded:
                    LeaguesList(store: store, presenter: presenter)
                case .error:
                    ErrorView(errorText: store.errorDescription)
                }
                
                NavigationLink(isActive: $store.showLeagueDetailView) {
                    if let presenter = store.showLeagueDetailPresenter {
                        LeagueDetailView(store: presenter, presenter: presenter)
                    }
                } label: { EmptyView() }
            }
            .navigationBarTitle("All Leagues")
        }
    }
}

struct AllLeaguesMainView_Previews: PreviewProvider {
    static var previews: some View {
        let presenter = AllLeaguesMainViewPresenter(footballStandingsService: FootballStandingsRequest())
        AllLeaguesMainView(store:presenter, presenter: presenter)
    }
}
