//
//  ViewController.swift
//  AutoLayoutButtonsInScrollView
//
//  Created by Kubilay Erdogan on 30/06/15.
//  Copyright (c) 2015 kublaios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView?
    @IBOutlet weak var contentVeiew: UIView?
    var data = [
        "Maecenas aliquam ligula convallis urna elementum suscipit.",
        "Praesent vulputate dui a dui aliquam consectetur. Vivamus ac nunc volutpat, aliquet ex non, tincidunt elit.",
        "Aenean mattis libero eu nunc luctus, a porta leo gravida.",
        "Nullam mollis tellus sit amet ullamcorper tincidunt.",
        "Phasellus ullamcorper lorem ultrices enim tincidunt tempor.",
        "Suspendisse vel urna viverra metus accumsan aliquet.",
        "In nec dolor ultrices, imperdiet nulla convallis, aliquam purus.",
        "Nunc convallis magna eget dolor commodo, et placerat nulla ornare. Aenean sed nisi vel erat consectetur volutpat.",
        "Nam at tortor et justo vulputate molestie non ac ligula.",
        "Etiam ut ex quis metus sollicitudin sollicitudin.",
        "Sed venenatis tellus tincidunt dapibus condimentum.",
        "Aenean tincidunt magna tempor est accumsan, et interdum nulla viverra.",
        "Donec posuere purus in interdum ornare.",
        "Ut tempor sem blandit, varius massa in, cursus erat.",
        "Phasellus congue risus eget lobortis convallis.",
        "Suspendisse nec orci ut est sollicitudin finibus ut ac leo. Sed a est quis risus egestas auctor id vel dolor.",
        "In eu augue nec nisi elementum gravida.",
        "Praesent vel eros sit amet lectus iaculis sagittis eget in ipsum.",
        "Mauris at lacus nec felis pulvinar lacinia.",
        "Ut sagittis dui eu tincidunt pharetra.",
        "Duis non turpis quis urna tincidunt pharetra et sed sapien.",
        "Phasellus posuere ex ut magna consequat, id congue augue volutpat. Mauris eu urna elementum, interdum purus sed, fringilla turpis.",
        "Vivamus quis massa sed odio vestibulum dictum sit amet vel arcu.",
        "Suspendisse volutpat tortor ac viverra interdum. Praesent rutrum metus id ex viverra, eu euismod elit aliquam.",
        "Duis tempor massa dapibus suscipit elementum.",
        "Mauris luctus enim ac arcu pellentesque pellentesque.",
        "Mauris eget nulla at ex ullamcorper elementum.",
        "Donec interdum ligula vitae dui maximus malesuada.",
        "Aliquam vel lacus vitae arcu laoreet elementum in et urna.",
        "Nullam in leo et neque condimentum sodales.",
        "Donec blandit lorem eu lacus facilisis dictum.",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vehicula ipsum ultrices, lacinia turpis et, mattis ante.",
        "Nunc sagittis augue a nulla malesuada, vel pretium ligula vehicula.",
        "Mauris vestibulum odio ac diam dapibus.",
        "Maecenas non sapien semper, luctus elit eget, bibendum pellentesque nisi.",
        "Donec at massa sed velit pretium.",
        "Nunc ut leo bibendum, sollicitudin justo nec, ornare nunc.",
        "Pellentesque tincidunt mi quis tellus feugiat sollicitudin."
    ]
    var lastButton: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.scrollView?.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.scrollView!.bounds))
        for title in self.data {
            var button = Button.newAutoLayoutView()
            self.contentVeiew?.addSubview(button)
            button.titleLabel?.numberOfLines = 0
            button.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
            button.titleLabel?.textAlignment = NSTextAlignment.Center
            button.setTitle(title, forState: UIControlState.Normal)
            button.backgroundColor = UIColor.redColor()
            button.autoPinEdgeToSuperviewEdge(ALEdge.Left, withInset: 20, relation: NSLayoutRelation.Equal)
            button.autoPinEdgeToSuperviewEdge(ALEdge.Right, withInset: 20, relation: NSLayoutRelation.Equal)
            if self.lastButton == nil {
                button.autoPinEdgeToSuperviewEdge(ALEdge.Top, withInset: 20, relation: NSLayoutRelation.Equal)
            } else {
                button.autoPinEdge(ALEdge.Top, toEdge: ALEdge.Bottom, ofView: lastButton, withOffset: 20, relation: NSLayoutRelation.Equal)
            }
            self.lastButton = button
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        var frame = self.contentVeiew!.frame
        frame.size.height = self.lastButton!.frame.origin.y + self.lastButton!.frame.size.height + 20.0
        self.contentVeiew?.frame = frame
        self.scrollView?.contentSize = self.contentVeiew!.frame.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

class Button: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.autoSetDimension(ALDimension.Height, toSize: self.titleLabel!.frame.size.height)
    }
    
}