//
//  CharactersListView.swift
//  Marvel
//
//  Created by apple on 12/11/2024.
//

import SwiftUI

struct CharactersListView: View {
    @StateObject var viewModel: CharactersListViewModel
    @State private var showSearchView: Bool = false
    @State private var searchKey: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    CharactersListTopBar(searchAction: {
                        showSearchView = true
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
                .onAppear {
                    Task {
                        await viewModel.getCharacters()
                    }
                }
                if showSearchView {
                    CharactersSearchView(searchKey: $searchKey, searchResults: viewModel.searchResults) {
                        showSearchView = false
                        viewModel.searchResults = []
                        searchKey = ""
                    }
                    .onChange(of: searchKey) { (_, newValue) in
                        if !newValue.isEmpty {
                            Task {
                                await viewModel.getCharacters(name: newValue)
                            }
                        }
                    }
                }
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
        }
    }
}

#Preview {
    CharactersListView(viewModel: CharactersListViewModel())
}
