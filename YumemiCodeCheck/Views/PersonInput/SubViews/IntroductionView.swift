//
//  IntroductionView.swift
//  YumemiCodeCheck
//
//  Created by 森祐樹 on 2024/04/29.
//

import SwiftUI

struct IntroductionView: View {
    var body: some View {
        ZStack {
            Image("nihonchizu")
                .resizable()
                .scaledToFit()
                .opacity(0.3)

            VStack(spacing: 4) {
                Text("相性のいい都道府県を")
                    .font(.title)
                    .bold()
                Text("占ってあげる🔮")
                    .font(.title)
                    .bold()
            }
        }
    }
}

#Preview {
    IntroductionView()
}
