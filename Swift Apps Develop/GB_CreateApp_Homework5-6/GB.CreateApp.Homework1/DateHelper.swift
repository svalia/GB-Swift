//
//  DateHelper.swift
//  GB.CreateApp.Homework1
//
//  Created by Анастасия Рябова on 14.07.2023.
//

import Foundation

final class DateHelper {
    static func getDate(date: Date?) -> String {
        guard let date else {
            return ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM YYYY hh:mm"
        dateFormatter.locale = Locale(identifier: "ru_RU")

        return dateFormatter.string(from: date)
    }
}
