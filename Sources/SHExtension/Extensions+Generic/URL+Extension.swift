//
//  URL+Extension.swift
//  SahibExtension
//
//  Created by Sahib Hussain on 22/03/22.
//

import Foundation
import AVKit


public extension URL {
    
    func createVideoThumbnail(completion: ((UIImage) -> Void)? = nil) {
        
        DispatchQueue.global(qos: .background).async {
            let asset = AVAsset(url: self)
            let assetImgGenerate = AVAssetImageGenerator(asset: asset)
            assetImgGenerate.appliesPreferredTrackTransform = true
            assetImgGenerate.maximumSize = CGSize(width: UIApplication.fullWidth, height: UIApplication.fullHeight)
            
            let time = CMTimeMakeWithSeconds(5, preferredTimescale: 600)
            
            let img = try? assetImgGenerate.copyCGImage(at: time, actualTime: nil)
            
            if let img = img {
                DispatchQueue.main.async {
                    completion?(UIImage(cgImage: img))
                }
            }
        }
    }
    
}
