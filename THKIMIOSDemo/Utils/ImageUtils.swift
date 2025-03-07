//
//  ImageUtils.swift
//  sirius-ios
//
//  Created by macmini on 2025/1/14.
//

import Foundation
import Photos
import THKIMSDK

class ImageUtils {

    static func drawImage(
        with colors: [UIColor], size: CGSize, cornerRadius: CGFloat, locations: [NSNumber]? = nil,
        orientation: Int = 1
    ) -> UIImage? {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(origin: .zero, size: size)
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.locations = locations

        if orientation == 1 {
            // 设置渐变方向（这里是水平方向）
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        } else {
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        }

        // 开始图像上下文
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }

        // 创建圆角路径
        let rectPath = UIBezierPath(
            roundedRect: CGRect(origin: .zero, size: size), cornerRadius: cornerRadius)
        context.addPath(rectPath.cgPath)
        context.clip()  // 裁剪上下文

        // 在当前裁剪上下文中绘制渐变
        gradientLayer.render(in: context)

        // 从上下文中获取图片
        let image = UIGraphicsGetImageFromCurrentImageContext()

        // 结束图像上下文
        UIGraphicsEndImageContext()
        return image?.resizableImage(
            withCapInsets: UIEdgeInsets(
                top: cornerRadius, left: cornerRadius, bottom: cornerRadius, right: cornerRadius),
            resizingMode: .stretch)

    }
    static func drawNoLeftBottomCornerImage(
        with colors: [UIColor], size: CGSize, cornerRadius: CGFloat,
        locations: [NSNumber]? = nil
    ) -> UIImage? {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(origin: .zero, size: size)
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.locations = locations

        // 设置渐变方向（这里是水平方向）
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)

        // 开始图像上下文
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }

        // 创建圆角路径
        let rectPath = UIBezierPath(
            roundedRect: CGRect(origin: .zero, size: size),
            byRoundingCorners: [.topLeft, .topRight, .bottomRight],
            cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        context.addPath(rectPath.cgPath)
        context.clip()  // 裁剪上下文

        // 在当前裁剪上下文中绘制渐变
        gradientLayer.render(in: context)

        // 从上下文中获取图片
        let image = UIGraphicsGetImageFromCurrentImageContext()

        // 结束图像上下文
        UIGraphicsEndImageContext()
        return image?.resizableImage(
            withCapInsets: UIEdgeInsets(
                top: cornerRadius, left: cornerRadius, bottom: cornerRadius,
                right: cornerRadius), resizingMode: .stretch)

    }

    static func drawNoRightCornerImage(
        with colors: [UIColor], size: CGSize, cornerRadius: CGFloat,
        locations: [NSNumber]? = nil
    ) -> UIImage? {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(origin: .zero, size: size)
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.locations = locations

        // 设置渐变方向（这里是水平方向）
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)

        // 开始图像上下文
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }

        // 创建圆角路径
        let rectPath = UIBezierPath(
            roundedRect: CGRect(origin: .zero, size: size),
            byRoundingCorners: [.topLeft, .bottomLeft],
            cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        context.addPath(rectPath.cgPath)
        context.clip()  // 裁剪上下文

        // 在当前裁剪上下文中绘制渐变
        gradientLayer.render(in: context)

        // 从上下文中获取图片
        let image = UIGraphicsGetImageFromCurrentImageContext()

        // 结束图像上下文
        UIGraphicsEndImageContext()
        return image?.resizableImage(
            withCapInsets: UIEdgeInsets(
                top: cornerRadius, left: cornerRadius, bottom: cornerRadius,
                right: cornerRadius),
            resizingMode: .stretch)

    }

    public static func saveImage(
        _ image: UIImage, _ result: @escaping (Bool) -> Void
    ) {
        PHPhotoLibrary.shared().performChanges {
            PHAssetChangeRequest.creationRequestForAsset(from: image)
        } completionHandler: { success, error in
            DispatchQueue.main.async {
                if success {
                    result(success)
                } else {
                    result(false)
                }
            }
        }
    }

}
