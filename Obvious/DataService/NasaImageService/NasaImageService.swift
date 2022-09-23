//
//  NasaImageProtocol.swift
//  Obvious
//
//  Created by Gaurav Tiwari on 22/09/22.
//

import Foundation

typealias NasaImageServiceResponse = Result<[NasaImage], Error>

protocol NasaImageService {
  func fetchNasaImages(with completion: (NasaImageServiceResponse) -> Void)
}
