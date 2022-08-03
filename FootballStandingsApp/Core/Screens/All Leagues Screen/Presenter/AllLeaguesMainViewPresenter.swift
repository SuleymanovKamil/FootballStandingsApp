//
//  AllLeaguesMainViewPresenter.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 03.08.2022.
//

import SwiftUI

protocol AllLeaguesMainViewProtocol: AnyObject {
    func fetchLeagues() async
    func showErrorView(description: String)
}

class AllLeaguesMainViewPresenter: ObservableObject {
    
    //MARK: - Service
    
    let footballStandingsService: FootballStandingsService
    
    //MARK: - Properties
    
    @Published var currentLeague: String?
    @Published var leagues: [League] = []
    @Published var isErrorViewActive = false
    @Published var errorDescription = String()
    
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
    
    func showErrorView(description: String) {
        errorDescription = description
        isErrorViewActive = true
    }
    
}
