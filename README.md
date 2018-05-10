# ImgCarouselView

Simple image carousel view.

![](./behaviour.gif)

## Usage

```swift
let imgCarouselView = ImgCarouselView(frame: frame)

imgCarouselView.configure(
    imageSources: [
        .url(URL(string: url1)!), // fetch image from url
        .url(URL(string: url2)!),
        .image(UIImage(named: "image")) // set UIImage
    ],
    cellContentMode: .scaleAspectFill
)

// you can add this imgCarouselView anywhere!
```

## Dependencies
- [kean/Nuke](https://github.com/kean/Nuke) for fetching image
