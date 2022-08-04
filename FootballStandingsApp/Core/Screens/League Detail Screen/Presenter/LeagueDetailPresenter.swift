//
//  LeagueDetailPresenter.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 04.08.2022.
//

import SwiftUI

protocol LeagueDetailProtocol: errorViewProtocol {
    func fetchSeason(with leagueID: String) async
    func showSeasonsDetailScreen(year: Int)
}

class LeagueDetailPresenter: ObservableObject {
    
    //MARK: - Service
    
    let footballStandingsService: FootballStandingsService
    
    //MARK: - Properties
    
    @Published var status: ViewStatus = .loading
    @Published var seasons: SeasonDetail?
    @Published var isErrorViewActive = false
    @Published var errorDescription = String()
    @Published var currentSeason = String()
    @Published var showDetail = false
    @Published var showSeasonsDetailView = false
    
    var league: League
    var leagueSeasonDetailPresenter: LeagueSeasonDetailPresenter?
    var isSeasonHasHistory: Bool {
        guard let season = seasons?.seasons else {
            return false
        }
        
        return season.count > 1
    }
    
    init(league: League, footballStandingsService: FootballStandingsService) {
        self.league = league
        self.footballStandingsService = FootballStandingsRequest()
        Task {
            await fetchSeason(with: league.id)
        }
    }
    
}

//MARK: - LeagueDetailProtocol

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
    
    func showSeasonsDetailScreen(year: Int) {
        let leagueSeasonDetailPresenter = LeagueSeasonDetailPresenter(league: league, year: year, footballStandingsService: footballStandingsService)
        self.leagueSeasonDetailPresenter = leagueSeasonDetailPresenter
        showSeasonsDetailView = true
    }
    
    func showErrorView(description: String) {
        errorDescription = description
        isErrorViewActive = true
    }
    
}

