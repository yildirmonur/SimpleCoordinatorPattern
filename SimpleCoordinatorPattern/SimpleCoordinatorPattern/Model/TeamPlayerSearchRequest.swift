//
//  UserModel.swift
//  SwiftUITest
//
//  Created by Yasemin Üçtaş on 27.06.2022.
//

import Foundation

struct TeamPlayerSearchRequest: Codable {
    
    enum SearchType {
        case players(Int)
        case teams(Int)
        case all
    }
    
    let searchString: String
    var requestOrder: Int
    var searchType: String?
    var offset: Int
    
    init(searchString: String, requestOrder: Int = 0, searchType: SearchType = .all) {
        self.searchString = searchString
        self.requestOrder = requestOrder
        
        switch searchType {
        case .all:
            self.searchType = .none
            offset = 0
            
        case .players(let offset):
            self.searchType = "players"
            self.offset = offset
        
        case .teams(let offset):
            self.searchType = "teams"
            self.offset = offset
        }
    }
}
