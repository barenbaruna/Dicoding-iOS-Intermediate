//
//  ImageDownloader.swift
//  LatihanMengunduhGambar
//
//  Created by Baren Baruna Harahap on 15/09/25.
//

import UIKit

class ImageDownloader {
    func downloadImage(url: URL) async throws -> UIImage {
        async let imageData: Data = try Data(contentsOf: url)
        return UIImage(data: try await imageData)!
    }
}
