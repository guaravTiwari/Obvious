  //
  //  JSONReaderError.swift
  //  Obvious
  //
  //  Created by Gaurav Tiwari on 21/09/22.
  //

import Foundation

enum JSONReaderError: LocalizedError {
  
case fileNameMissing
case fileNotFound
case fileNotDecodable
  
  var errorDescription: String {
    switch self {
      case .fileNameMissing:
        return "File name is missing, check the file name passed"
      case .fileNotFound:
        return "No JSON file was found at the described path"
      case .fileNotDecodable:
        return "Unable to decode JSON file at the described path"
    }
  }
}
