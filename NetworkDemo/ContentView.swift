//
//  ContentView.swift
//  NetworkDemo
//
//  Created by Andy on 2022/8/29.
//

import SwiftUI

struct ContentView: View {
    @State private var text = ""

    var body: some View {
        VStack {
            Text(text).font(.title)

            Button {
                self.startLoad()
            } label: {
                Text("Start").font(.largeTitle)
            }

            Button {
                self.text = ""
            } label: {
                Text("Clear").font(.largeTitle)
            }

        }
    }

    func startLoad() {

        NetworkAPI.recommendPostList { result in
            switch result {
            case let .success(list): self.updateText("Post count \(list.list.count)")
            case let .failure(error): self.updateText(error.localizedDescription)
            }
        }

//        let url = URL(string: "https://github.com/xiaoyouxinqing/PostDemo/raw/master/PostDemo/Resources/PostListData_recommend_1.json")!

       /* NetworkManager.shared.requestGet(path: "PostListData_recommend_1.json", parameters: nil) { result in
            switch result {
            case let .success(data):
                guard let list = try? JSONDecoder().decode(PostList.self, from: data) else {
                    self.updateText("Can not parse data")
                    return
                }
                self.updateText("Post count \(list.list.count)")

            case let .failure(error):
                self.updateText(error.localizedDescription)
            }

        }*/

        /*AF.request(url).responseData { response in
            switch response.result {
            case let .success(data):
                guard let list = try? JSONDecoder().decode(PostList.self, from: data) else {
                    self.updateText("Can not parse data")
                    return
                }

                self.updateText("Post count \(list.list.count)")

            case let .failure(error):
                // Handle error
                self.updateText(error.localizedDescription)
            }
        }*/
        /*var request = URLRequest(url: url)
        request.timeoutInterval = 15
        request.httpMethod = "POST"
        let dic = ["key":"value"]
        let data = try! JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
        request.httpBody = data
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
       let task = URLSession.shared.dataTask(with: request) { data, response, error in
           if let error = error {
               self.updateText(error.localizedDescription)
               return
           }
           guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
               self.updateText("Invalid response")
               return
           }
           guard let data = data else {
               self.updateText("No data")
               return
           }
           guard let list = try? JSONDecoder().decode(PostList.self, from: data) else {
               self.updateText("Can not parse data")
               return
           }

           self.updateText("Post count \(list.list.count)")
        }
        task.resume()*/
    }

    func updateText(_ text: String) {
        self.text = text
        //用网络库不需要再写主线程中操作
        /*DispatchQueue.main.async {
        }*/
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
