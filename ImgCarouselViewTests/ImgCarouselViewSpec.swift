//
//  ImgCarouselViewSpec.swift
//  ImgCarouselView
//
//  Created by msano on 2017/09/20.
//  Copyright © 2017年 msano. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import ImgCarouselView

class ImgCarouselViewSpec: QuickSpec {
    override func spec() {
        var imgCarouselViewMock: ImgCarouselView!
        
        beforeEach {
            imgCarouselViewMock = ImgCarouselView()
        }
        
        describe("cells state") {
            context("configure with some image urls") {
                it("succeeds to generate cells and display page control") {
                    // arrange
                    let urls = [
                        URL(string: "https://www.pakutaso.com/shared/img/thumb/NEKONEKOIMG_7878_TP_V.jpg")!,
                        URL(string: "https://www.pakutaso.com/shared/img/thumb/NEKONEKOIMG_7878_TP_V.jpg")!,
                        URL(string: "https://www.pakutaso.com/shared/img/thumb/NEKONEKOIMG_7878_TP_V.jpg")!
                    ]
                    
                    //act
                    imgCarouselViewMock.configure(urls: urls)
                    
                    //assert
                    expect(imgCarouselViewMock.collectionView) != nil
                    expect(imgCarouselViewMock.pageControl) != nil
                    expect(imgCarouselViewMock.pageControl.isHidden) == false
                    expect(imgCarouselViewMock.collectionView.numberOfItems(inSection: 0)) == urls.count
                    expect(imgCarouselViewMock.pageControl.numberOfPages) == urls.count
                    // let cell = imgCarouselViewMock.collectionView.cellForItem(at: IndexPath(row: 0, section: 0)) as? ImgCarouselCollectionCell
                    // expect(cell?.imageView) != nil
                }
            }
            context("configure with some images") {
                it("succeeds to generate cells and display page control") {
                    // arrange
                    let image = UIImage(
                        named: "sample",
                        in: Bundle(for: type(of: self)),
                        compatibleWith: nil
                    )
                    let images = [
                        image!,
                        image!
                    ]

                    //act
                    imgCarouselViewMock.configure(images: images)
                    
                    //assert
                    expect(imgCarouselViewMock.collectionView) != nil
                    expect(imgCarouselViewMock.pageControl) != nil
                    expect(imgCarouselViewMock.pageControl.isHidden) == false
                    expect(imgCarouselViewMock.collectionView.numberOfItems(inSection: 0)) == images.count
                    expect(imgCarouselViewMock.pageControl.numberOfPages) == images.count
                }
            }
            context("configure with one image url") {
                it("succeeds to generate cells and hide page control") {
                    // arrange
                    let oneUrl = [URL(string: "https://www.pakutaso.com/shared/img/thumb/NEKONEKOIMG_7878_TP_V.jpg")!]
                    //act
                    imgCarouselViewMock.configure(urls: oneUrl)
                    
                    //assert
                    expect(imgCarouselViewMock.collectionView) != nil
                    expect(imgCarouselViewMock.pageControl) != nil
                    expect(imgCarouselViewMock.pageControl.isHidden) == true
                    expect(imgCarouselViewMock.collectionView.numberOfItems(inSection: 0)) == oneUrl.count
                    expect(imgCarouselViewMock.pageControl.numberOfPages) == oneUrl.count
                }
            }
            context("configure with no object") {
                it("fails to generate cells and hide page control") {
                    //act
                    imgCarouselViewMock.configure(urls: [])

                    //assert
                    expect(imgCarouselViewMock.collectionView) != nil
                    expect(imgCarouselViewMock.pageControl) != nil
                    expect(imgCarouselViewMock.pageControl.isHidden) == true
                    expect(imgCarouselViewMock.collectionView.numberOfItems(inSection: 0)) == 0
                    expect(imgCarouselViewMock.pageControl.numberOfPages) == 0
                }
            }
        }
    }
}

