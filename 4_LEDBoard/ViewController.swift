//
//  ViewController.swift
//  4_LEDBoard
//
//  Created by 이윤수 on 2021/10/25.
//

import UIKit

class ViewController: UIViewController {

    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.navigationItem.rightBarButtonItem =  UIBarButtonItem(title: "설정", style: .done, target: self, action: #selector(nextView(_:)))
        
        self.view.backgroundColor = .black
      
        label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 50)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .yellow
        label.text = "TEXT"
        self.view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }

    @objc func nextView(_ Sender:Any){
        let st = SettingVC()
        st.DataSendD = self
        st.text = self.label.text
        st.textColor = self.label.textColor
        st.bgColor = self.view.backgroundColor ?? . black
        self.navigationController?.pushViewController(st, animated: true)
    }
    
}
extension ViewController:DataSend{
    func Data(text: String, textColor: UIColor, bgColor: UIColor) {
        self.label.text = text
        self.label.textColor = textColor
        self.view.backgroundColor = bgColor
    }
    
    
}
