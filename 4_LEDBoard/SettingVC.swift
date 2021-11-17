//
//  SettingVC.swift
//  4_LEDBoard
//
//  Created by 이윤수 on 2021/10/25.
//

import UIKit

protocol DataSend:AnyObject {
    func Data(text: String, textColor: UIColor, bgColor: UIColor)
}

class SettingVC:UIViewController{
    
    var label_text : UILabel!
    var label_textColor : UILabel!
    var label_backgroundColor : UILabel!
    var tf : UITextField!
    var btn_text_y : UIButton!
    var btn_text_purple : UIButton!
    var btn_text_g : UIButton!
    var btn_bg_black : UIButton!
    var btn_bg_blue : UIButton!
    var btn_bg_orange : UIButton!
    
    var textStack : UIStackView!
    var textColorStack : UIStackView!
    var colorBtnStack : UIStackView!
    var bgColorStack : UIStackView!
    var bgBtnStack : UIStackView!
    
    var back : UIButton!
    
    weak var DataSendD:DataSend?
    var textColor: UIColor = .yellow
    var bgColor: UIColor = .black
    var text:String?
    
    func configureView(){
        if let text = self.text{
            self.tf.text = text
        }
        self.changeTextColor(color: self.textColor)
        self.changeBgColor(color: self.bgColor)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.view.backgroundColor = .white
        self.navigationItem.title = "설정"
        
        textStack = UIStackView()
        textStack.alignment = .fill
        textStack.axis = .vertical
        textStack.distribution = .fill
        textStack.spacing = 10
        textStack.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(textStack)
        
        label_text = UILabel()
        label_text.text = "전광판에 표시할 글자"
        label_text.translatesAutoresizingMaskIntoConstraints = false
        self.textStack.addArrangedSubview(label_text)
        
        tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.borderStyle = .roundedRect
        self.textStack.addArrangedSubview(tf)
        
        NSLayoutConstraint.activate([
            self.textStack.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 15),
            self.textStack.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, constant: -20),
            self.textStack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
        
        
        textColorStack = UIStackView()
        textColorStack.alignment = .fill
        textColorStack.axis = .vertical
        textColorStack.distribution = .fill
        textColorStack.spacing = 10
        textColorStack.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(textColorStack)
        
        label_textColor = UILabel()
        label_textColor.text = "텍스트 색상 설정"
        label_textColor.translatesAutoresizingMaskIntoConstraints = false
        self.textColorStack.addArrangedSubview(label_textColor)
        
        colorBtnStack = UIStackView()
        colorBtnStack.axis = .horizontal
        colorBtnStack.alignment = .center
        colorBtnStack.distribution = .equalSpacing
        colorBtnStack.spacing = 5
        self.textColorStack.addArrangedSubview(colorBtnStack)
        
        btn_text_y = UIButton(type: .system)
        btn_text_y.setImage(UIImage(named: "YellowC")?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn_text_y.translatesAutoresizingMaskIntoConstraints = false
        btn_text_y.addTarget(self, action: #selector(tapTextColorBtn(_:)), for: .touchUpInside)
        self.colorBtnStack.addArrangedSubview(btn_text_y)
        
        btn_text_purple = UIButton(type: .system)
        btn_text_purple.setImage(UIImage(named: "purpleC")?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn_text_purple.translatesAutoresizingMaskIntoConstraints = false
        btn_text_purple.alpha = 0.2
        btn_text_purple.addTarget(self, action: #selector(tapTextColorBtn(_:)), for: .touchUpInside)
        self.colorBtnStack.addArrangedSubview(btn_text_purple)
        
        btn_text_g = UIButton(type: .system)
        btn_text_g.setImage(UIImage(named: "greenC")?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn_text_g.translatesAutoresizingMaskIntoConstraints = false
        btn_text_g.alpha = 0.2
        btn_text_g.addTarget(self, action: #selector(tapTextColorBtn(_:)), for: .touchUpInside)
        self.colorBtnStack.addArrangedSubview(btn_text_g)
        
        NSLayoutConstraint.activate([
            self.textColorStack.topAnchor.constraint(equalTo: self.textStack.bottomAnchor, constant: 15),
            self.textColorStack.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, constant: -20),
            self.textColorStack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
        
        
        bgColorStack = UIStackView()
        bgColorStack.alignment = .fill
        bgColorStack.axis = .vertical
        bgColorStack.distribution = .fill
        bgColorStack.spacing = 10
        bgColorStack.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(bgColorStack)
        
        label_backgroundColor = UILabel()
        label_backgroundColor.text = "배경 색상 설정"
        label_backgroundColor.translatesAutoresizingMaskIntoConstraints = false
        self.bgColorStack.addArrangedSubview(label_backgroundColor)
        
        bgBtnStack = UIStackView()
        bgBtnStack.axis = .horizontal
        bgBtnStack.alignment = .center
        bgBtnStack.distribution = .equalSpacing
        bgBtnStack.spacing = 5
        self.bgColorStack.addArrangedSubview(bgBtnStack)
        
        btn_bg_black = UIButton(type: .system)
        btn_bg_black.setImage(UIImage(named: "blackC")?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn_bg_black.translatesAutoresizingMaskIntoConstraints = false
        btn_bg_black.addTarget(self, action: #selector(tapBackgroundBtn(_:)), for: .touchUpInside)
        self.bgBtnStack.addArrangedSubview(btn_bg_black)
        
        btn_bg_blue = UIButton(type: .system)
        btn_bg_blue.setImage(UIImage(named: "blueC")?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn_bg_blue.translatesAutoresizingMaskIntoConstraints = false
        btn_bg_blue.alpha = 0.2
        btn_bg_blue.addTarget(self, action: #selector(tapBackgroundBtn(_:)), for: .touchUpInside)
        self.bgBtnStack.addArrangedSubview(btn_bg_blue)
        
        btn_bg_orange = UIButton(type: .system)
        btn_bg_orange.setImage(UIImage(named: "orangeC")?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn_bg_orange.translatesAutoresizingMaskIntoConstraints = false
        btn_bg_orange.alpha = 0.2
        btn_bg_orange.addTarget(self, action: #selector(tapBackgroundBtn(_:)), for: .touchUpInside)
        self.bgBtnStack.addArrangedSubview(btn_bg_orange)
        
        NSLayoutConstraint.activate([
            self.bgColorStack.topAnchor.constraint(equalTo: self.textColorStack.bottomAnchor, constant: 15),
            self.bgColorStack.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, constant: -20),
            self.bgColorStack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
        
        back = UIButton()
        back.setTitle("설정", for: .normal)
        back.setTitleColor(UIColor.black, for: .normal)
        back.translatesAutoresizingMaskIntoConstraints = false
        back.addTarget(self, action: #selector(saveBack(_:)), for: .touchUpInside)
        self.view.addSubview(back)
        
        NSLayoutConstraint.activate([
            self.back.widthAnchor.constraint(equalToConstant: 50),
            self.back.heightAnchor.constraint(equalToConstant: 50),
            self.back.topAnchor.constraint(equalTo: self.bgColorStack.bottomAnchor, constant: 25),
            self.back.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
        
        self.configureView()
    }
    
    @objc func tapTextColorBtn(_ sender:UIButton){
        print(sender)
        
        if sender == self.btn_text_purple {
            self.changeTextColor(color: .purple)
            self.textColor = .purple
        }else if sender == self.btn_text_y{
            self.changeTextColor(color: .yellow)
            self.textColor = .yellow
        }else{
            self.changeTextColor(color: .green)
            self.textColor = .green
        }
    }
    
    @objc func tapBackgroundBtn(_ sender:UIButton){
        if sender == self.btn_bg_blue {
            self.changeBgColor(color: .blue)
            self.bgColor = .blue
        }else if sender == self.btn_bg_black{
            self.changeBgColor(color: .black)
            self.bgColor = .black
        }else{
            self.changeBgColor(color: .orange)
            self.bgColor = .orange
        }
    }
    
    @objc func saveBack(_ sender:Any){
        self.DataSendD?.Data(text: self.tf.text!, textColor: self.textColor, bgColor: self.bgColor)
        self.navigationController?.popViewController(animated: true)
    }
    
    func changeTextColor(color: UIColor){
        self.btn_text_purple.alpha = color == UIColor.purple ? 1 : 0.2
        self.btn_text_y.alpha = color == UIColor.yellow ? 1 : 0.2
        self.btn_text_g.alpha = color == UIColor.green ? 1 : 0.2
    }
    
    func changeBgColor(color: UIColor){
        self.btn_bg_blue.alpha = color == UIColor.blue ? 1 : 0.2
        self.btn_bg_black.alpha = color == UIColor.black ? 1 : 0.2
        self.btn_bg_orange.alpha = color == UIColor.orange ? 1 : 0.2
    }
}
