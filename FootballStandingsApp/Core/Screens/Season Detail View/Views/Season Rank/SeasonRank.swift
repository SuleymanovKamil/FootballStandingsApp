//
//  SeasonRank.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 04.08.2022.
//

import SwiftUI

struct SeasonRank: View {
    @ObservedObject var store: LeagueSeasonDetailPresenter
    var presenter: LeagueSeasonDetailProtocol
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading, spacing: 0) {
                seasonsScrollView
                seasonsRank
            }
            .padding()
        }
    }
}

struct SeasonRank_Previews: PreviewProvider {
    static var previews: some View {
        let presenter = AllLeaguesMainViewPresenter(footballStandingsService: FootballStandingsRequest())
        AllLeaguesMainView(store:presenter, presenter: presenter)
    }
}

extension SeasonRank {
    @ViewBuilder private var seasonsScrollView: some View {
        if let seasons = store.seasons?.seasons {
            VStack(alignment: .leading) {
                Text("All Seasons:")
                    .font(.headline)
                
                ScrollViewReader { proxy in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(seasons, id:\.year) { season in
                                Button {
                                    Task {
                                        store.status = .loading
                                        await store.fetchSeason(id: store.league.id, year: season.year)
                                    }
                                } label: {
                                    Text(String(season.year))
                                        .padding(.horizontal)
                                        .padding(.vertical, 3)
                                        .background((season.year == store.season?.season ? Color.black.opacity(0.06) :  Color.white).cornerRadius(4))
                                }
                                .id(season.year)
                            }
                            .onAppear {
                                proxy.scrollTo(store.season?.season)
                            }
                        }
                    }
                }
            }
            .padding(.vertical)
            .background(Color.white)
        }
    }
    @ViewBuilder private var seasonsRank: some View {
        if let season = store.season {
            Text("Table:")
                .font(.headline)
                .padding(.bottom)
            
            ForEach(0..<season.standings.count, id: \.self) { index in
                let standing = season.standings[index]
                VStack(alignment: .leading) {
                    HStack {
                        Text("\(index + 1)")
                        
                        if let logoURL = standing.team?.logos?.first?.href {
                            AsyncImageView(url: logoURL, width: 25, height: 25)
                        }
                        
                        Text(standing.team?.name ?? "")
                        
                        Spacer()
                        
                        let point = standing.stats.filter({$0.name == "points"})
                        if let value = point.first?.value {
                            Text("\(value)")
                        }
                    }
                }
                .padding()
                .background(index % 2 == 0 ? Color.black.opacity(0.06) : Color.white)
            }
        }
    }
}
