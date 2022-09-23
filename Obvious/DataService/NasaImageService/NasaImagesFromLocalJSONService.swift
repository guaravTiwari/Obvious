//
//  NasaImagesFromLocalJSONService.swift
//  Obvious
//
//  Created by Gaurav Tiwari on 22/09/22.
//

import Foundation

struct NasaImagesFromLocalJSONService: NasaImageService {
  
  private let jsonReader = JSONFileReader()
  
  func fetchNasaImages(with completion: (NasaImageServiceResponse) -> Void) {
    do {
      let images = try jsonReader.decodeArray(ofType: NasaImage.self, fromFileAt: "NasaImageData")
      completion(.success(images))
    } catch {
      completion(.failure(error))
    }
  }
}
