//
//  CharacterDetailsSection.swift
//  Marvel
//
//  Created by apple on 12/11/2024.
//

import SwiftUI

struct CharacterDetailsSection: View {
    var title: String
    var items: [MarvelCharacter.Item]
    @ObservedObject var viewModel: CharacterDetailsViewModel
    @Binding var previewItem: MarvelCharacter.Item?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.caption.bold())
                .foregroundStyle(.red)
                .padding()
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top) {
                    ForEach(items) { (item) in
                        CharacterDetailsSectionRow(resourceURI: item.resourceURI, name: item.name, viewModel: viewModel, previewItem: $previewItem)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    CharacterDetailsSection(title: "COMICS", items:  [MarvelCharacter.Item(resourceURI: "http://i.annihil.us/u/prod/marvel/i/mg/c/60/58dbce634ea70.jpg", name: "Avengers: The Initiative (2007) #14"), MarvelCharacter.Item(resourceURI: "http://i.annihil.us/u/prod/marvel/i/mg/c/60/58dbce634ea70.jpg", name: "Avengers: The Initiative (2007) #14"), MarvelCharacter.Item(resourceURI: "http://i.annihil.us/u/prod/marvel/i/mg/c/60/58dbce634ea70.jpg", name: "Avengers: The Initiative (2007) #14"), MarvelCharacter.Item(resourceURI: "http://i.annihil.us/u/prod/marvel/i/mg/c/60/58dbce634ea70.jpg", name: "Avengers: The Initiative (2007) #14")], viewModel: CharacterDetailsViewModel(character: MarvelCharacter(id: 1)), previewItem: .constant(nil))
        .background(Color.black.opacity(0.8))
}
