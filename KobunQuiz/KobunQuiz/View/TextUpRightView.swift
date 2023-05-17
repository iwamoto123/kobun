//
//  TextUpRightView.swift
//  KobunQuiz
//
//  Created by 岩本武士 on 2023/04/05.
//

import SwiftUI
import UIKit
import CoreText

struct UprightText_Previews: PreviewProvider {
    static var previews: some View {
        UprightText(text: """
こんにちは、
わたしの名前は吉田です。
これはswiftuiで実装されています。
国語のアプリを作成中です。
""").padding(40)
    }
}

public struct UprightText: UIViewRepresentable {
    public let text: String?
    
    init(text: String?) {
        self.text = text
    }

    public func makeUIView(context: Context) -> UprightTextView {
        let uiView = UprightTextView()
        uiView.isOpaque = false
        uiView.text = text
        return uiView
    }

    public func updateUIView(_ uiView: UprightTextView, context: Context) {
        uiView.text = text
    }
}


public class UprightTextView: UIView {
    public var text: String? = nil {
        didSet {
            ctFrame = nil
        }
    }
    private var ctFrame: CTFrame? = nil

    override public func draw(_ rect: CGRect) {
        guard let context:CGContext = UIGraphicsGetCurrentContext() else {
            return
        }
        context.scaleBy(x: 1, y: -1)
        context.translateBy(x: 0, y: -rect.height)

        let baseAttributes: [NSAttributedString.Key : Any] = [
            .verticalGlyphForm: true,
            NSAttributedString.Key.font: UIFont(name: "HiraMinProN-W3", size:25)
        ]
        let attributedText = NSMutableAttributedString(string: text ?? "", attributes: baseAttributes)
        let setter = CTFramesetterCreateWithAttributedString(attributedText)
        let path = CGPath(rect: rect, transform: nil)
        let frameAttrs = [
            kCTFrameProgressionAttributeName: CTFrameProgression.rightToLeft.rawValue,
        ]
        let ct = CTFramesetterCreateFrame(setter, CFRangeMake(0, 0), path, frameAttrs as CFDictionary)
        ctFrame = ct

        CTFrameDraw(ct, context)
    }
}




