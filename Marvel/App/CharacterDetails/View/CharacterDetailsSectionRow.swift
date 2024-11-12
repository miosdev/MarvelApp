//
//  CharacterDetailsSectionRow.swift
//  Marvel
//
//  Created by apple on 12/11/2024.
//

import SwiftUI

struct CharacterDetailsSectionRow: View {
    var resourceURI: String?
    var name: String?
    @State private var imageUrl: URL?
    @ObservedObject var viewModel: CharacterDetailsViewModel
    @Binding var previewItem: MarvelCharacter.Item?
    
    var body: some View {
        VStack {
            AsyncImage(url: imageUrl) { (image) in
                image.resizable()
            } placeholder: {
                Image(systemName: "photo")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
            }
            .scaledToFit()
            .frame(height: 160)
            if let name {
                Text(name)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .frame(width: 110)
        .onAppear {
            if imageUrl == nil, let resourceURI {
                Task {
                    imageUrl = await viewModel.getItemInfo(url: resourceURI)
                }
            }
        }
        .onTapGesture {
            previewItem = MarvelCharacter.Item(resourceURI: resourceURI, name: name, imageUrl: imageUrl)
        }
    }
}

#Preview {
    CharacterDetailsSectionRow(resourceURI: "https://gateway.marvel.com/v1/public/comics/21366", name: "Avengers: The Initiative (2007) #14", viewModel: CharacterDetailsViewModel(character: MarvelCharacter(id: 1)), previewItem: .constant(nil))
        .background(.black.opacity(0.8))
}
