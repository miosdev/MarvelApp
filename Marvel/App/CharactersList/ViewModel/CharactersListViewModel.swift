//
//  CharactersListViewModel.swift
//  Marvel
//
//  Created by apple on 12/11/2024.
//

import Foundation

class CharactersListViewModel: ObservableObject {
    @Published var characters: [MarvelCharacter] = []
    @Published var showError: Bool = false
    var errorMessage: String = ""
    private let limit = 10
    private var offset = 0
    private var totalCount: Int = -1
    @Published var searchResults: [MarvelCharacter] = []
    
    @MainActor
    func getCharacters(name: String? = nil) async {
        let timestamp = Date().timestamp
        guard (totalCount < 0 || characters.count < totalCount), let hash = KeysManager.shared.getMd5Hash(using: timestamp) else { return }
        var parameters = ["ts": timestamp, "apikey": KeysManager.shared.apikey, "hash": hash] as [String : Any]
        if let name {
            parameters["nameStartsWith"] = name
        } else {
            parameters["limit"] = limit
            parameters["offset"] = offset
        }
        let request = NetworkRequest(endpoint: .gateway, apiPath: .characters, httpMethod: .get, parameters: parameters)
        let result = await NetworkEngine.shared.request(GetCharactersResponse.self, request: request)
        switch result {
        case .success(let response):
            if name == nil {
                characters.append(contentsOf: response.data.results)
                offset += limit
                totalCount = response.data.total
            } else {
                searchResults = response.data.results
            }
        case .failure(let error):
            errorMessage = error.localizedDescription
            showError = true
        }
    }
}
