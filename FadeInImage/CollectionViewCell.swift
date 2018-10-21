//
//  CollectionViewCell.swift
//  FadeInImage
//
//  Created by 海法修平 on 2018/10/20.
//  Copyright © 2018年 Swift-Beginners. All rights reserved.
//

import UIKit


final class CollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = .yellow
//        adjustAnchorPoint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
