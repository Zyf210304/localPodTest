//
//  SuperToast.swift
//  MyCloudMusic
//
//  Created by mac on 2024/4/25.
//

import UIKit
import MBProgressHUD
import SnapKit

public class SuperToast {
    
    public static  var hud:MBProgressHUD?
    
    /// 1.5秒文字提示
    /// - Parameter title: 提示文字
    public static func show(title: String?)  {
        
        let hud = MBProgressHUD.showAdded(to:UIApplication.shared.keyWindow!, animated: true)
        hud.mode = .text
        
        //背景颜色
        hud.bezelView.style = .solidColor
        hud.bezelView.backgroundColor = .black.withAlphaComponent(0.8)
        hud.bezelView.layer.cornerRadius = 18
        
        //标题提示文字颜色
        hud.label.textColor = .white
        hud.label.font = .systemFont(ofSize: 18)
        hud.label.numberOfLines = 0
        hud.label.text = title
        
        hud.label.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(8)
            make.left.right.equalToSuperview().inset(20)
        }
        
        let offsetY = -hud.frame.height/CGFloat(2) + CGFloat(80)

        
        //显示到屏幕顶部
        hud.offset = CGPoint(x: 0, y: offsetY)
        
        hud.removeFromSuperViewOnHide = true
        hud.hide(animated: true, afterDelay: 1.5)
    }
    
    
    public static func showLoading(title:String = "加载中") {
        //菊花颜色
        UIActivityIndicatorView.appearance(whenContainedInInstancesOf: [MBProgressHUD.self]).color = .white
        
//        [UIActivityIndicatorView appearanceWhenContainedInInstancesOfClasses:@[[MBProgressHUD class]]].color = [UIColor whiteColor];

        if (SuperToast.hud == nil) {
            SuperToast.hud = MBProgressHUD.showAdded(to: UIApplication.shared.keyWindow!, animated: true)
            SuperToast.hud!.mode = .indeterminate
            
            //最小尺寸
            SuperToast.hud!.minSize = CGSize(width: 120, height: 120)
            
            //背景半透明
            SuperToast.hud!.backgroundView.style = .solidColor
            SuperToast.hud!.backgroundView.color = UIColor(white: 0, alpha: 0.5)
            
            //背景颜色
            SuperToast.hud!.bezelView.style = .solidColor
            SuperToast.hud!.bezelView.backgroundColor = .black
            
            //标题文字颜色
            SuperToast.hud!.label.textColor = .white
            SuperToast.hud!.label.font = UIFont.boldSystemFont(ofSize: 18)
            
            //显示对话框
            SuperToast.hud!.show(animated: true)
        }
        
        //设置对话框文字
        SuperToast.hud!.label.text = title
        
        //详细文字
        //progressHUD.detailsLabelText = @"请耐心等待";
    }
    
    public static func hideLoading() {
        if let r = SuperToast.hud {
            r.hide(animated: true)
            SuperToast.hud = nil
        }
    }
}
