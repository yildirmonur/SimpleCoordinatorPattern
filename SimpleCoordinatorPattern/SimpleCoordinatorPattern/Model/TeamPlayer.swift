//
//  TeamPlayer.swift
//  SwiftUITest
//
//  Created by Yasemin Üçtaş on 27.06.2022.
//

import Foundation

// MARK: - TeamPlayer
struct TeamPlayer: Codable {
    var result: Result?
}

// MARK: - Result
struct Result: Codable {
    var players: [Player]?
    let teams: [Team]?
    let status: Bool?
    let message: String?
    let requestOrder: Int?
    let searchType, searchString, minVer: String?
    
    enum CodingKeys: String, CodingKey {
        case players, teams, status, message
        case requestOrder = "request_order"
        case searchType, searchString, minVer
    }
}

// MARK: - Player
struct Player: Codable {
    let playerID, playerFirstName, playerSecondName, playerNationality: String?
    let playerAge, playerClub: String?
    var isFavorite: Bool
    
    enum CodingKeys: String, CodingKey {
        case playerID, playerFirstName, playerSecondName, playerNationality, playerAge, playerClub, isFavorite
    }
    
    init(
        playerID: String?,
        playerFirstName: String?,
        playerSecondName: String?,
        playerNationality: String?,
        playerAge: String?,
        playerClub: String?,
        isFavorite: Bool = false
    ) {
        self.playerID = playerID
        self.playerFirstName = playerFirstName
        self.playerSecondName = playerSecondName
        self.playerNationality = playerNationality
        self.playerAge = playerAge
        self.playerClub = playerClub
        self.isFavorite = isFavorite
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        playerID = try values.decodeIfPresent(String.self, forKey: .playerID) ?? ""
        playerFirstName = try values.decodeIfPresent(String.self, forKey: .playerFirstName)
        playerSecondName = try values.decodeIfPresent(String.self, forKey: .playerSecondName)
        playerAge = try values.decodeIfPresent(String.self, forKey: .playerAge)
        playerClub = try values.decodeIfPresent(String.self, forKey: .playerClub)
        isFavorite = false
        playerNationality = .none
    }
}

// MARK: - Team
struct Team: Codable {
    let teamID, teamName, teamStadium: String?
    let teamNationality, teamCity: String?
}
