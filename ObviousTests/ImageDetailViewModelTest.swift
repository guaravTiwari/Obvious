  //
  //  ImageDetailViewModelTest.swift
  //  ObviousTests
  //
  //  Created by Gaurav Tiwari on 26/09/22.
  //

import XCTest
@testable import Obvious

final class ImageDetailViewModelTest: XCTestCase {
  
  func test_single_image_view_model() {
    let dummyImage = NasaImage(
      explanation: "dummy", title: "dummy",
      hdurl: URL(string: "https://apod.nasa.gov/apod/image/1912/M94_Hubble_960.jpg")!,
      url: URL(string: "https://apod.nasa.gov/apod/image/1912/M94_Hubble_960.jpg")!
    )
    
    let viewModel = ImageDetailViewModel(
      currentImage: dummyImage,
      allImages: [dummyImage]
    )
    
    XCTAssertEqual(viewModel.url, URL(string: "https://apod.nasa.gov/apod/image/1912/M94_Hubble_960.jpg")!)
    XCTAssertEqual(viewModel.explanation, "dummy")
    XCTAssertEqual(viewModel.title, "dummy")
  }
  
  func test_move_image_view_model() {
    let dummyImage1 = NasaImage(
      explanation: "dummy", title: "dummy",
      hdurl: URL(string: "https://apod.nasa.gov/apod/image/1912/M94_Hubble_960.jpg")!,
      url: URL(string: "https://apod.nasa.gov/apod/image/1912/M94_Hubble_960.jpg")!
    )
    let dummyImage2 = NasaImage(
      explanation: "dummy2", title: "dummy2",
      hdurl: URL(string: "https://apod.nasa.gov/apod/image_960.jpg")!,
      url: URL(string: "https://apod.nasa.gov/apod/image_960.jpg")!
    )
    
    
    let viewModel = ImageDetailViewModel(
      currentImage: dummyImage1,
      allImages: [dummyImage1, dummyImage2]
    )
    
    XCTAssertEqual(viewModel.url, URL(string: "https://apod.nasa.gov/apod/image/1912/M94_Hubble_960.jpg")!)
    XCTAssertEqual(viewModel.explanation, "dummy")
    XCTAssertEqual(viewModel.title, "dummy")
    
    viewModel.move(.forward)
    
    XCTAssertEqual(viewModel.url, URL(string: "https://apod.nasa.gov/apod/image_960.jpg")!)
    XCTAssertEqual(viewModel.explanation, "dummy2")
    XCTAssertEqual(viewModel.title, "dummy2")
  }

}
