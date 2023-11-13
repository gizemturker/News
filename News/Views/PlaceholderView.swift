//
//  PlaceholderView.swift
//  News
//
//  Created by Gizem Turker on 13.11.2023.
//

import SwiftUI

struct PlaceholderView: View {
    let text: String
    let image: Image?
    
    var body: some View {
        VStack(spacing: 8) {
            Spacer()
            if let image = self.image {
                image
                    .imageScale(.large)
                    .font(.system(size: 52))
            }
            Text(text)
            Spacer()
                
        }
    }
}

#Preview {
    PlaceholderView(text: "No Bookmarks", image: Image(systemName: "bookmark"))
}
