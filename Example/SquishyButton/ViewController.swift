//
//  ViewController.swift
//  SquishyButton
//
//  Created by Koji Murata on 06/23/2016.
//  Copyright (c) 2016 Koji Murata. All rights reserved.
//

import UIKit
import SquishyButton
import BugImageCreator

class ViewController: UIViewController {

  @IBOutlet weak var button: SquishyButton! {
    didSet {
      button.setImage(BugImageCreator.create(size: 30, lineWidth: 1, color: .whiteColor()), forState: .Normal)
    }
  }
}
