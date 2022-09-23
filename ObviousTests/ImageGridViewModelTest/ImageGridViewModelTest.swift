//
//  ImageGridViewModelTest.swift
//  ObviousTests
//
//  Created by Gaurav Tiwari on 22/09/22.
//

import XCTest
@testable import Obvious

final class ImageGridViewModelTest: XCTestCase {
  
  var viewModel: ImageGridViewModel!
  var imageService: MockImageService!
  
  override func setUp() {
    imageService = MockImageService()
    viewModel = ImageGridViewModel(imageService: imageService)
  }
  
  override func tearDown() {
    imageService = nil
    viewModel = nil
  }
  
  func test_service_returns_images_on_success() {
    let dummyImage = NasaImage(
      explanation: "", title: "",
      hdurl: URL(string: "https://apod.nasa.gov/apod/image/1912/M94_Hubble_960.jpg")!,
      url: URL(string: "https://apod.nasa.gov/apod/image/1912/M94_Hubble_960.jpg")!
    )
    imageService.result = .success([dummyImage])
    
    viewModel.fetchImages()
    
    XCTAssertEqual(viewModel.numberOfImages, 1)
    XCTAssertEqual(viewModel.hasErrorToDisplay, false)
  }
  
  func test_service_returns_error_on_failure() {
    imageService.result = .failure(NSError(domain: "", code: -1))
    
    viewModel.fetchImages()
    
    XCTAssertEqual(viewModel.hasErrorToDisplay, true)
    XCTAssertEqual(viewModel.numberOfImages, 0)
  }
}
