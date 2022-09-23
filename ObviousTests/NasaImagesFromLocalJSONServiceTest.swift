//
//  NasaImagesFromLocalJSONServiceTest.swift
//  ObviousTests
//
//  Created by Gaurav Tiwari on 23/09/22.
//

import XCTest
@testable import Obvious

final class NasaImagesFromLocalJSONServiceTest: XCTestCase {
  
  let imageService = NasaImagesFromLocalJSONService()
  
  func test_fetched_images_data_correct() {
    imageService.fetchNasaImages { result in
      switch result {
        case .success(let images):
          XCTAssertEqual(images.count, 26)
        case .failure(let error):
          XCTAssertNil(error)
      }
    }
  }
}
