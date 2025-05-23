//
//  View+Extension.swift
//  SahibExtension
//
//  Created by Sahib Hussain on 17/09/23.
//

import Foundation
import SwiftUI

public extension View{
    
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view
        
        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear
        
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        
        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
    
    func flippedUpsideDown() -> some View {
        self.modifier(FlippedUpsideDown())
    }
    
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
    
    @available(iOS 16.0, *)
    func snapshot(_ size: CGSize = .init(width: 300, height: 300)) -> UIImage? {
        let renderer = ImageRenderer(content: self)
        renderer.proposedSize = ProposedViewSize(width: size.width, height: size.height)
        return renderer.uiImage
    }
    
    @available(iOS 16.0, *)
    func snapshotUrl(_ size: CGSize = .init(width: 300, height: 300)) -> URL? {
        guard let image = snapshot(size) else { return nil }
        let tempDirectory = FileManager.default.temporaryDirectory
        let fileURL = tempDirectory.appendingPathComponent("shared-image.jpg")
        do {
            guard let data = image.jpegData(compressionQuality: 0.9) else { return nil }
            try data.write(to: fileURL)
            return fileURL
        } catch {
            return nil
        }
    }
    
}


public struct FlippedUpsideDown: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .rotationEffect(.radians(.pi))
            .scaleEffect(x: -1, y: 1, anchor: .center)
    }
}
