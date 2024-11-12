//
//  CharacterDetailsView.swift
//  Marvel
//
//  Created by apple on 12/11/2024.
//

import SwiftUI

struct CharacterDetailsView: View {
    @StateObject var viewModel: CharacterDetailsViewModel
    @State private var previewItem: MarvelCharacter.Item?
    
    var body: some View {
        ZStack {
            ScrollView {
                LazyVStack {
                    CharacterBasicInfoView(imageUrl: viewModel.character.imageUrl, name: viewModel.character.name, description: viewModel.character.description)
                    if let comics = viewModel.character.comics?.items, !comics.isEmpty {
                        CharacterDetailsSection(title: "COMICS", items: comics, viewModel: viewModel, previewItem: $previewItem)
                    }
                    if let series = viewModel.character.series?.items, !series.isEmpty {
                        CharacterDetailsSection(title: "SERIES", items: series, viewModel: viewModel, previewItem: $previewItem)
                    }
                    if let stories = viewModel.character.stories?.items, !stories.isEmpty {
                        CharacterDetailsSection(title: "STORIES", items: stories, viewModel: viewModel, previewItem: $previewItem)
                    }
                    if let events = viewModel.character.events?.items, !events.isEmpty {
                        CharacterDetailsSection(title: "EVENTS", items: events, viewModel: viewModel, previewItem: $previewItem)
                    }
                    if let urls = viewModel.character.urls, !urls.isEmpty {
                        CharacterDetailsRelatedLinksSection(urls: urls)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom)
            }
            if let previewItem {
                CharacterDetailsImagePreview(imageUrl: previewItem.imageUrl, name: previewItem.name) {
                    self.previewItem = nil
                }
            }
        }
        .background(.black.opacity(0.8))
        .ignoresSafeArea()
        .toolbar(.hidden)
    }
}

#Preview {
    CharacterDetailsView(viewModel: CharacterDetailsViewModel(character: MarvelCharacter(id: 1, name: "A.I.M.", thumbnail: MarvelImage(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/20/52602f21f29ec", extension: "jpg"), description: "AIM is a terrorist organization bent on destroying the world.")))
}
