  //
  //  ImageGridView.swift
  //  Obvious
  //
  //  Created by Gaurav Tiwari on 23/09/22.
  //

import SwiftUI
import SDWebImageSwiftUI

struct ImageGridView: View {
  
  @ObservedObject private var viewModel = ImageGridViewModel()
  
  var body: some View {
    NavigationView {
      ScrollView {
        LazyVGrid(
          columns: viewModel.adaptiveColumns, spacing: 20
        ) {
          ForEach(viewModel.images, id: \.url) { nasaImage in
            RemoteImageView(url: nasaImage.url)
              .frame(
                width: viewModel.imageSize,
                height: viewModel.imageSize
              )
              .clipShape(RoundedRectangle(cornerRadius: 20))
              .onTapGesture {
                viewModel.tappedImage = nasaImage
                viewModel.showDetails.toggle()
              }
          }
        }
        .padding()
        .sheet(isPresented: $viewModel.showDetails) {
          if let tappedImage = viewModel.tappedImage {
            let viewModel = ImageDetailViewModel(
              currentImage: tappedImage, allImages: viewModel.images
            )
            ImageDetailView(viewModel: viewModel)
          }
        }
      }
      .navigationTitle(Text("Cool Images"))
    }
    .onAppear {
      viewModel.fetchImages()
    }
  }
}
