//
//  SourceRowView.swift
//  News
//
//  Created by Gizem Turker on 13.11.2023.
//

import SwiftUI

struct SourceRowView: View {
    let source: Source
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            SourceText(text: source.name)
            LabelText(text: source.description)
        }
        .padding()
    }

}

struct SourceRowView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            List {
                SourceRowView(source: .previewData)
                    .listRowInsets(.init(top:0, leading: 0, bottom: 0, trailing: 0))
            }
            .listStyle(.plain)
        }
    }
       
}
