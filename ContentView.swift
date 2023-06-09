import SwiftUI
import AVKit

struct ContentView: View {
    @State private var selectedPage: String = "For You"
    @State private var isCommentInputVisible: Bool = false
    
    var body: some View {
        NavigationView{
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                ControlsContainerView(selectedPage: $selectedPage)
                    .padding(.top, 30)
                
                HStack {
                    if selectedPage == "For You" {
                        VideoPlayerView()
                    } else {
                        Text("Following Content")
                            .foregroundColor(.white)
                    }
                    
                    RightSideButtonsView(isCommentInputVisible: $isCommentInputVisible)
                        .padding(.trailing, 10)
                }
                NavigationLink(destination: UserProfileView()) {
                                    Text("User Profile")
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(Color.blue)
                                        .cornerRadius(8)
                                }
                
                Spacer()
                BottomButtonsView()
                    .padding(.bottom, 10)
            }
            
            if isCommentInputVisible {
                CommentInputView(isCommentInputVisible: $isCommentInputVisible)
            }
        }
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
