//
//  FootballStandingsService.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 03.08.2022.
//

import Foundation

protocol FootballStandingsService {
    func getLeagues() async -> Result<Leagues, RequestError>
    func getLeagueDetail() async -> Result<Leagues, RequestError>
    func getSeasons() async -> Result<Seasons, RequestError>
    func seasonDetail()  async -> Result<SeasonDetail, RequestError>
}

struct FootballStandingsRequest: HTTPClient, FootballStandingsService {
    func getLeagues() async -> Result<Leagues, RequestError> {
        return await sendRequest(endpoint: Endpoints.getLeagues, responseModel: Leagues.self)
    }
    
    func getLeagueDetail() async -> Result<Leagues, RequestError> {
        return await sendRequest(endpoint: Endpoints.getLeagueDetail, responseModel: Leagues.self)
    }
    
    func getSeasons() async -> Result<Seasons, RequestError> {
        return await sendRequest(endpoint: Endpoints.getSeasons, responseModel: Seasons.self)
    }
    
    func seasonDetail() async -> Result<SeasonDetail, RequestError> {
        return await sendRequest(endpoint: Endpoints.seasonDetail, responseModel: SeasonDetail.self)
    }
    
}
