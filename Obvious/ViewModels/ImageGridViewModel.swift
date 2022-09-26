//
//  ImageGridViewModel.swift
//  Obvious
//
//  Created by Gaurav Tiwari on 22/09/22.
//

import SwiftUI
import Combine

final class ImageGridViewModel: ObservableObject {
  
  @Published var images = [NasaImage]()
  private let imageService: NasaImageService
  private(set) var imageServiceError: Error?
  @Published var showDetails = false
  var tappedImage: NasaImage?
  let imageSize: CGFloat = 100

  init(imageService: NasaImageService = NasaImagesFromLocalJSONService()) {
    self.imageService = imageService
  }
  
  func fetchImages() {
    imageService.fetchNasaImages { result in
      switch result {
        case .success(let images):
          self.images = images
        case .failure(let error):
          self.imageServiceError = error
      }
    }
  }
  
  //MARK: - Properties
  var numberOfImages: Int {
    images.count
  }
  
  var hasErrorToDisplay: Bool {
    imageServiceError != nil
  }
  
  var adaptiveColumns = [
    GridItem(.adaptive(minimum: 100))
  ]
}
