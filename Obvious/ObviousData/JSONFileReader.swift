  //
  //  JSONFileReader.swift
  //  Obvious
  //
  //  Created by Gaurav Tiwari on 21/09/22.
  //

import Foundation

struct JSONFileReader {
  
  func decodeArray<T: Decodable>(
    ofType: T.Type, fromFileAt path: String
  ) throws -> [T] {
    
    guard path.isEmpty == false else {
      throw JSONReaderError.fileNameMissing
    }

    guard let fileURL = Bundle.main.url(forResource: path, withExtension: ".json") else {
      throw JSONReaderError.fileNotFound
    }
    
    guard let data = try? Data(contentsOf: fileURL),
          let loadedData = try? JSONDecoder().decode([T].self, from: data) else {
      throw JSONReaderError.fileNotDecodable
    }
    
    return loadedData
  }
  
}
