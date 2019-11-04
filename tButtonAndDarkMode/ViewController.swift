//
//  ViewController.swift
//  tButtonAndDarkMode
//
//  Created by tyobigoro_i on 2019/11/03.
//  Copyright © 2019 tyobigoro_i. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tBtn: SampltBtn!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnDidTap(_ sender: Any) {
        tBtn.isLongPressEnabled.toggle()
    }
    
}

@IBDesignable class SampltBtn: UIButton {
    
    var isLongPressEnabled: Bool = false {
        didSet {
            if oldValue != isLongPressEnabled {
                setColorOfMark()
    }}}
    
    var size: CGFloat = 6
    
    var color: CGColor = UIColor.lightGray.cgColor
    
    
    //override func draw(_ rect: CGRect) {
        //super.draw(rect)
        //drawDotMark()
    //}
    
    func drawDotMark() {
        
        let w: CGFloat = size
        let h: CGFloat = size
        
        let x: CGFloat = self.frame.width - w * 2.5
        let y: CGFloat = self.frame.height - h * 2.5
        
        let markLayer = CAShapeLayer.init()
        let markFrame = CGRect(x: x, y: y, width: w, height: h)
        markLayer.frame = markFrame
        
        markLayer.strokeColor = color
        markLayer.fillColor = color
        markLayer.lineWidth = 0.5
        
        markLayer.path = UIBezierPath.init(ovalIn: CGRect.init(x: 0,
                                                               y: 0,
                                                               width: markFrame.size.width,
                                                               height: markFrame.size.height)).cgPath
        
        self.layer.addSublayer(markLayer)
        
    }
    
    func setColorOfMark() {
        color = isLongPressEnabled ? UIColor.darkGray.cgColor : UIColor.lightGray.cgColor
        self.setNeedsDisplay()
    }
    
    
}

