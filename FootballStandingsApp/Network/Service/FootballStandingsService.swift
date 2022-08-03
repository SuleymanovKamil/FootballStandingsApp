//
//  FootballStandingsService.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 03.08.2022.
//

import Foundation

protocol FootballStandingsService {
    func fetchLeagues() async -> Result<Leagues, RequestError>
    func fetchLeagueDetail(id: String) async -> Result<Leagues, RequestError>
    func fetchSeasons(id: String) async -> Result<Seasons, RequestError>
    func fetchSeasonDetail(id: String)  async -> Result<SeasonDetail, RequestError>
}

struct FootballStandingsRequest: HTTPClient, FootballStandingsService {
    func fetchLeagues() async -> Result<Leagues, RequestError> {
        return await sendRequest(endpoint: Endpoints.getLeagues, responseModel: Leagues.self)
    }
    
    func fetchLeagueDetail(id: String) async -> Result<Leagues, RequestError> {
        return await sendRequest(endpoint: Endpoints.getLeagueDetail(id: id), responseModel: Leagues.self)
    }
    
    func fetchSeasons(id: String) async -> Result<Seasons, RequestError> {
        return await sendRequest(endpoint: Endpoints.getSeasons(id: id), responseModel: Seasons.self)
    }
    
    func fetchSeasonDetail(id: String) async -> Result<SeasonDetail, RequestError> {
        return await sendRequest(endpoint: Endpoints.seasonDetail(id: id), responseModel: SeasonDetail.self)
    }
    
}
