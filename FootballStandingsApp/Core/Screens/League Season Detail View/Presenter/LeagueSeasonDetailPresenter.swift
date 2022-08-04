//
//  LeagueSeasonDetailPresenter.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 04.08.2022.
//

import SwiftUI

protocol LeagueSeasonDetailProtocol: errorViewProtocol {
    func fetchSeason(id: String, year: Int) async
}

class LeagueSeasonDetailPresenter: ObservableObject {
    
    //MARK: - Service
    
    let footballStandingsService: FootballStandingsService
    
    //MARK: - Properties
    
    @Published var status: ViewStatus = .loading
    @Published var isErrorViewActive = false
    @Published var errorDescription = String()
    @Published var season: SeasonDetailData?
    var league: League
    
    init(league: League, year: Int, footballStandingsService: FootballStandingsService) {
        self.league = league
        self.footballStandingsService = FootballStandingsRequest()
        Task {
            await fetchSeason(id: league.id, year: year)
        }
    }
    
}

//MARK: - AllLeaguesMainViewProtocol

extension LeagueSeasonDetailPresenter: LeagueSeasonDetailProtocol {
    @MainActor func fetchSeason(id: String, year: Int) async {
        let result = await footballStandingsService.fetchSeasonDetail(id: id, year: year)
        switch result {
        case .success(let data):
            season = data.data
            status = .loaded
        case .failure(let error):
            showErrorView(description: error.localizedDescription)
            status = .error
        }
    }
    
    func showErrorView(description: String) {
        errorDescription = description
        isErrorViewActive = true
    }
    
}

