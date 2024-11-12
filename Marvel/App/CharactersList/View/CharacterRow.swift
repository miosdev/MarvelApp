//
//  CharacterRow.swift
//  Marvel
//
//  Created by apple on 12/11/2024.
//

import SwiftUI

struct CharacterRow: View {
    var character: MarvelCharacter
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: character.imageUrl) { (image) in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .scaledToFill()
            .frame(height: 150)
            .frame(maxWidth: .infinity)
            .clipped()
            if let name = character.name {
                Text(name)
                    .font(.headline)
                    .foregroundStyle(.black)
                    .padding()
                    .background()
                    .padding()
            }
        }
    }
}

#Preview {
    CharacterRow(character: MarvelCharacter(id: 1, name: "3-D Man", thumbnail: MarvelImage(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", extension: "jpg")))
}
