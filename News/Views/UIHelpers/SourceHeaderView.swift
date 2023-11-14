//
//  SourceHeaderView.swift
//  News
//
//  Created by Gizem Turker on 13.11.2023.
//

import SwiftUI

struct SourceHeaderView: View {
    var body: some View {
        VStack (){
            Text("Sources")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color("CategoryTextColor"))
                .background(Color("HeaderColor"))
        }
        .background(
            Rectangle()
            .fill(Color("HeaderColor"))
            .frame(minWidth: 400, minHeight: 100)
        )
    }
}
#Preview {
    SourceHeaderView()
}
