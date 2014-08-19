//
//  UploadImageViewController.m
//  AbayaHub
//
//  Created by tyms on 27/07/2014.
//  Copyright (c) 2014 __FatimaGalaudu__. All rights reserved.
//

#import "UploadImageViewController.h"

@implementation UploadImageViewController
- (IBAction)takePhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}

- (IBAction)selectPhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (IBAction)uploadPhoto:(UIButton *)sender
{
    NSData *imageData = UIImagePNGRepresentation(self.imageView.image);
    NSString *imageString = [imageData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    
    //now you can add it to your dictionary
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:imageString forKey:@"image"];
    
    if ([NSJSONSerialization isValidJSONObject:dict]) //perform a check
    {
        NSLog(@"valid object for JSON");
        NSError *error = nil;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
        //probably have the wrong encoding here
        NSString* newStr = [[NSString alloc] initWithData:jsonData encoding: NSUTF8StringEncoding];
        
        if (error!=nil) {
            NSLog(@"Error creating JSON Data = %@",error);
        }
        else{
            NSLog(@"JSON Data created successfully.");
        }
    }
    else{
        NSLog(@"not a valid object for JSON");
    }
    
   // NSLog(@"Blob Created: %@", jsonData);
   // NSData *jsonArray = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&jsonError];
    


}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    self.imageView = nil;
}

@end
