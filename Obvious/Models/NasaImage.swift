  //
  //  NasaImage.swift
  //  Obvious
  //
  //  Created by Gaurav Tiwari on 21/09/22.
  //

import Foundation

struct NasaImage: Decodable {
  let explanation, title: String
  let hdurl, url: URL
}
