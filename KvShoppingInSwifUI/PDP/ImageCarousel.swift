import SwiftUI

struct ImageCarousel: View {
    let urls: [URL]
    @StateObject var imageLoading = ImageLoader.shared
    
    @Binding var zoomedSelector: ZoomedImageSelector
    
    init(
        product: PDPProduct?,
        selector: Binding<ZoomedImageSelector>
    ) {
        _zoomedSelector = selector
        let urls = product?.images
            .sorted(by: { $0.rank < $1.rank })
            .compactMap { $0.value } ?? []
        self.urls = urls
    }
    
    var body: some View {
        ScrollViewReader { scrollView in
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(urls, id: \.self) { url in
                        KVAsyncImage(url: url)
                        .id(url)
                        .frame(width: 80, height: 120, alignment: .leading)
                        .padding()
                        .onTapGesture(perform: {
                            self.zoomedSelector.urls = self.urls
                            self.zoomedSelector.scrollView = scrollView
                            self.zoomedSelector.setCurrentIndex(for: url, from: self.urls)
                            withAnimation {
                                self.zoomedSelector.isZoomed.toggle()
                            }
                        })
                    }
                }
            }
        }
    }
}
