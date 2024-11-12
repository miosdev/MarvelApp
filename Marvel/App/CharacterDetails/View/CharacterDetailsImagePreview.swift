//
//  CharacterDetailsImagePreview.swift
//  Marvel
//
//  Created by apple on 13/11/2024.
//

import SwiftUI

struct CharacterDetailsImagePreview: View {
    var imageUrl: URL?
    var name: String?
    var closeAction: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Spacer()
                Button {
                    closeAction()
                } label: {
                    Image(systemName: "xmark.square")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                }
            }
            .padding(.horizontal)
            AsyncImage(url: imageUrl) { (image) in
                image.resizable()
            } placeholder: {
                Image(systemName: "photo")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
            }
            .scaledToFit()
            .clipped()
            .padding(.horizontal)
            if let name {
                Text(name)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal)
            }
        }
        .frame(maxHeight: .infinity)
        .background(.black)
    }
}

#Preview {
    CharacterDetailsImagePreview(imageUrl: URL(string: "http://i.annihil.us/u/prod/marvel/i/mg/c/60/58dbce634ea70.jpg"), name: "Avengers: The Initiative (2007) #14", closeAction: {})
}
