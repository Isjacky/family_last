//
//  InformUIView.swift
//  HifamilySwiftUI
//
//  Created by 游 on 2021/9/22.
//

import SwiftUI
import LeanCloud

struct InformUIView: View {
    @Environment(\.presentationMode) var presentationModess
    @State var isCreater = true;
    @State var username = ""
    @State var phone = ""
    
    
    var body: some View {
        
        
        GeometryReader { geo in
        VStack {
            //返回按钮
            Button(action: {
                self.presentationModess.wrappedValue.dismiss()//返回的方法
            }) {
                HStack {
                    Image(systemName: "chevron.backward")
                        .frame(width: 20, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Text("返回")
                        .font(.title3)
                }
                
            }
            .frame(width:geo.size.width, alignment: .leading)
            .padding(.leading,10)
            
            //头像
            HStack {
                Image("father")
                    .padding(.leading,30)
                    .shadow(color: Color.gray, radius: 3, x: 5, y: 5)
                VStack {
                    Text(username)
                        .font(.title2)
                        .frame(width:geo.size.width - 150, alignment: .leading)
                        .padding(.top,10)
                    HStack {
                        Text( isCreater ? "创建者" : "加入者")
                            .frame(width: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .font(.subheadline)
                            .foregroundColor(Color("AccentColor"))
                            .padding(5)
                            .background(Color.white)
                            .cornerRadius(13)
                            .shadow(color: Color("AccentColor"), radius: 3, x: 3, y: 3.0)

                            
                    }
                    .frame(width:geo.size.width - 150, alignment: .leading)
                }
                .padding(.leading,20)
                
               
            }
            .frame(width:geo.size.width, height:100, alignment: .leading)
            .padding(.bottom,20)
            
            
            VStack {
                Form{
                    HStack {
                        Text("家庭身份")
                        TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    }
                    
                    if isCreater{
                        HStack {
                            Text("家庭树名字")
                            TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        }
                    }
                }
                .frame(width:geo.size.width - 20,height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(20)
                .offset(x: -5)
                .padding(.bottom,5)
                
                Form {
                    HStack {
                        Text("昵称")
                        TextField("请输入昵称", text: $username)
                    }
//                    HStack {
//                        Text("性别")
//                        TextField("请选择性别", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                    }
                    HStack {
                        Text("手机号")
                        TextField("请输入手机号", text: $phone)
                    }
                    
                    
                }
                .frame(width:geo.size.width - 20,height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(20)
                .offset(x: -5)
                .padding(.bottom,20)
                
            }
            Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                Text("退出当前账号")
                    .font(.headline)
                    .frame(width:UIScreen.main.bounds.width - 90*2,height:56)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(30)
//                    .padding(.top,30)
            }
            Spacer()
            }
            .onAppear(){
                let objectId = LCApplication.default.currentUser?.objectId
                let query = LCQuery(className: "_User")
                let _ = query.get(objectId!) { (result) in
                    switch result {
                    case .success(object: let todo):
                        let username = todo.username?.stringValue
                        let mobilePhoneNUmber = todo.mobilePhoneNUmber?.stringValue
                        self.username = username!
                        self.phone = mobilePhoneNUmber!
                    case .failure(error: let error):
                        print(error)
                    }
                }
                
            }
           
       
        }
    }
}

struct InformUIView_Previews: PreviewProvider {
    static var previews: some View {
        InformUIView()
    }
}

//let familyTree = LCObject(className: "familyTree")
//familyTree.createrId = LCApplication.default.currentUser?.id
//_ = familyTree.save { result in
//      switch result {
//      case .success:
//          // 成功保存之后，执行其他逻辑
//        status = 1
//        isLoginBefore = true
//        isPressed = true
//        isLogin = true
//        error2 = updateUser(objectId1: objectId, status1: status)
//        print("创建家庭树成功")
//          break
//      case .failure(error: let error):
//          // 异常处理
//          print("创建家庭树失败\(error)")
//      }
//  }
