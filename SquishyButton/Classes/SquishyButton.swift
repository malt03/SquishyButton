//
//  SquishyButton.swift
//  Pods
//
//  Created by Koji Murata on 2016/06/23.
//
//

import UIKit

public class SquishyButton: UIButton {
  @IBInspectable var animationEnabled: Bool = true
  @IBInspectable var subImageName: String = "" {
    didSet {
      if let i = UIImage(named: subImageName) {
        let iv = UIImageView(image: i)
        addSubview(iv)
        iv.contentMode = .Center
        subImageView = iv
      }
    }
  }
  @IBInspectable var scaleRate: CGFloat = 1.4
  @IBInspectable var animationDuration: Double = 0.3
  @IBInspectable var expansionFunctionRate: Float = 2.5
  
  private var subImageView: UIImageView?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    initialize()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    initialize()
  }
  
  override public func drawRect(rect: CGRect) {
    super.drawRect(rect)
    if let iv = subImageView {
      iv.frame = CGRect(origin: .zero, size: rect.size)
    }
  }
  
  private func initialize() {
    addTarget(self, action: #selector(didBeginTouch), forControlEvents: .TouchDown)
    addTarget(self, action: #selector(didFinishTouch), forControlEvents: .TouchUpInside)
    addTarget(self, action: #selector(didFinishTouch), forControlEvents: .TouchDragOutside)
    addTarget(self, action: #selector(didFinishTouch), forControlEvents: .TouchCancel)
  }
  
  @objc private func didBeginTouch() {
    if !animationEnabled { return }
    
    let animation = CABasicAnimation(keyPath: "transform")
    animation.duration = animationDuration
    animation.toValue = NSValue(CATransform3D: CATransform3DMakeScale(scaleRate, scaleRate, 1))
    animation.timingFunction = CAMediaTimingFunction(controlPoints: 0.5, expansionFunctionRate, 0.5, 1)
    animation.removedOnCompletion = false
    animation.fillMode = kCAFillModeForwards
    layer.addAnimation(animation, forKey: "touch")
  }
  
  @objc private func didFinishTouch() {
    if !animationEnabled { return }
    
    let animation = CABasicAnimation(keyPath: "transform")
    animation.duration = animationDuration
    animation.toValue = NSValue(CATransform3D: CATransform3DIdentity)
    animation.timingFunction = CAMediaTimingFunction(controlPoints: 0.5, 1.5, 0.5, 1)
    animation.removedOnCompletion = false
    animation.fillMode = kCAFillModeForwards
    layer.addAnimation(animation, forKey: nil)
  }
}
