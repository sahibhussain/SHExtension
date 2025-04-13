//
//  UIImage+Extension.swift
//  SHExtension
//
//  Created by Sahib Hussain on 13/04/25.
//

import UIKit

public extension UIImage {
    
    func resized(to size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        defer { UIGraphicsEndImageContext() }
        
        guard let cgImage = self.cgImage else { return self }
        draw(in: CGRect(origin: .zero, size: size))
        return UIGraphicsGetImageFromCurrentImageContext() ?? self
    }
    
    func sizeInMB() -> Double {
        if let data = self.jpegData(compressionQuality: 1.0) ?? self.pngData() {
            return Double(data.count) / 1_048_576.0 // Bytes to MB
        }
        return 0
    }
    
    func downSizeJPEG(to sizeInMB: Double) -> UIImage? {
        var quality: CGFloat = 0.9
        while quality > 0.1 {
            guard let data = self.jpegData(compressionQuality: quality) else { return nil }
            if self.sizeInMB() > sizeInMB { quality -= 0.1 }
            else { break }
        }
        guard let data = self.jpegData(compressionQuality: quality) else { return nil }
        return .init(data: data)
    }
    
}
