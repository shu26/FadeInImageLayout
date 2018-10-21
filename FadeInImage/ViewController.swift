//
//  ViewController.swift
//  FadeInImage
//
//  Created by 海法修平 on 2018/10/20.
//  Copyright © 2018年 Swift-Beginners. All rights reserved.
//


// メモ
// UICollectionViewLayoutのサブクラスを定義してアニメーションを付与

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate {
    
    // MARK: Properties
    
    var collectionView: UICollectionView!
    let flowLayout = FadeInImageLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        self.view.backgroundColor = UIColor.black
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), collectionViewLayout: flowLayout)

        collectionView.backgroundColor = UIColor.gray
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        
        self.view.addSubview(collectionView)
        
        
    }


}

//cellに与える情報の設定
extension ViewController: UICollectionViewDataSource {
    //cellの個数設定
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // cellの取得
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        return cell
    }
}


extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        animateVisibleCells()
    }
    
    func animateVisibleCells() {
        
        collectionView
            .visibleCells
            .compactMap { $0 as? CollectionViewCell }
            .enumerated()
            .forEach { [self] offset, cell in
                self.animateCell(cell: cell, offset: offset)
        }
    }
    
    public func animateCell(cell: CollectionViewCell, offset: Int) {
        
        
        // スクロールの距離計算
        let visibleItems = collectionView.indexPathsForVisibleItems
        let index0 = visibleItems[0][1]
        let index1 = visibleItems[1][1]
        let index2 = visibleItems[2][1]
        let ratio0 = distanceRatio(withParent: collectionView, cell: cell, index: index0)
        let ratio1 = distanceRatio(withParent: collectionView, cell: cell, index: index1)
        let ratio2 = distanceRatio(withParent: collectionView, cell: cell, index: index2)
        
        switch offset {
        case 0:
            cell.transform = CGAffineTransform(translationX: ratio0, y: 0)
            print("あ")
        case 1:
            cell.transform = CGAffineTransform(translationX: ratio1, y: 0)
            print("い")
        case 2:
            cell.transform = CGAffineTransform(translationX: ratio2, y: 0)
            print("う")
        default:
            break
        }
        
        // アニメーション
        print("kkkkkk", collectionView.indexPathsForVisibleItems)
//        cell.transform = CGAffineTransform(translationX: ratio0, y: 0)
//        collectionView.indexPathsForVisibleItems[0][1].transform = CGAffineTransform(translationX: ratio0, y: 0)
    }
    
    func distanceRatio(withParent parent: UICollectionView, cell: CollectionViewCell, index: Int) -> CGFloat {
        // 縦にどれだけ動いたか計測
//        let distance = parent.contentOffset.y.truncatingRemainder(dividingBy: UIScreen.main.bounds.size.height)
        let distance = cell.frame.origin.y.truncatingRemainder(dividingBy: UIScreen.main.bounds.size.height)
        let ratio = distance / UIScreen.main.bounds.size.height
        var newX = ratio*collectionView.bounds.width
        if newX > collectionView.bounds.width/2 {
            newX = collectionView.bounds.width - newX
        }
        print("distance", parent.contentOffset.y, cell.frame.origin.y)
        return newX
    }
}

