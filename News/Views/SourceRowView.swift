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
            Text(source.name)
                .font(.headline)
                .lineLimit(1)
                .foregroundColor(.blue)
            Text(source.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(3)
        }
        .padding()

//        .overlay(
//            Rectangle().frame(height: 1).foregroundColor(.gray).padding(.top, -1),
//            alignment: .top
//        )
//        .overlay(
//            Rectangle().frame(height: 1).foregroundColor(.gray).padding(.bottom, -1),
//            alignment: .bottom
//        )
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
