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
        var imgCarouselView: ImgCarouselView!
        
        beforeEach {
            imgCarouselView = ImgCarouselView()
        }

        describe("view setting") {
            it ("initialize required view parts") {
                // arrange
//                imgCarouselView.configure(imageSources: [])
                
                //act
//                expect(imgCarouselView.collectionView) != nil
//                expect(imgCarouselView.pageControl) != nil

//                expect(imgCarouselView.pageControl)
            }
        }
        
        describe("cells state") {
            context("configure with some imageSources") {
                it("succeeds to generate cells and display page control") {
                    // arrange
                    let imageSources: [ImageSource] = [
                        .url(URL(string: "https://www.pakutaso.com/shared/img/thumb/NEKONEKOIMG_7878_TP_V.jpg")!),
                        .url(URL(string: "https://www.pakutaso.com/shared/img/thumb/NEKONEKOIMG_7878_TP_V.jpg")!),
                        .image(
                            UIImage(
                                named: "sample",
                                in: Bundle(for: type(of: self)),
                                compatibleWith: nil
                            )!
                        )
                    ]
                    
                    //act
                    imgCarouselView.configure(imageSources: imageSources)
                    
                    //assert
                    expect(imgCarouselView.pageControl.isHidden) == false
                    expect(imgCarouselView.collectionView.numberOfItems(inSection: 0)) == imageSources.count
                    expect(imgCarouselView.pageControl.numberOfPages) == imageSources.count
                }
            }
            context("configure with one imageSource") {
                it("succeeds to generate cells and hide page control") {
                    // arrange
                    let oneImageSource: [ImageSource] = [
                        .url(URL(string: "https://www.pakutaso.com/shared/img/thumb/NEKONEKOIMG_7878_TP_V.jpg")!)
                    ]
                    //act
                    imgCarouselView.configure(imageSources: oneImageSource)
                    
                    //assert
                    expect(imgCarouselView.pageControl.isHidden) == true
                    expect(imgCarouselView.collectionView.numberOfItems(inSection: 0)) == oneImageSource.count
                    expect(imgCarouselView.pageControl.numberOfPages) == oneImageSource.count
                }
            }
            context("configure with no object") {
                it("fails to generate cells and hide page control") {
                    //act
                    imgCarouselView.configure(imageSources: [])

                    //assert
                    expect(imgCarouselView.pageControl.isHidden) == true
                    expect(imgCarouselView.collectionView.numberOfItems(inSection: 0)) == 0
                    expect(imgCarouselView.pageControl.numberOfPages) == 0
                }
            }
        }
    }
}

