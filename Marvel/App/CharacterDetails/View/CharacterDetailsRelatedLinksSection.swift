//
//  CharacterDetailsRelatedLinksSection.swift
//  Marvel
//
//  Created by apple on 12/11/2024.
//

import SwiftUI

struct CharacterDetailsRelatedLinksSection: View {
    var urls: [MarvelCharacter.URLInfo]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("RELATED LINKS")
                .font(.caption.bold())
                .foregroundStyle(.red)
                .padding([.horizontal, .top])
            ForEach(urls) { (urlItem) in
                if let url = urlItem.urlObj {
                    Button {
                        if UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url)
                        }
                    } label: {
                        HStack {
                            Text(urlItem.type ?? "Untitled")
                                .foregroundStyle(.white)
                            Spacer()
                            Image(systemName: "chevron.forward")
                                .foregroundStyle(.white)
                        }
                        .padding()
                    }
                }
            }
        }
    }
}

#Preview {
    CharacterDetailsRelatedLinksSection(urls: [])
        .background(.black.opacity(0.8))
}
