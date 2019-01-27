
# Text Detection

##### Among many of the powerful frameworks Apple released at this year’s WWDC, the Vision framework was one of them. With the Vision framework, you can easily implement computer vision techniques into your apps with no higher knowledge at all! With Vision, you can have your app perform a number of powerful tasks such as identifying faces and facial features (ex: smile, frown, left eyebrow, etc.), barcode detection, classifying scenes in images, object detection and tracking, and horizon detection.



##### In this tutorial, we will be leveraging the Vision framework for text detection. We will build an app that will be able to detect text regardless of the font, object, and color. As shown in the picture below, the Vision framework can recognize text that are both printed and hand-written.


## Download Starter Project
To save you time from building the UI of the app and focus on learning the Vision framework, download the [starter project](starter_project) to begin with. 
NOTE: We will be using Swift 4 and Xcode 9

![Pic 1](img "Pic1")

## Creating a Live Stream
When you open the project, you see that the views in the storyboard are all ready and set up for you. Heading over to ```ViewController.swift```, you will find the code skeleton with a couple of outlets and funcions. Our first step is to create the live stream that will be used to detect text. Right under the ```imageView``` outlet, declare another property for ```AVCaptureSession```:

```Swift
    var session = AVCaptureSession()
```

This initalizes an object of AVCaptureSession that performs a real-time or offline capture. It is used whenever you want to perform some actions based on a live stream. Next, we need to connect the session to our device. Start by adding the following function in ```ViewController.swift```.

```Swift

func startLiveVideo() {
    //1
    session.sessionPreset = AVCaptureSession.Preset.photo
    let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)

    //2
    let deviceInput = try! AVCaptureDeviceInput(device: captureDevice!)
    let deviceOutput = AVCaptureVideoDataOutput()
    deviceOutput.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: Int(kCVPixelFormatType_32BGRA)]
    deviceOutput.setSampleBufferDelegate(self, queue: DispatchQueue.global(qos: DispatchQoS.QoSClass.default))
    session.addInput(deviceInput)
    session.addOutput(deviceOutput)

    //3
    let imageLayer = AVCaptureVideoPreviewLayer(session: session)
    imageLayer.frame = imageView.bounds
    imageView.layer.addSublayer(imageLayer)

    session.startRunning()
}
```

If you have worked with ```AVFoundation``` before, you will find most of this code familiar. If you haven’t, don’t worry. We’ll go thorough the code line-by-line.

1. We begin by modifying the settings of our ```AVCaptureSession```. Then, we set the AVMediaType as video because we want a live stream so it should always be continuously running.
2. Next, we define the device input and output. The input is what the camera is seeing and the output is what the video should appear as. We want the video to appear as a ```kCVPixelFormatType_32BGRA``` which is a type of video format. You can learn more about pixel format types [here](https://developer.apple.com/documentation/corevideo/cvpixelformatdescription/1563591-pixel_format_identifiers). Lastly, we add the input and output to the ```AVCaptureSession```.
3. Finally, we add a sublayer containing the video preview to the ```imageView``` and get the session running.

Call this function in the ```viewWillAppear``` method:

```Swift

    override func viewWillAppear(_ animated: Bool) {
        startLiveVideo()
    }
```
Since the bounds of the image view is not yet finalized in ```viewWillAppear()```, override the ```viewDidLayoutSubviews()``` method to update the layer’s bound:

```Swift
    override func viewDidLayoutSubviews() {
        imageView.layer.sublayers?[0].frame = imageView.bounds
    }
```

Before you give it a run, add an entry in Info.plist to provide a reason why you need to use the camera. This is required by Apple since the release of iOS 10:

[Privcay Img](privacy_img_link)

The live stream should work as expected. However, there is no text detection going on because we haven’t implemented the Vision framework yet. This is what we will do next.

## Implementing Text Detection

Before we implement the text detection part, we need to understand how the Vision framework works. Basically, there are 3 steps to implement Vision in your app, whic are:

* Requests – Requests are when you request the framework to detect something for you.
* Handlers – Handlers are when you want the framework to perform something after the request is made or “handle” the request.
* Observations – Observations are what you want to do with the data provided with you.

[Request-Observation](request-obs-img)


Now to start, let’s begin with a request. Right under the initialization of the variable ```session```, declare another variable as follows:

```Swift
    var requests = [VNRequest]()
```

We have created an array that will contain a generic ```VNRequest```. Next, let’s create the function that will start the text detection in the ```ViewController``` class.

```Swift
    func startTextDetection() {
        let textRequest = VNDetectTextRectanglesRequest(completionHandler: self.detectTextHandler)
        textRequest.reportCharacterBoxes = true
        self.requests = [textRequest]
    }
```
In this function, we create a constant ```textRequest``` that is a ```VNDetectTextRectanglesRequest```. Basically it is just a specific type of ```VNRequest``` that only looks for rectangles with some text in them. When the framework has completed this request, we want it to call the function ```detectTextHandler```. We also want to know exactly what the framework has recognized which is why we set the property ```reportCharacterBoxes``` equal to ```true```. Finally, we set the variable ```requests``` created earlier to ```textRequest```.





<!--
# H1
 *italics*
**bold**
 ~~Scratch this.~~
* Unordered list
1. Ordered list.
[I'm an inline-style link](https://www.google.com)

[logo]: https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Logo Title Text 2"


-->