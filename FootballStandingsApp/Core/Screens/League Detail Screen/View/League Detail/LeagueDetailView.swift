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
    @State private var currentSeason = ""
    @State private var showDetail = false
    
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
                    if let seasons = store.seasons {
                        List(seasons.seasons, id: \.year) { season in
                            VStack(alignment: .leading, spacing: 6) {
                                Text(season.displayName)
                                    .font(.callout)
                                
                                Text("\(season.startDate.dateToString(style: .short)) - \(season.endDate.dateToString(style: .short))")
                                    .font(.caption2)
                                
                                if season.types.count > 1 {
                                    Button {
                                        currentSeason = season.displayName
                                        showDetail = true
                                    } label: {
                                        Text(showDetail && currentSeason == season.displayName ? "Hide" : "Show season history")
                                            .font(.callout)
                                            .foregroundColor(.blue)
                                    }
                                    
                                    if showDetail && currentSeason == season.displayName {
                                        VStack(alignment: .leading, spacing: 6) {
                                            ForEach(season.types, id: \.id) { type in
                                                HStack {
                                                    Text(type.name)
                                                    
                                                    Text("\(type.startDate.dateToString(style: .short)) - \(type.endDate.dateToString(style: .short))")
                                                        .font(.caption2)
                                                    
                                                    Spacer()
                                                }
                                                .font(.caption2)
                                            }
                                        }
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color(UIColor.lightGray))
                                    }
                                }
                            }
                            .padding(.bottom, 4)
                            .listRowBackground(Color.clear)
                        }
                    }
                case .error:
                    ErrorView(errorText: store.errorDescription)
                }
            }
        }
        .navigationBarTitle(Text(store.league.name), displayMode: .inline)
    }
}


struct LeagueDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let presenter = AllLeaguesMainViewPresenter(footballStandingsService: FootballStandingsRequest())
        AllLeaguesMainView(store:presenter, presenter: presenter)
    }
}




