//
//  AllLeaguesMainViewPresenter.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 03.08.2022.
//

import SwiftUI

protocol errorViewProtocol: AnyObject {
    func showErrorView(description: String)
    var isErrorViewActive: Bool { set get }
}


protocol AllLeaguesMainViewProtocol: errorViewProtocol {
    func fetchLeagues() async
    func showLeagueDetailScreen(with league: League)
    func showErrorView(description: String)
}

class AllLeaguesMainViewPresenter: ObservableObject {
    
    //MARK: - Service
    
    let footballStandingsService: FootballStandingsService
    
    //MARK: - Properties

    @Published var leagues: [League] = []
    @Published var isErrorViewActive = false
    @Published var errorDescription = String()
    @Published var showLeagueDetailView = false
    @Published var showLeagueDetailPresenter: LeagueDetailPresenter?
    
    init(footballStandingsService: FootballStandingsService) {
        self.footballStandingsService = FootballStandingsRequest()
        Task {
            await fetchLeagues()
        }
    }
    
}

//MARK: - AllLeaguesMainViewProtocol

extension AllLeaguesMainViewPresenter: AllLeaguesMainViewProtocol {
    @MainActor func fetchLeagues() async {
        let result = await footballStandingsService.fetchLeagues()
        switch result {
        case .success(let data):
            leagues = data.data
        case .failure(let error):
            showErrorView(description: error.localizedDescription)
        }
    }
    
    func showLeagueDetailScreen(with league: League) {
        let showDetailPresenter = LeagueDetailPresenter(league: league, footballStandingsService: footballStandingsService)
        showLeagueDetailPresenter = showDetailPresenter
        showLeagueDetailView = true
    }
    
    func showErrorView(description: String) {
        errorDescription = description
        isErrorViewActive = true
    }
    
}
