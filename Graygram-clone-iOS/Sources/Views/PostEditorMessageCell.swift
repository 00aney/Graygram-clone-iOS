//
//  PostEditorMessageCell.swift
//  Graygram-clone-iOS
//
//  Created by aney on 2017. 3. 14..
//  Copyright © 2017년 Taedong Kim. All rights reserved.
//

import UIKit

final class PostEditorMessageCell: UITableViewCell {
  
  // MARK: Constants
  
  struct Font {
    static let textView = UIFont.systemFont(ofSize: 14)
  }
  
  
  // MARK: Properties
  
  var textDidChange: ((String?) -> Void)?

  // MARK: UI
  
  fileprivate let textView = UITextView()
  
  // MARK: Initializing
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.selectionStyle = .none
    self.textView.font = Font.textView
    self.textView.delegate = self
    self.contentView.addSubview(self.textView)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  // MARK: Configuring
  
  func configure(message: String?) {
    self.textView.text = message
    self.setNeedsLayout()
  }
  
  
  // MARK: Size
  
  class func height(width: CGFloat, message: String?) -> CGFloat {
    let messageHeight = message?.size(width: width, font: Font.textView).height ?? 0
    let minimumHeight = ceil(Font.textView.lineHeight * 3) + 10 + 10 // UITextView의 기본 inset
    return max(messageHeight, minimumHeight)
  }
  
  
  // MARK: Layout
  
  override func layoutSubviews() {
    super.layoutSubviews()
    self.textView.frame = self.contentView.bounds
  }
  
}


// MARK: - UITextViewDelegate

extension PostEditorMessageCell: UITextViewDelegate {
  
  func textViewDidChange(_ textView: UITextView) {
    self.textDidChange?(textView.text)
  }
  
}
