  //
  //  ImageDetailViewModel.swift
  //  Obvious
  //
  //  Created by Gaurav Tiwari on 26/09/22.
  //

import Foundation
import Combine

final class ImageDetailViewModel: ObservableObject {
  
  enum Direction {
    case forward, backward
  }
  
  @Published var currentImage: NasaImage
  var allImages: [NasaImage]
  
  init(currentImage: NasaImage, allImages: [NasaImage]) {
    self.currentImage = currentImage
    self.allImages = allImages
  }
  
  var title: String {
    currentImage.title
  }
  
  var explanation: String {
    currentImage.explanation
  }
  
  var url: URL {
    currentImage.url
  }
  
  func move(_ direction: Direction) {
    currentImage = nextImage(for: direction)
  }
  
  private func nextImage(for direction: Direction) -> NasaImage {
    let currentIndex = allImages.firstIndex(of: currentImage) ?? -1
    var nextIndex = currentIndex
    
    switch direction {
      case .forward:
        nextIndex = currentIndex + 1
      case .backward:
        nextIndex = currentIndex - 1
    }
    
    nextIndex = allImages.indices.contains(nextIndex) ? nextIndex : 0
    return allImages[nextIndex]
  }
}
