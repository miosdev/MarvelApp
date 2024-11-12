//
//  CharacterDetailsViewModel.swift
//  Marvel
//
//  Created by apple on 12/11/2024.
//

import Foundation

class CharacterDetailsViewModel: ObservableObject {
    @Published var character: MarvelCharacter
    
    init(character: MarvelCharacter) {
        self.character = character
    }
    
    @MainActor
    func getItemInfo(url: String) async -> URL? {
        let timestamp = Date().timestamp
        guard let hash = KeysManager.shared.getMd5Hash(using: timestamp) else { return nil }
        let parameters = ["ts": timestamp, "apikey": KeysManager.shared.apikey, "hash": hash] as [String : Any]
        let request = NetworkRequest(endpoint: .custom(url), apiPath: .none, httpMethod: .get, parameters: parameters)
        let result = await NetworkEngine.shared.request(GetSectionInfoResponse.self, request: request)
        switch result {
        case .success(let response):
            return response.data.results.first?.imageUrl
        case .failure(let error):
            print(error.localizedDescription)
        }
        return nil
    }
}
