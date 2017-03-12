//
//  PostCardCell.swift
//  Graygram-clone-iOS
//
//  Created by aney on 2017. 3. 12..
//  Copyright © 2017년 Taedong Kim. All rights reserved.
//

import UIKit
import CGFloatLiteral
import Kingfisher
import ManualLayout

class PostCardCell: UICollectionViewCell {

  fileprivate struct Constant {
    static let messageLabelNumberOfLines = 3
  }
  
  fileprivate struct Metric {
    static let messageLabelTop = 10.f
    static let messageLabelLeft = 10.f
    static let messageLabelRight = 10.f
    static let messageLabelBottom = 10.f
  }
  
  fileprivate let photoView = UIImageView()
  fileprivate let messageLabel = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.photoView.backgroundColor = .gray
    self.messageLabel.numberOfLines = Constant.messageLabelNumberOfLines
    self.messageLabel.font = UIFont.systemFont(ofSize: 14)
    
    self.contentView.addSubview(self.photoView)
    self.contentView.addSubview(self.messageLabel)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(post: Post) {
    self.backgroundColor = .lightGray
    
    if let id = post.photoID,
      let url = URL(string:  "https://graygram.com/photos/\(id)/640x640") {
      self.photoView.kf.setImage(with: url)
    }
    
    self.messageLabel.text = post.message
    self.setNeedsLayout()
  }
  
  class func size(width: CGFloat, post: Post) -> CGSize {
    var height: CGFloat = 0
    height += width // photoView height
    
    if let message = post.message, !message.isEmpty {
      let font = UIFont.systemFont(ofSize: 14)
      let messageLabelSize = message.size(
        width: width - Metric.messageLabelLeft - Metric.messageLabelRight,
        font: font,
        numberOfLines: Constant.messageLabelNumberOfLines
      )
      height += Metric.messageLabelTop
      height += messageLabelSize.height // messageLabel height
      height += Metric.messageLabelBottom
    }
    
    return CGSize(width: width, height: height)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    self.photoView.width = self.contentView.width
    self.photoView.height = self.photoView.width
    
    self.messageLabel.top = self.photoView.bottom + Metric.messageLabelTop
    self.messageLabel.left = Metric.messageLabelLeft
    self.messageLabel.width = self.contentView.width - Metric.messageLabelLeft - Metric.messageLabelRight
    self.messageLabel.sizeToFit()
  }
  
}
