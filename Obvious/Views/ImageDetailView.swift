  //
  //  ImageDetailView.swift
  //  Obvious
  //
  //  Created by Gaurav Tiwari on 24/09/22.
  //

import SwiftUI

struct ImageDetailView: View {
  
  @ObservedObject var viewModel: ImageDetailViewModel
  
  var body: some View {
    let dragGesture = DragGesture()
      .onEnded { gesture in
        switch (gesture.translation.width, gesture.translation.height) {
          case (...0, -30...30):
            withAnimation {
              viewModel.move(.forward)
            }
          case (0..., -30...30):
            withAnimation {
              viewModel.move(.backward)
            }
          default: break
        }
      }
    
    VStack {
      Text(viewModel.title)
        .font(.title)
        .fontWeight(.medium)
      
      ScrollView(showsIndicators: false) {
        HStack {
          RemoteImageView(url: viewModel.url)
            .frame(height: 400)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        .padding(.vertical)
        
        Text(viewModel.explanation)
          .font(.body)
          .foregroundColor(.secondary)
          .multilineTextAlignment(.leading)
      }
    }
    .padding()
    .contentShape(Rectangle())
    .gesture(dragGesture)
  }
}
