  //
  //  AsynchronousImageViewModel.swift
  //  Obvious
  //
  //  Created by Gaurav Tiwari on 23/09/22.
  //

import UIKit
import Combine

final class AsynchronousImageViewModel: ObservableObject {
  
  enum State {
    case downloading
    case success(UIImage)
    case failed
  }
  
  @Published var state: State = .downloading
  var url: URL
  
  init(url: URL) {
    self.url = url
  }
  
  func downloadImage() {
    URLSession.shared.dataTask(with: url) { data, response, error in
      if error != nil {
        DispatchQueue.main.async() {
          self.state = .failed
        }
      }
      guard let data = data,
            let image = UIImage(data: data) else {
        DispatchQueue.main.async() {
          self.state = .failed
        }
        return
      }
      DispatchQueue.main.async() {
        self.state = .success(image)
      }
    }.resume()
  }
}
