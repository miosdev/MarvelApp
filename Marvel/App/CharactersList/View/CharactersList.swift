//
//  CharactersList.swift
//  Marvel
//
//  Created by apple on 12/11/2024.
//

import SwiftUI

struct CharactersList: View {
    var characters: [MarvelCharacter]
    var loadMoreData: () -> Void
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(characters) { (character) in
                    NavigationLink {
                        CharacterDetailsView(viewModel: CharacterDetailsViewModel(character: character))
                    } label: {
                        CharacterRow(character: character)
                    }
                }
                ProgressView()
                    .tint(.white)
                    .padding()
                    .onAppear {
                        loadMoreData()
                    }
            }
        }
    }
}

#Preview {
    CharactersList(characters: [MarvelCharacter(id: 1, name: "3-D Man", thumbnail: MarvelImage(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension: "jpg")), MarvelCharacter(id: 2, name: "3-D Man", thumbnail: MarvelImage(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension: "jpg")), MarvelCharacter(id: 3, name: "3-D Man", thumbnail: MarvelImage(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension: "jpg"))], loadMoreData: {})
}
