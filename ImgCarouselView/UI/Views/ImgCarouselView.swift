//
//  ImgCarouselView.swift
//  EparkCure
//
//  Created by msano on 2017/07/19.
//  Copyright © 2017年 Ohako, Inc. All rights reserved.
//

import UIKit
import Nuke

final class ImgCarouselView: UIView, XibInstantiatable {

    // MARK: - Properties
    fileprivate var imageSources: [ImageSource] = []
    
//    // MARK: - View Elements
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // MARK: - for UICollectionViewDataSourcePrefetching
    fileprivate let preheater = Preheater(manager: Manager.shared)

    // MARK: - Lifecycle Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        instantiate()
        configureCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        instantiate()
        configureCollectionView()
    }
    
    func configure(urls: [URL]) {
        imageSources = urls.map { .url($0) }
        configureViewParts()
    }
    
    func configure(images: [UIImage]) {
        imageSources = images.map { .image($0) }
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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageSources.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
        -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithType(ImgCarouselCollectionCell.self, forIndexPath: indexPath)
        if indexPath.row < imageSources.count {
            cell.configure(with: imageSources[indexPath.row])
        }
        return cell
    }
}

extension ImgCarouselView: UICollectionViewDataSourcePrefetching {

    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        preheater.startPreheating(
            with: makeCacheRequests(indexPaths: indexPaths)
        )
    }

    func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath]) {
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
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
        ) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
}

extension ImgCarouselView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(collectionView.contentOffset.x / collectionView.frame.size.width)
    }
}
