//
//  LeagueDetailPresenter.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 04.08.2022.
//

import SwiftUI

protocol LeagueDetailProtocol: errorViewProtocol {
    func fetchSeason(with leagueID: String) async
    func showAllSeasonsScreen()
}

class LeagueDetailPresenter: ObservableObject {
    
    //MARK: - Service
    
    let footballStandingsService: FootballStandingsService
    
    //MARK: - Properties
    
    @Published var status: ViewStatus = .loading
    @Published var league: League
    @Published var seasons: SeasonDetail?
    @Published var isErrorViewActive = false
    @Published var errorDescription = String()
    @Published var showAllSeasonsView = false
    
    init(league: League, footballStandingsService: FootballStandingsService) {
        self.league = league
        self.footballStandingsService = FootballStandingsRequest()
        Task {
            await fetchSeason(with: league.id)
        }
    }
    
}

//MARK: - AllLeaguesMainViewProtocol

extension LeagueDetailPresenter: LeagueDetailProtocol {
    @MainActor func fetchSeason(with leagueID: String) async {
        let result = await footballStandingsService.fetchSeasons(id: leagueID)
        switch result {
        case .success(let data):
            seasons = data.data
            status = .loaded
        case .failure(let error):
            showErrorView(description: error.localizedDescription)
            status = .error
        }
    }
    
    func showAllSeasonsScreen() {
        showAllSeasonsView = true
    }
    
    func showErrorView(description: String) {
        errorDescription = description
        isErrorViewActive = true
    }
    
}

