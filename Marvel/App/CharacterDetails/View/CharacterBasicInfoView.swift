//
//  CharacterBasicInfoView.swift
//  Marvel
//
//  Created by apple on 12/11/2024.
//

import SwiftUI

struct CharacterBasicInfoView: View {
    var imageUrl: URL?
    var name: String?
    var description: String?
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            ZStack(alignment: .topLeading) {
                AsyncImage(url: imageUrl) { (image) in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .scaledToFill()
                .frame(maxHeight: 350)
                .frame(maxWidth: .infinity)
                .clipped()
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                        .foregroundStyle(.white)
                        .font(.title)
                        .padding()
                        .padding(.top, 40)
                }
            }
            if let name, !name.isEmpty {
                VStack(alignment: .leading, spacing: 10) {
                    Text("NAME")
                        .font(.caption.bold())
                        .foregroundStyle(.red)
                    Text(name)
                        .foregroundStyle(.white)
                }
                .padding(.horizontal)
            }
            if let description, !description.isEmpty {
                VStack(alignment: .leading, spacing: 10) {
                    Text("DESCRIPTION")
                        .font(.caption.bold())
                        .foregroundStyle(.red)
                    Text(description)
                        .foregroundStyle(.white)
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    CharacterBasicInfoView(imageUrl: URL(string: "http://i.annihil.us/u/prod/marvel/i/mg/6/20/52602f21f29ec.jpg"), name: "A.I.M.", description: "AIM is a terrorist organization bent on destroying the world.")
        .background(.black.opacity(0.8))
}
