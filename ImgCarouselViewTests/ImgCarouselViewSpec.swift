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
        
        //            - viewにURLを配列で渡したときに、cellが生成される
        //            - viewにUIImageを配列で渡したときに、cellが生成される
        //            - viewに空配列を渡した場合、cellが生成されない
        //
        //        いずれもcollectionViewのカウントを見て判別できればいいなと思っています
        //        できれば画像のセットも確認する

        var imgCarouselViewMock: ImgCarouselView!
        
        beforeEach {
            imgCarouselViewMock = ImgCarouselView()
        }
        
        describe("cells state") {
            context("configure with some image urls array") {
                it("succeeds to generate cells") {
                    // TODO:
                }
            }
            context("configure with some images array") {
                it("succeeds to generate cells") {
                    // TODO:
                }
            }
            context("configure with some images array") {
                it("fails to generate cells") {
                    // TODO:
                }
            }
        }
    }
}

