//
//  CharactersListView.swift
//  Marvel
//
//  Created by apple on 12/11/2024.
//

import SwiftUI

struct CharactersListView: View {
    @StateObject var viewModel: CharactersListViewModel
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                CharactersListTopBar(searchAction: {
                    // search
                })
                if viewModel.characters.isEmpty {
                    ProgressView()
                        .tint(.white)
                        .frame(maxHeight: .infinity)
                } else {
                    CharactersList(characters: viewModel.characters, loadMoreData: {
                        Task {
                            await viewModel.getCharacters()
                        }
                    })
                }
            }
            .background(.gray)
            .toolbar(.hidden)
        }
        .alert("Error", isPresented: $viewModel.showError, actions: {
            Button {
                viewModel.showError = false
                Task {
                    await viewModel.getCharacters()
                }
            } label: {
                Text("Retry")
            }
        }, message: {
            Text(viewModel.errorMessage)
        })
        .onAppear {
            Task {
                await viewModel.getCharacters()
            }
        }
    }
}

#Preview {
    CharactersListView(viewModel: CharactersListViewModel())
}
