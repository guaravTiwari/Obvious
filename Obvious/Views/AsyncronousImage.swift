  //
  //  AsyncronousImage.swift
  //  Obvious
  //
  //  Created by Gaurav Tiwari on 23/09/22.
  //

import SwiftUI

struct AsyncronousImage: View {
  
  @Namespace var namespace
  @ObservedObject var viewModel: AsynchronousImageViewModel
  
  init(url: URL) {
    viewModel = AsynchronousImageViewModel(url: url)
  }
  
  var body: some View {
    HStack {
      switch viewModel.state {
        case .success(let image):
          Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .transition(.opacity)
        case .downloading:
          ZStack {
            Rectangle()
              .clipShape(RoundedRectangle(cornerRadius: 20))
              .foregroundColor(.secondary)
            ProgressView()
          }
          .transition(.opacity)
          
        case .failed:
          ZStack {
            Rectangle()
              .clipShape(RoundedRectangle(cornerRadius: 20))
              .foregroundColor(.secondary)
            Image(uiImage: UIImage(systemName: "photo")!)
          }
          .transition(.opacity)
      }
    }
    .onAppear {
      viewModel.downloadImage()
    }
  }
}
