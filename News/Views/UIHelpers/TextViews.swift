//
//  TextViews.swift
//  News
//
//  Created by Gizem Turker on 14.11.2023.
//

import SwiftUI

struct SourceText: View {
  var text: String

  var body: some View {
    Text(text.uppercased())
      .multilineTextAlignment(.center)
      .lineSpacing(4.0)
      .font(.subheadline)
      .fontWeight(.semibold)
      .kerning(2.0)
      .foregroundColor(Color("SourceText"))
  }
}


struct LabelText: View {
  var text: String

  var body: some View {
    Text(text)
          .font(.headline)
          .lineLimit(3)
          .foregroundColor(Color("TextColor"))
  }
}

struct DescText: View {
  var text: String

  var body: some View {
    Text(text)
          .font(.subheadline)
          .lineLimit(2)
          .foregroundColor(Color("TextColor"))
  }
}


struct BodyText: View {
  var text: String

  var body: some View {
    Text(text)
      .font(.subheadline)
      .fontWeight(.semibold)
      .multilineTextAlignment(.center)
      .lineSpacing(12)
      
  }
}

struct ButtonText: View {
  var text: String

  var body: some View {
    Text(text)
      .bold()
      .padding()
      .frame(maxWidth: .infinity)
      .background(
        Color.accentColor
      )
      .foregroundColor(.white)
      .cornerRadius(12)
  }
}


struct DateText: View {
  var date: Date

  var body: some View {
    Text(date, style: .time)
      .bold()
      .kerning(-0.2)
      .foregroundColor(Color("TextColor"))
      .font(.title3)
  }
}

struct BigBoldText: View {
  let text: String

  var body: some View {
    Text(text.uppercased())
      .kerning(2.0)
      .foregroundColor(Color("TextColor"))
      .font(.title)
      .fontWeight(.black)
  }
}

struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
     SourceText(text: "Source")
      LabelText(text: "LabelText")
      BodyText(text: "BodyText")
      ButtonText(text: "ButtonText")
      DateText(date: Date())
      BigBoldText(text: "BigBoldText")
    }
    .padding()
  }
}

