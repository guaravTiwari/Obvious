  //
  //  RemoteImageView.swift
  //  Obvious
  //
  //  Created by Gaurav Tiwari on 24/09/22.
  //

import SwiftUI
import SDWebImageSwiftUI

struct RemoteImageView: View {
  
  var url: URL
  
  var body: some View {
    WebImage(url: url)
      .resizable()
      .placeholder {
        Rectangle()
          .clipShape(RoundedRectangle(cornerRadius: 20))
          .foregroundColor(.secondary)
      }
      .indicator(.activity)
      .animation(.easeIn, value: 0.5)
      .transition(.fade)
  }
}
