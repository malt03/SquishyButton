//
//  SquishyButton.swift
//  Pods
//
//  Created by Koji Murata on 2016/06/23.
//
//

import UIKit

open class SquishyButton: UIButton {
  @IBInspectable var animationEnabled: Bool = true
  @IBInspectable var subImageName: String = "" {
    didSet {
      if let i = UIImage(named: subImageName) {
        let iv = UIImageView(image: i)
        addSubview(iv)
        iv.contentMode = .center
        subImageView = iv
      }
    }
  }
  @IBInspectable var scaleRate: CGFloat = 1.4
  @IBInspectable var animationDuration: Double = 0.3
  @IBInspectable var expansionFunctionRate: Float = 2.5
  
  fileprivate var subImageView: UIImageView?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    initialize()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    initialize()
  }
  
  override open func draw(_ rect: CGRect) {
    super.draw(rect)
    if let iv = subImageView {
      iv.frame = CGRect(origin: .zero, size: rect.size)
    }
  }
  
  fileprivate func initialize() {
    addTarget(self, action: #selector(didBeginTouch), for: .touchDown)
    addTarget(self, action: #selector(didFinishTouch), for: .touchUpInside)
    addTarget(self, action: #selector(didFinishTouch), for: .touchDragOutside)
    addTarget(self, action: #selector(didFinishTouch), for: .touchCancel)
  }
  
  @objc fileprivate func didBeginTouch() {
    if !animationEnabled { return }
    
    let animation = CABasicAnimation(keyPath: "transform")
    animation.duration = animationDuration
    animation.toValue = NSValue(caTransform3D: CATransform3DMakeScale(scaleRate, scaleRate, 1))
    animation.timingFunction = CAMediaTimingFunction(controlPoints: 0.5, expansionFunctionRate, 0.5, 1)
    animation.isRemovedOnCompletion = false
    animation.fillMode = kCAFillModeForwards
    layer.add(animation, forKey: "touch")
  }
  
  @objc fileprivate func didFinishTouch() {
    if !animationEnabled { return }
    
    let animation = CABasicAnimation(keyPath: "transform")
    animation.duration = animationDuration
    animation.toValue = NSValue(caTransform3D: CATransform3DIdentity)
    animation.timingFunction = CAMediaTimingFunction(controlPoints: 0.5, 1.5, 0.5, 1)
    animation.isRemovedOnCompletion = false
    animation.fillMode = kCAFillModeForwards
    layer.add(animation, forKey: nil)
  }
}
