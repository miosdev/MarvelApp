//
//  ContentView.swift
//  Marvel
//
//  Created by apple on 12/11/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CharactersListView(viewModel: CharactersListViewModel())
    }
}

#Preview {
    ContentView()
}
