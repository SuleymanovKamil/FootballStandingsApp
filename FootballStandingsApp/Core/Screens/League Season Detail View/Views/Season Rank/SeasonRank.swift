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
        VStack (spacing: 0) {
            if let season = store.season {
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
        .padding()
    }
}

struct SeasonRank_Previews: PreviewProvider {
    static var previews: some View {
        let presenter = AllLeaguesMainViewPresenter(footballStandingsService: FootballStandingsRequest())
        AllLeaguesMainView(store:presenter, presenter: presenter)
    }
}
