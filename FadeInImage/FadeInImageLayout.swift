//
//   FadeInImageLayout.swift
//  FadeInImage
//
//  Created by 海法修平 on 2018/10/20.
//  Copyright © 2018年 Swift-Beginners. All rights reserved.
//

import UIKit

class FadeInImageLayout: UICollectionViewLayout {
    
    let numberColumns = 2 //列数
    let height:CGFloat = 200 //セルの高さ
    let margin:CGFloat = 50 // 空白
    
    //レイアウト配列
    var layoutData = [UICollectionViewLayoutAttributes]()
    
    //レイアウトを準備するメソッド
    override func prepare() {
        //全体の幅
        let allWidth = collectionView!.bounds.width - collectionView!.contentInset.left - collectionView!.contentInset.right
        
        //列の幅
        let columnWidth = allWidth / CGFloat(numberColumns)
        let testWidth = collectionView!.bounds.width / 2
        
        //座標
        var y:CGFloat = 0
        var x:CGFloat = 0
        
        //要素数ぶんループ
        for count in 0 ..< collectionView!.numberOfItems(inSection: 0) {
            
            let indexPath = IndexPath(item:count, section:0)
            
            //レイアウトの配列に位置とサイズを登録する。
            let frame = CGRect(x:x, y:y, width:testWidth, height: height)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath as IndexPath)
            attributes.frame = frame
            layoutData.append(attributes)
            
            //X座標を更新
            if(count % 2 == 0) {
                //FIXME: 一時的に全て左に配置
//                x = testWidth
                x = 0
            } else {
                x = 0
            }
            
            //Y座標を更新
            y = y + height + margin
        }
        
//        if y == collectionView!.bounds.size.height / 2 {
//            x = collectionView!.bounds.size.width / 2
//        }
    }
    
    
    
    //レイアウトを返すメソッド
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {

        return layoutData
    }
    
    
    
    //全体サイズを返すメソッド
    override public var collectionViewContentSize: CGSize {
        //全体の幅
        let allWidth = collectionView!.bounds.width - collectionView!.contentInset.left - collectionView!.contentInset.right
        let testWidth = collectionView!.bounds.width
        
        //全体の高さ
        let allHeight = CGFloat(collectionView!.numberOfItems(inSection: 0)) * height
        
        return CGSize(width:testWidth, height:allHeight)
    }
    
    
    
//    // MARK: Properties
//
//    var contentSize: CGSize = CGSize(width: 0, height: 0)
//
//
//    // MARK: Function
//
//    override public init() {
//        super.init()
//    }
//
//    required public init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override public func prepare() {
//        super.prepare()
//
//        if collectionView?.numberOfSections != 1 {
//            return
//        }
//
//        var top = CGFloat(0.0)
//        let left = CGFloat(0.0)
//        let height = collectionView?.frame.size.height
//        self.contentSize = CGSize(width: UIScreen.main.bounds.size.width, height: height!)
//        guard let limit = collectionView?.numberOfItems(inSection: 0) else {
//            return
//        }
//
//    }
//
//    // collectionViewがスクロールできるさ範囲のサイズ
//    override public var collectionViewContentSize: CGSize {
//        var count = self.collectionView!.numberOfItems(inSection: 0)
//        var size = self.collectionView!.bounds.size
////        size.height = count * cellInterval
//        return size
//    }
//
//    // 範囲内の要素に対しての処理
//    override public func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
//
//        var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
//
//        for attributes in layoutData {
//            if attributes.frame.intersects(rect) {
//                UIView.animate(withDuration: 1.0, delay: 0.2, options: nil, animations: {
//                    attributes.frame.origin.x = 200 / 2
//                }, completion: nil)
//                visibleLayoutAttributes.append(attributes)
//            }
//        }
//        return visibleLayoutAttributes
//    }

//    // IndexPathで指定された要素に対する処理
//    override public func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
//
//        let rect = CGRect(x: 800, y: 200 / 2, width: 200, height: 200)
//
//
//        if rect.intersects(layoutData[indexPath.item].frame) {
//            UIView.animate(withDuration: 1.0, delay: 0.2, options: .curveEaseIn, animations: {
//                self.layoutData[indexPath.item].frame.origin.x = 200 / 2
//            }, completion: nil)
//        }
//
////        return visibleLayoutAttributes
//
//        return layoutData[indexPath.item]
//    }

    // boundsによってレイアウトが変わる場合はTrue
    override public func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
//
//    // セル生成時のアニメーションなどの初期位置
//    override public func initialLayoutAttributesForAppearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
//        return self.attributes[itemIndexPath.item]
//    }
    
}
