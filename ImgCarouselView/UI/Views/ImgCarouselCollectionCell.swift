//
//  ImgCarouselCollectionCell.swift
//  EparkCure
//
//  Created by msano on 2017/07/19.
//  Copyright © 2017年 Ohako, Inc. All rights reserved.
//

import UIKit
import Nuke

enum ImageSource {
    case url(URL)
    case image(UIImage)
}

final class ImgCarouselCollectionCell: UICollectionViewCell {
    // MARK: - Properties

    // MARK: - View Elements
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Configuration
    func configure(with imageSource: ImageSource) {
        bind(imageSource)
        applyStyles()
    }
}

// MARK: - Private Methods
fileprivate extension ImgCarouselCollectionCell {
    func applyStyles() {
        imageView.contentMode = .scaleToFill
    }
    
    func bind(_ imageSource: ImageSource) {
        switch imageSource {
        case .image(let image):
            imageView.image = image
        case .url(let url):
            print(url.absoluteString)
            Nuke.loadImage(with: url, into: imageView)
        }
    }
}
