//
//  ImgCarouselView.swift
//  ImgCarouselView
//
//  Created by msano on 2017/09/20.
//  Copyright © 2017年 msano. All rights reserved.
//

import UIKit
import Nuke

public final class ImgCarouselView: UIView, XibInstantiatable {
    // MARK: - Properties
    fileprivate var imageSources: [ImageSource] = []
    fileprivate var cellContentMode: UIViewContentMode = .scaleAspectFit
    
    // MARK: - View Elements
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // MARK: - for UICollectionViewDataSourcePrefetching
    fileprivate let preheater = Preheater(manager: Manager.shared)
    
    // MARK: - Lifecycle Methods
    public override init(frame: CGRect) {
        super.init(frame: frame)
        instantiate()
        configureCollectionView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        instantiate()
        configureCollectionView()
    }
    
    public convenience init() {
        self.init(frame: .zero)
    }
    
    public func configure(
        imageSources: [ImageSource],
        cellContentMode: UIViewContentMode = .scaleAspectFit
    ) {
        self.cellContentMode = cellContentMode
        self.imageSources = imageSources
        configureViewParts()
    }
    
    // MARK: - private funcs
    private func configureViewParts() {
        updatePageControl()
        applyStyles()
        collectionView.reloadData()
    }
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.prefetchDataSource = self
        collectionView.registerNibForCellWithType(ImgCarouselCollectionCell.self)
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    private func updatePageControl() {
        pageControl.isHidden = imageSources.isEmpty || (imageSources.count == 1)
        pageControl.numberOfPages = imageSources.count
    }
    
    private func applyStyles() {
        // stub
    }
}


extension ImgCarouselView: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageSources.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
        -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCellWithType(ImgCarouselCollectionCell.self, forIndexPath: indexPath)
            if indexPath.row < imageSources.count {
                cell.applyStyles(contentMode: cellContentMode)
                cell.configure(with: imageSources[indexPath.row])
            }
            return cell
    }
}

extension ImgCarouselView: UICollectionViewDataSourcePrefetching {
    
    public func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        preheater.startPreheating(
            with: makeCacheRequests(indexPaths: indexPaths)
        )
    }
    
    public func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath]) {
        preheater.stopPreheating(
            with: makeCacheRequests(indexPaths: indexPaths)
        )
    }
    
    // MARK: - private funcs
    private func makeCacheRequests(indexPaths: [IndexPath]) -> [Request] {
        return imageSources
            .enumerated()
            .filter { index, _ -> Bool in
                return indexPaths
                    .map { $0.row }
                    .contains(index)
            }
            .flatMap { _, imageSource -> Request? in
                switch imageSource {
                case .url(let url):
                    return Request(url: url)
                case .image:
                    return nil
                }
        }
    }
}

extension ImgCarouselView: UICollectionViewDelegate {
    // stub
}
extension ImgCarouselView: UICollectionViewDelegateFlowLayout {
    public func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
        ) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
}

extension ImgCarouselView: UIScrollViewDelegate {
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(collectionView.contentOffset.x / collectionView.frame.size.width)
    }
}
