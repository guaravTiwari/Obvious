  //
  //  ImageGridView.swift
  //  Obvious
  //
  //  Created by Gaurav Tiwari on 23/09/22.
  //

import SwiftUI

struct ImageGridView: View {
  
  @ObservedObject private var viewModel = ImageGridViewModel()
  
  private let imageSize: CGFloat = 100
  private let adaptiveColumns = [
    GridItem(.adaptive(minimum: 100))
  ]
  
  var body: some View {
    NavigationView {
      ScrollView {
        LazyVGrid(columns: adaptiveColumns, spacing: 20) {
          ForEach(viewModel.images, id: \.url) { nasaImage in
            AsyncronousImage(url: nasaImage.url)
              .frame(width: imageSize, height: imageSize)
              .clipShape(RoundedRectangle(cornerRadius: 20))

//            AsyncImage(url: nasaImage.url) { downloadedImage in
//              VStack {
//                downloadedImage
//                  .resizable()
//                  .frame(width: imageSize, height: imageSize)
//                  .aspectRatio(contentMode: .fill)
//                  .mask(RoundedRectangle(cornerRadius: 10))
//              }
//            } placeholder: {
//              ZStack {
//                Color.secondary
//                  .mask(RoundedRectangle(cornerRadius: 10))
//                ProgressView()
//              }
//            }
//            .frame(width: imageSize, height: imageSize)
          }
        }
        .padding()
      }
      .navigationTitle(Text("Cool Images"))
    }
  }
}


  //AsyncImage(url: URL(string: "https://apod.nasa.gov/apod/image/1912/M94_Hubble_960.jpg")!) { phase in
  //  switch phase {
  //    case .empty:
  //      Text("Loading Image")
  //    case .success(let downloadedImage):
  //      downloadedImage
  //        .resizable()
  //        .frame(width: imageSize, height: imageSize)
  //        .aspectRatio(contentMode: .fill)
  //        .mask(RoundedRectangle(cornerRadius: 10))
  //    case .failure(let error):
  //      Text(error.localizedDescription)
  //    default:
  //      Text("Loading Failed")
  //  }
  //  }
