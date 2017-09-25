//
//  ImgCarouselCollectionCell.swift
//  ImgCarouselView
//
//  Created by msano on 2017/09/20.
//  Copyright © 2017年 msano. All rights reserved.
//

import UIKit
import Nuke

public enum ImageSource {
    case url(URL)
    case image(UIImage)
}

public final class ImgCarouselCollectionCell: UICollectionViewCell {
    // MARK: - View Elements
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Configuration
    func configure(with imageSource: ImageSource) {
        bind(imageSource)
    }
}

// MARK: - Private Methods
public extension ImgCarouselCollectionCell {
    func applyStyles(contentMode: UIViewContentMode) {
        imageView.contentMode = contentMode
        
    }
    
    fileprivate func bind(_ imageSource: ImageSource) {
        switch imageSource {
        case .image(let image):
            imageView.image = image
        case .url(let url):
            print(url.absoluteString)
            Nuke.loadImage(with: url, into: imageView)
        }
    }
}
