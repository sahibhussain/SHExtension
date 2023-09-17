//
//  UIImageView+Extension.swift
//  SplootIOS
//
//  Created by Sahib Hussain on 31/05/23.
//

import UIKit
//import Kingfisher
import AVFoundation
//import SDWebImage

extension UIImageView {
    
    public func setWebImage(_ url: URL?, placeholderImageName: String) {
//        self.kf.setImage(with: url, placeholder: UIImage(named: placeholderImageName))
//        self.sd_setImage(with: url, placeholderImage: UIImage(named: placeholderImageName), options: .refreshCached)
    }
    
    public func setIndicatorImage(_ type: String) {
        if type.lowercased() == "image" || type.lowercased() == "gif" || type.lowercased() == "sticker" {
            self.image = UIImage(systemName: "photo")
        }else if type.lowercased() == "video" {
            self.image = UIImage(systemName: "video")
        }else if type.lowercased() == "audio" {
            self.image = UIImage(systemName: "mic.fill")
        } else {
            self.image = nil
        }
    }
    
    func videoSnapshot(_ url: URL?, placeholderImageName: String) {

        guard let vidURL = url else {
            self.image = UIImage(named: placeholderImageName)
            return
        }
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            let asset = AVURLAsset(url: vidURL)
            let generator = AVAssetImageGenerator(asset: asset)
            generator.appliesPreferredTrackTransform = true
            
            var image: UIImage? = nil
            let timestamp = CMTime(seconds: 1, preferredTimescale: 60)
            if let imageRef = try? generator.copyCGImage(at: timestamp, actualTime: nil) {
                image = UIImage(cgImage: imageRef)
            }
            
            DispatchQueue.main.async {
                if let image = image {
                    self?.image = image
                }else {
                    self?.image = UIImage(named: placeholderImageName)
                }
            }
        }
        
    }
    
}
