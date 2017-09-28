//
//  UICollectionView+Type.swift
//  ImgCarouselView
//
//  Created by msano on 2017/09/20.
//  Copyright © 2017年 msano. All rights reserved.
//

import UIKit

public extension UICollectionView {
    public func registerNibForCellWithType<T: UICollectionViewCell>(_ type: T.Type) {
        let className = String(describing: T.self)
        let nib = UINib(nibName: className, bundle: Bundle(for: type))
        register(nib, forCellWithReuseIdentifier: className)
    }
    
    public func registerClassForCellWithType<T: UICollectionViewCell>(_ type: T.Type) {
        let className = String(describing: T.self)
        register(T.self, forCellWithReuseIdentifier: className)
    }
    
    public func dequeueReusableCellWithType<T: UICollectionViewCell>(
        _ type: T.Type,
        forIndexPath indexPath: IndexPath) -> T {
        return dequeueReusableCell(
            withReuseIdentifier: String(describing: T.self),
            for: indexPath) as! T // swiftlint:disable:this force_cast
    }
}
