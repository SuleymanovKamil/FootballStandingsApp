//
//  AllLeaguesMainViewPresenter.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 03.08.2022.
//

import SwiftUI

protocol AllLeaguesMainViewProtocol: AnyObject {
    func fetchLeagues() async
    func showErrorView()
}

class AllLeaguesMainViewPresenter: ObservableObject, AllLeaguesMainViewProtocol {
    @Published var leagues: [League] = []
    let footballStandingsService: FootballStandingsService
    
    init(footballStandingsService: FootballStandingsService) {
        self.footballStandingsService = FootballStandingsRequest()
        Task {
            await fetchLeagues()
        }
    }

    @MainActor func fetchLeagues() async {
        let result = await footballStandingsService.fetchLeagues()
        switch result {
        case .success(let data):
            leagues = data.data
        case .failure(let error):
            showErrorView()
            print(#function, error.localizedDescription)
        }
    }
    
    func showErrorView() {
        
    }
    
}
