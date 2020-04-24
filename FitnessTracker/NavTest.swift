import SwiftUI
import Combine

//declares what type of enviornment for refrence
enum MyAppPage {
    case Menu
    case SecondPage
}

final class MyAppEnvironmentData: ObservableObject {
    @Published var currentPage : MyAppPage? = .Menu
}

struct NavigationTest: View {

    var body: some View {
        NavigationView {
            PageOne()
        }
    }
}


struct PageOne: View {
    //says that the MyAppPage is the lable envoirnment
    @EnvironmentObject var env : MyAppEnvironmentData

    var body: some View {
        // a pointer/refrence to the next page and lables it as secondpage for easy refrence
        // selection... sets the page to menu
        let navlink = NavigationLink(destination: PageTwo(),
                       tag: .SecondPage,
                       selection: $env.currentPage,
                       label: { EmptyView() })

        return VStack {
            Text("Page One").font(.largeTitle).padding()

            navlink
            .frame(width:0, height:0)

            Button("Button") {
                self.env.currentPage = .SecondPage
            }
            .padding()
            .border(Color.primary)

        }
    }

}


struct PageTwo: View {

    @EnvironmentObject var env : MyAppEnvironmentData

    var body: some View {
        VStack {
            Text("Page Two").font(.largeTitle).padding()

            Text("Go Back")
            .padding()
            .border(Color.primary)
            .onTapGesture {
                self.env.currentPage = .Menu
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#if DEBUG
struct NavigationTest_Previews: PreviewProvider {
    static var previews: some View {
        //creates an EnviornmentObject using MyApp..
        //At creation MyApp assgins the calling page to menu
        
        NavigationTest().environmentObject(MyAppEnvironmentData())
    }
}
#endif
