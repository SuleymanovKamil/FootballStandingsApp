//
//  ErrorViewProtocol.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 04.08.2022.
//

protocol errorViewProtocol: AnyObject {
    func showErrorView(description: String)
    var isErrorViewActive: Bool { set get }
    var status: ViewStatus { get set}
}
