//
//  UploadImageViewController.h
//  AbayaHub
//
//  Created by tyms on 27/07/2014.
//  Copyright (c) 2014 __FatimaGalaudu__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UploadImageViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)takePhoto:  (UIButton *)sender;
- (IBAction)selectPhoto:(UIButton *)sender;
- (IBAction)uploadPhoto:(UIButton *)sender;


@end
