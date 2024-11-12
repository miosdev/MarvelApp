//
//  CharactersListTopBar.swift
//  Marvel
//
//  Created by apple on 12/11/2024.
//

import SwiftUI

struct CharactersListTopBar: View {
    var searchAction: () -> Void
    
    var body: some View {
        HStack {
            ZStack {
                Text("MARVEL")
                    .font(.title)
                    .foregroundStyle(.white)
                HStack {
                    Spacer()
                    Button {
                        searchAction()
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .font(.title2)
                            .foregroundStyle(.red)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.black)
    }
}

#Preview {
    CharactersListTopBar(searchAction: {})
}
