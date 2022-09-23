//
//  MockImageService.swift
//  ObviousTests
//
//  Created by Gaurav Tiwari on 22/09/22.
//

import Foundation
@testable import Obvious

final class MockImageService: NasaImageService {
  
  var result = Obvious.NasaImageServiceResponse.failure(NSError(domain: "", code: -1))
  
  func fetchNasaImages(with completion: (Obvious.NasaImageServiceResponse) -> Void) {
    completion(result)
  }
}
