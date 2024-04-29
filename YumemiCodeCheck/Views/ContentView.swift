//
//  ContentView.swift
//  YumemiCodeCheck
//
//  Created by 森祐樹 on 2024/04/24.
//

import SwiftUI

struct ContentView: View {

    @StateObject var viewModel = ContentViewModel()

    var body: some View {
        PersonInputScreen(viewModel: viewModel)
            .sheet(item: $viewModel.prefecture) { prefecture in
                FortuneResultScreen(prefecture: prefecture)
            }
    }
}

#Preview {
    ContentView()
}
