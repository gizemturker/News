//
//  ContentView.swift
//  News
//
//  Created by Gizem Turker on 12.11.2023.
//

import SwiftUI

struct ContentView: View {
    @State var sources: [Article] = []
    var body: some View {
        NavigationView {
            SourceListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
