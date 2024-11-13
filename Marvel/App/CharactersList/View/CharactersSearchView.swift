//
//  CharactersSearchView.swift
//  Marvel
//
//  Created by apple on 13/11/2024.
//

import SwiftUI

struct CharactersSearchView: View {
    @Binding var searchKey: String
    var searchResults: [MarvelCharacter]
    var cancelAction: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search...", text: $searchKey)
                }
                .padding(5)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 4))
                Spacer()
                Button {
                    cancelAction()
                } label: {
                    Text("Cancel")
                        .foregroundStyle(.red)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(10)
            .background(.black)
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(searchResults) { (character) in
                        NavigationLink {
                            CharacterDetailsView(viewModel: CharacterDetailsViewModel(character: character))
                        } label: {
                            HStack {
                                AsyncImage(url: character.imageUrl) { (image) in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .scaledToFill()
                                .frame(width: 70, height: 70)
                                .clipped()
                                if let name = character.name {
                                    Text(name)
                                        .font(.headline)
                                        .foregroundStyle(.black)
                                }
                                Spacer()
                            }
                            .background(.gray)
                        }
                    }
                }
            }
            .scrollBounceBehavior(.basedOnSize)
        }
        .frame(maxHeight: .infinity)
        .background(Color(uiColor: .darkGray))
    }
}

#Preview {
    CharactersSearchView(searchKey: .constant(""), searchResults: [MarvelCharacter(id: 1, name: "3-D Man", thumbnail: MarvelImage(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension: "jpg")), MarvelCharacter(id: 2, name: "3-D Man", thumbnail: MarvelImage(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension: "jpg")), MarvelCharacter(id: 3, name: "3-D Man", thumbnail: MarvelImage(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension: "jpg")), MarvelCharacter(id: 4, name: "3-D Man", thumbnail: MarvelImage(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension: "jpg"))], cancelAction: {})
}
