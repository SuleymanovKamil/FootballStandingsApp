//
//  FootballStandingsService.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 03.08.2022.
//

import Foundation

protocol FootballStandingsService {
    func fetchLeagues() async -> Result<Leagues, RequestError>
    func fetchLeagueDetail(id: String) async -> Result<League, RequestError>
    func fetchSeasons(id: String) async -> Result<Seasons, RequestError>
    func fetchSeasonDetail(id: String)  async -> Result<SeasonDetail, RequestError>
}

struct FootballStandingsRequest: HTTPClient, FootballStandingsService {
    func fetchLeagues() async -> Result<Leagues, RequestError> {
        return await sendRequest(endpoint: Endpoint.getLeagues, responseModel: Leagues.self)
    }
    
    func fetchLeagueDetail(id: String) async -> Result<League, RequestError> {
        return await sendRequest(endpoint: Endpoint.getLeagueDetail(id: id), responseModel: League.self)
    }
    
    func fetchSeasons(id: String) async -> Result<Seasons, RequestError> {
        return await sendRequest(endpoint: Endpoint.getSeasons(id: id), responseModel: Seasons.self)
    }
    
    func fetchSeasonDetail(id: String) async -> Result<SeasonDetail, RequestError> {
        return await sendRequest(endpoint: Endpoint.seasonDetail(id: id), responseModel: SeasonDetail.self)
    }
    
}
