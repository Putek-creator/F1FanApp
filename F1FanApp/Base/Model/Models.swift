//
//  Models.swift
//  F1FanApp
//
//  Created by Łukasz  Putkowski on 12/12/2022.
//

import Foundation

// MARK: - MRData
struct MRData: Codable {
    let xmlns: String
    let series: String
    let url: String
    let limit, offset, total: String
    let standingsTable: StandingsTable?
    let raceTable: RaceTable?

    enum CodingKeys: String, CodingKey {
        case xmlns, series, url, limit, offset, total
        case standingsTable = "StandingsTable"
        case raceTable = "RaceTable"
    }
}
