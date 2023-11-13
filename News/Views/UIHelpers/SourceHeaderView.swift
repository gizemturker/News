//
//  SourceHeaderView.swift
//  News
//
//  Created by Gizem Turker on 13.11.2023.
//

import SwiftUI

struct SourceHeaderView: View {
    var body: some View {
        VStack {
            Text("Sources")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
        }
        .frame(height: 40)
    }
}

#Preview {
    SourceHeaderView()
}
