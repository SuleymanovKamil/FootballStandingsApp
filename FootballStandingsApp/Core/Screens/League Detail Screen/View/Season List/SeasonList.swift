//
//  SeasonList.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 04.08.2022.
//

import SwiftUI

struct SeasonList: View {
    @ObservedObject var store: LeagueDetailPresenter
    var presenter: LeagueDetailProtocol
    
    var body: some View {
        Group {
            if let seasons = store.seasons {
                List(seasons.seasons, id: \.year) { season in
                    VStack(alignment: .leading, spacing: 6) {
                        Text(season.displayName)
                            .font(.headline)
                        
                        Text("Season period: \(season.startDate.dateToString(style: .short)) - \(season.endDate.dateToString(style: .short))")
                            .font(.caption2)
                        
                        if store.isSeasonHasHistory {
                            showHistoryButton(season: season)
                            
                            let isHistoryShowed = store.showDetail && store.currentSeason == season.displayName
                            if isHistoryShowed {
                                seasonHistory(season: season)
                            }
                        }
                    }
                    .padding()
                    .listRowBackground(Color.white)
                }
            }
        }
    }
}

struct SeasonList_Previews: PreviewProvider {
    static var previews: some View {
        let presenter = AllLeaguesMainViewPresenter(footballStandingsService: FootballStandingsRequest())
        AllLeaguesMainView(store:presenter, presenter: presenter)
    }
}

extension SeasonList {
    private func showHistoryButton(season: Season) -> some View {
        Button {
            guard store.currentSeason != season.displayName else {
                store.showDetail = false
                store.currentSeason = String()
                return
            }
            
            store.currentSeason = season.displayName
            store.showDetail = true
        } label: {
            Text(store.showDetail && store.currentSeason == season.displayName ? "Hide" : "Show season history")
                .font(.callout)
                .foregroundColor(.blue)
        }
    }
    private func seasonHistory(season: Season) -> some View {
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
