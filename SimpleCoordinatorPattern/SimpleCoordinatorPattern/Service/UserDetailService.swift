//
//  UserDetailService.swift
//  SwiftUITest
//
//  Created by Yasemin Üçtaş on 27.06.2022.
//

import Foundation

protocol TeamPlayerSearchServiceProtocol: AnyObject {
    
    @available(iOS 15.0, *)
    func search(with request: TeamPlayerSearchRequest) async throws -> TeamPlayer
}

final class TeamPlayerSearchService: TeamPlayerSearchServiceProtocol {
    
    @available(iOS 15.0, *)
    func search(with request: TeamPlayerSearchRequest) async throws -> TeamPlayer {
        let url = "https://trials.mtcmobile.co.uk/api/football/1.0/search"
        guard let url = URL(string: url) else {
            throw APError.invalidURL
        }
        
        let baseService = BaseWebService()
        return try await baseService.request(url: url, type: .post, body: request)
    }
    
    // An example of TaskGroup
    @available(iOS 15.0, *)
    func searchRequestTripled(with request: TeamPlayerSearchRequest) async throws -> [TeamPlayer] {
        return try await withThrowingTaskGroup(of: TeamPlayer.self, body: { group in
            var result = [TeamPlayer]()
            
            for _ in 0...2 {
                group.addTask { [unowned self] in
                    return try await search(with: request)
                }
            }
            
            for try await teamPlayer in group {
                result.append(teamPlayer)
            }
            
            return result
        })
    }
}
