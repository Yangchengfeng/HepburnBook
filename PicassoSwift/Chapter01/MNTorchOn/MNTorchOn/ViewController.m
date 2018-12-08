//
//  ViewController.m
//  MNTorchOn
//
//  Created by Lin,Meini on 2018/12/8.
//  Copyright © 2018 chengfeng_Yang. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@property(nonatomic, strong) AVCaptureSession *session;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    // Create the AVCapture Session
    self.session = [[AVCaptureSession alloc]init];
    [self.session beginConfiguration];
    
    // Create a AVCaptureDeviceInput with the camera device
    NSError *error = NULL;
    AVCaptureDeviceInput *deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
    if (error) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"Error %d", (int)[error code]]
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
        [alertView show];
        return;
    }
    
    AVCaptureDeviceFormat *currentFormat;
    for (AVCaptureDeviceFormat *format in device.formats) {
        NSArray *ranges = format.videoSupportedFrameRateRanges;
        AVFrameRateRange *frameRates = ranges[0];
        
        // Find the lowest resolution format at the frame rate we want.
        if (frameRates.maxFrameRate >= 21 && (!currentFormat || (CMVideoFormatDescriptionGetDimensions(format.formatDescription).width < CMVideoFormatDescriptionGetDimensions(currentFormat.formatDescription).width && CMVideoFormatDescriptionGetDimensions(format.formatDescription).height < CMVideoFormatDescriptionGetDimensions(currentFormat.formatDescription).height)))
        {
            currentFormat = format;
        }
    }
    
    if([device isTorchModeSupported:AVCaptureTorchModeOn]) {
        [device lockForConfiguration:nil];
        [device setTorchMode:AVCaptureTorchModeOn];
        device.activeFormat = currentFormat;
        [device setActiveVideoMinFrameDuration:CMTimeMake(1, 21)];
        [device setActiveVideoMaxFrameDuration:CMTimeMake(1, 21)];
        [device unlockForConfiguration];
    }
    
    if ([self.session canAddInput:deviceInput]) {
        [self.session addInput:deviceInput];
    }
    
    AVCaptureVideoDataOutput *videoDataOutput = [[AVCaptureVideoDataOutput alloc] init];
    if ([self.session canAddOutput:videoDataOutput]) {
        [self.session addOutput:videoDataOutput]; // ❗️What's wrong with it?
    }
    
    AVCaptureConnection *connection = [videoDataOutput connectionWithMediaType:AVMediaTypeVideo];
    [connection setVideoOrientation:AVCaptureVideoOrientationPortrait];
    
    [self.session commitConfiguration];
    [self.session startRunning];
    
}


@end
