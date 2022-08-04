//
//  String+Date.swift
//  FootballStandingsApp
//
//  Created by Камиль Сулейманов on 04.08.2022.
//

import Foundation

extension String {
    func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm'Z'"
        return dateFormatter.date(from: self)
    }
    
    func dateToString(style: DateFormatter.Style) -> Self {
        let formatter = DateFormatter()
        formatter.dateStyle = style
        if let date = toDate() {
            return formatter.string(from: date)
        }
        return ""
    }
}
