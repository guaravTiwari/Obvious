  //
  //  JSONFileReaderTest.swift
  //  ObviousTests
  //
  //  Created by Gaurav Tiwari on 21/09/22.
  //

import XCTest
@testable import Obvious

final class JSONFileReaderTest: XCTestCase {
  
  let fileReader = JSONFileReader()
  
    //MARK: - Tests including the filename
  func test_missing_filename_throws() {
    XCTAssertThrowsError(
      try fileReader.decodeArray(ofType: NasaImage.self, fromFileAt: "")
    )
    
    do {
      _ = try fileReader.decodeArray(ofType: NasaImage.self, fromFileAt: "")
    } catch {
      guard let jsonReaderError = error as? JSONReaderError else {
        XCTFail("Wrong error thrown, must have been JSONReaderError.fileNameMissing")
        return
      }
      
      XCTAssertEqual(jsonReaderError, JSONReaderError.fileNameMissing)
    }
  }
  
  func test_invalid_filename_throws() {
    XCTAssertThrowsError(
      try fileReader.decodeArray(ofType: NasaImage.self, fromFileAt: "gaurav")
    )

    do {
      _ = try fileReader.decodeArray(ofType: NasaImage.self, fromFileAt: "gaurav")
    } catch {
      guard let jsonReaderError = error as? JSONReaderError else {
        XCTFail("Wrong error thrown, must have been JSONReaderError.fileNotFound")
        return
      }

      XCTAssertEqual(jsonReaderError, JSONReaderError.fileNotFound)
    }
  }
  
    //MARK: - Tests including the JSON Data
  func test_invalid_file_throws() {
    XCTAssertThrowsError(
      try fileReader.decodeArray(ofType: NasaImage.self, fromFileAt: "InvalidImageData")
    )
    
    do {
      _ = try fileReader.decodeArray(ofType: NasaImage.self, fromFileAt: "InvalidImageData")
    } catch {
      guard let jsonReaderError = error as? JSONReaderError else {
        XCTFail("Wrong error thrown, must have been JSONReaderError.fileNotLoadable")
        return
      }
      
      XCTAssertEqual(jsonReaderError, JSONReaderError.fileNotDecodable)
    }
  }
  
  func test_valid_file_unable_to_decode_into_wrong_type() {
    struct Dummy: Decodable {
      let name: String
    }

    XCTAssertThrowsError(
      try fileReader.decodeArray(ofType: Dummy.self, fromFileAt: "NasaImageData")
    )

    do {
      _ = try fileReader.decodeArray(ofType: Dummy.self, fromFileAt: "NasaImageData")
    } catch {
      guard let jsonReaderError = error as? JSONReaderError else {
        XCTFail("Wrong error thrown, must have been JSONReaderError.fileNotDecodable")
        return
      }

      XCTAssertEqual(jsonReaderError, JSONReaderError.fileNotDecodable)
    }
  }
  
  func test_valid_file_able_to_decode_into_correct_type() {
    XCTAssertNoThrow(
      try fileReader.decodeArray(ofType: NasaImage.self, fromFileAt: "NasaImageData")
    )
    
    let images = try! fileReader.decodeArray(ofType: NasaImage.self, fromFileAt: "NasaImageData")
    
    XCTAssertEqual(images.count, 26)
    
    XCTAssertEqual(images[0].title, "Starburst Galaxy M94 from Hubble")
    XCTAssertEqual(images[0].url, URL(string: "https://apod.nasa.gov/apod/image/1912/M94_Hubble_960.jpg")!)
    XCTAssertEqual(images[0].hdurl, URL(string:"https://apod.nasa.gov/apod/image/1912/M94_Hubble_1002.jpg")!)
    XCTAssertEqual(images[0].explanation, "Why does this galaxy have a ring of bright blue stars?  Beautiful island universe Messier 94 lies a mere 15 million light-years distant in the northern constellation of the Hunting Dogs (Canes Venatici). A popular target for Earth-based astronomers, the face-on spiral galaxy is about 30,000 light-years across, with spiral arms sweeping through the outskirts of its broad disk. But this Hubble Space Telescope field of view spans about 7,000 light-years across M94's central region. The featured close-up highlights the galaxy's compact, bright nucleus, prominent inner dust lanes, and the remarkable bluish ring of young massive stars. The ring stars are all likely less than 10 million years old, indicating that M94 is a starburst galaxy that is experiencing an epoch of rapid star formation from inspiraling gas. The circular ripple of blue stars is likely a wave propagating outward, having been triggered by the gravity and rotation of a oval matter distributions. Because M94 is relatively nearby, astronomers can better explore details of its starburst ring.    Astrophysicists: Browse 2,000+ codes in the Astrophysics Source Code Library")
  }
}
