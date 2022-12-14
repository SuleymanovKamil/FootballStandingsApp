//
//  FootballStandingsService.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 03.08.2022.
//

import Foundation

protocol FootballStandingsService {
    func fetchLeagues() async -> Result<Leagues, RequestError>
    func fetchSeasons(id: String) async -> Result<SeasonsAvailable, RequestError>
    func fetchSeasonDetail(id: String, year: Int)  async -> Result<SeasonDetailModel, RequestError>
}

struct FootballStandingsRequest: HTTPClient, FootballStandingsService {
    func fetchLeagues() async -> Result<Leagues, RequestError> {
        return await sendRequest(endpoint: Endpoint.getLeagues, responseModel: Leagues.self)
    }
    
    func fetchSeasons(id: String) async -> Result<SeasonsAvailable, RequestError> {
        return await sendRequest(endpoint: Endpoint.getSeasons(id: id), responseModel: SeasonsAvailable.self)
    }
    
    func fetchSeasonDetail(id: String, year: Int) async -> Result<SeasonDetailModel, RequestError> {
        return await sendRequest(endpoint: Endpoint.seasonDetail(id: id, year: year), responseModel: SeasonDetailModel.self)
    }
    
}
