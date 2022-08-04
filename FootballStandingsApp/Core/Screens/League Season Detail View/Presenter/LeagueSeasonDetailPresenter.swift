//
//  LeagueSeasonDetailPresenter.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 04.08.2022.
//

import SwiftUI

protocol LeagueSeasonDetailProtocol: errorViewProtocol {
    func fetchSeason(id: String) async
}

class LeagueSeasonDetailPresenter: ObservableObject {
    
    //MARK: - Service
    
    let footballStandingsService: FootballStandingsService
    
    //MARK: - Properties
    
    @Published var status: ViewStatus = .loading
    @Published var isErrorViewActive = false
    @Published var errorDescription = String()
    var league: League
    
    init(league: League, footballStandingsService: FootballStandingsService) {
        self.league = league
        self.footballStandingsService = FootballStandingsRequest()
        Task {
            await fetchSeason(id: league.id)
        }
    }
    
}

//MARK: - AllLeaguesMainViewProtocol

extension LeagueSeasonDetailPresenter: LeagueSeasonDetailProtocol {
    @MainActor func fetchSeason(id: String) async {
        let result = await footballStandingsService.fetchSeasonDetail(id: id)
        switch result {
        case .success(let data):
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

