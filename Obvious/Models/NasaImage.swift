  //
  //  NasaImage.swift
  //  Obvious
  //
  //  Created by Gaurav Tiwari on 21/09/22.
  //

import Foundation

final class NasaImage: Decodable {
  let explanation, title: String
  let hdurl, url: URL

  
  init(explanation: String, title: String, hdurl: URL, url: URL) {
    self.explanation = explanation
    self.title = title
    self.hdurl = hdurl
    self.url = url
  }
}

extension NasaImage: Equatable {
  static func == (lhs: NasaImage, rhs: NasaImage) -> Bool {
    lhs.url == rhs.url
  }
}
