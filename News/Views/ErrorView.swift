//
//  ErrorView.swift
//  News
//
//  Created by Gizem Turker on 13.11.2023.
//

import SwiftUI

struct ErrorView: View {
    let description: String
    let errorAction: () -> ()
    
    var body: some View {
        VStack(spacing: 8) {
            Text(description)
                .font(.callout)
                .multilineTextAlignment(.center)
            
            Button(action: errorAction) {
                Text("Try again")
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(description: "Error: Unable to complete the operation") {
            // Error action 
        }
    }
}
