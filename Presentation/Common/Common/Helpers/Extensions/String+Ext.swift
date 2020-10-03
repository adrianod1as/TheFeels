//
//  String+Ext.swift
//  Common
//
//  Created by Adriano Dias on 24/09/20.
//  Copyright © 2020 dias. All rights reserved.
//

import Swinject
import Domain

public extension String {

    var isBackSpace: Bool {
        return strcmp(self.cString(using: String.Encoding.utf8)!, L10n.Symbol.backspace) == -92
    }

    var chars: [String] {
        return self.map { String($0) }
    }

    func heightForLabel(withConstrainedWidth width: CGFloat,
                        inMaximumHeight height: CGFloat = .greatestFiniteMagnitude,
                        font: UIFont) -> CGFloat {
        let label =  UILabel(frame: CGRect(x: 0, y: 0, width: width, height: height))
        label.numberOfLines = 0
        label.text = self
        label.font = font
        label.sizeToFit()

        return label.frame.height
    }

    func widthForLabel(withConstrainedHeight height: CGFloat,
                       inMaximumWidth width: CGFloat = .greatestFiniteMagnitude,
                       font: UIFont) -> CGFloat {
        let label =  UILabel(frame: CGRect(x: 0, y: 0, width: width, height: height))
        label.numberOfLines = 0
        label.text = self
        label.font = font
        label.sizeToFit()

        return label.frame.height
    }

    func height(withConstrainedWidth width: CGFloat,
                inMaximumHeight height: CGFloat = .greatestFiniteMagnitude,
                font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin,
                                            attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.height)
    }

    func width(withConstrainedHeight height: CGFloat,
               inMaximumWidth width: CGFloat = .greatestFiniteMagnitude,
               font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin,
                                            attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.width)
    }

    var withoutSpecialCharacters: String {
        return self.components(separatedBy: CharacterSet.alphanumerics.inverted).joined()
    }

    var diacriticInsensitive: String {
        return folding(options: .diacriticInsensitive, locale: .current)
    }
}

public extension Collection {

    var pairs: [SubSequence] {
        var startIndex = self.startIndex
        let count = self.count
        let n = count/2 + count % 2
        return (0..<n).map { _ in
            let endIndex = index(startIndex, offsetBy: 2, limitedBy: self.endIndex) ?? self.endIndex
            defer { startIndex = endIndex }
            return self[startIndex..<endIndex]
        }
    }
}

public extension StringProtocol where Self: RangeReplaceableCollection {

    mutating func insert(separator: Self, every n: Int) {
        for index in indices.reversed() where index != startIndex &&
            distance(from: startIndex, to: index) % n == 0 {
            insert(contentsOf: separator, at: index)
        }
    }

    func inserting(separator: Self, every n: Int) -> Self {
        var string = self
        string.insert(separator: separator, every: n)
        return string
    }

    func nsRange(from range: Range<Index>) -> NSRange {
        return .init(range, in: self)
    }

    mutating func insert(separator: Self, at n: Int) {
        insert(contentsOf: separator, at: index(startIndex, offsetBy: n))
    }

    func inserting(separator: Self, at n: Int) -> Self {
        var string = self
        string.insert(separator: separator, at: n)
        return string
    }
}

public extension StringProtocol where Index == String.Index {

    func index<T: StringProtocol>(of string: T, options: String.CompareOptions = []) -> Index? {
        return range(of: string, options: options)?.lowerBound
    }
    func endIndex<T: StringProtocol>(of string: T, options: String.CompareOptions = []) -> Index? {
        return range(of: string, options: options)?.upperBound
    }
    func indexes<T: StringProtocol>(of string: T, options: String.CompareOptions = []) -> [Index] {
        var result: [Index] = []
        var start = startIndex
        while start < endIndex, let range = range(of: string, options: options, range: start..<endIndex) {
            result.append(range.lowerBound)
            start = range.lowerBound < range.upperBound ? range.upperBound : index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return result
    }
    func ranges<T: StringProtocol>(of string: T, options: String.CompareOptions = []) -> [Range<Index>] {
        var result: [Range<Index>] = []
        var start = startIndex
        while start < endIndex, let range = range(of: string, options: options, range: start..<endIndex) {
            result.append(range)
            start = range.lowerBound < range.upperBound  ? range.upperBound : index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return result
    }

    func endIndex(offsetBy offset: Int) -> String.Index {
        return self.index(self.endIndex, offsetBy: offset)
    }
}

public extension NSAttributedString {

    func height(withConstrainedWidth width: CGFloat,
                inMaximumHeight height: CGFloat = .greatestFiniteMagnitude) -> CGFloat {
        let constraintRect = CGSize(width: width, height: height)
        let boundingBox = boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)

        return ceil(boundingBox.height)
    }

    func width(withConstrainedHeight height: CGFloat,
               inMaximumWidth width: CGFloat = .greatestFiniteMagnitude) -> CGFloat {
        let constraintRect = CGSize(width: width, height: height)
        let boundingBox = boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)

        return ceil(boundingBox.width)
    }

}
