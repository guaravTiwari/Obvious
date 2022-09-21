//
//  JSONReaderErrorTest.swift
//  ObviousTests
//
//  Created by Gaurav Tiwari on 22/09/22.
//

import XCTest
@testable import Obvious

final class JSONReaderErrorTest: XCTestCase {

  func test_correct_errorDescription_for_fileNotFound() {
    let readerError = JSONReaderError.fileNotFound

    XCTAssertEqual(readerError, JSONReaderError.fileNotFound)

    XCTAssertEqual(
      readerError.errorDescription, "No JSON file was found at the described path"
    )
  }
  
  func test_correct_errorDescription_for_fileNameMissing() {
    let readerError = JSONReaderError.fileNameMissing
    
    XCTAssertEqual(readerError, JSONReaderError.fileNameMissing)
    
    XCTAssertEqual(
      readerError.errorDescription, "File name is missing, check the file name passed"
    )
  }

  func test_correct_errorDescription_for_fileNotDecodable() {
    let readerError = JSONReaderError.fileNotDecodable
    
    XCTAssertEqual(readerError, JSONReaderError.fileNotDecodable)
    
    XCTAssertEqual(
      readerError.errorDescription, "Unable to decode JSON file at the described path"
    )
  }
}
