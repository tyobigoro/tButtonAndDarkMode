//
//  ViewController.swift
//  tButtonAndDarkMode
//
//  Created by tyobigoro_i on 2019/11/03.
//  Copyright © 2019 tyobigoro_i. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tBtn: ButtonWithDotmark!
    
    @IBOutlet weak var basicBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func isEnabledBtnDidTap(_ sender: Any) {
        tBtn.isEnabled.toggle()
    }
    
    
    @IBAction func isLPEnabledBtnDidTap(_ sender: Any) {
        tBtn.isLongPressEnabled.toggle()
    }
    
    @IBAction func isEnabledBtn_sample(_ sender: Any) {
        basicBtn.isEnabled.toggle()
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

@IBDesignable
class ButtonWithDotmark: UIButton {
  
    override var isEnabled: Bool {
        didSet {
            super.isEnabled = isEnabled
            if oldValue != isEnabled {
                setColorOfMark()
            }
        }
    }
    
    
    var isLongPressEnabled: Bool = false {
        didSet {
            if oldValue != isLongPressEnabled {
                setColorOfMark()
    }}}

    private var customBackgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
    override var backgroundColor: UIColor? {
        didSet {
            customBackgroundColor = backgroundColor!
            super.backgroundColor = UIColor.clear
    }}
    
    
    var size: CGFloat = 6
    
    var color: CGColor = UIColor.lightGray.cgColor
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    
    
    func setup() {
        layer.shadowColor = self.layer.shadowColor
        layer.shadowOffset.width = self.layer.shadowOffset.width
        layer.shadowOffset.height = self.layer.shadowOffset.height
        layer.shadowRadius = self.layer.shadowRadius
        layer.shadowOpacity = self.layer.shadowOpacity
        super.backgroundColor = UIColor.clear
    }
    
    override func draw(_ rect: CGRect) {
        customBackgroundColor.setFill()
        UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius ).fill()
        let borderRect = bounds.insetBy(dx: borderWidth/2, dy: borderWidth/2)
        let borderPath
            = UIBezierPath(
                roundedRect: borderRect, cornerRadius: cornerRadius - borderWidth/2)
        borderColor?.setStroke()
        borderPath.lineWidth = borderWidth
        borderPath.stroke()
        
        drawDotMark()
    }
    
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
        if isEnabled {
            color = isLongPressEnabled ? UIColor.darkGray.cgColor : UIColor.lightGray.cgColor
        } else {
            color = UIColor.lightGray.cgColor
        }
        self.setNeedsDisplay()
    }
    
 
    
}
