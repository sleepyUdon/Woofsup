//
//  SignUpViewController.m
//  Midterm (Storyboard)
//
//  Created by Viviane Chan on 2016-07-25.
//  Copyright © 2016 LightHouse Labs. All rights reserved.
//

#import "SignUpViewController.h"
#import "AppDelegate.h"
#import "Dog.h"
#import "User.h"


@interface SignUpViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *dogPictureView;

@property (weak, nonatomic) IBOutlet UITextField *dogNameField;
@property (weak, nonatomic) IBOutlet UITextField *dogBreedField;
@property (weak, nonatomic) IBOutlet UITextField *dogSexField;
@property (weak, nonatomic) IBOutlet UITextField *dogBirthDateField;
@property (weak, nonatomic) IBOutlet UITextField *dogOwnerField;
@property (weak, nonatomic) IBOutlet UITextField *dogDescriptionField;
@property (weak, nonatomic) IBOutlet UITextField *dogLocationField;
@property (weak, nonatomic) IBOutlet UITextField *dogUserNameField;
@property (weak, nonatomic) IBOutlet UITextField *dogPasswordField;

@property (weak, nonatomic) IBOutlet UILabel *errorMessageLabel;

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}




#pragma button: SAVE PROFILE

- (IBAction)saveProfile:(id)sender {
    Dog *dog = [NSEntityDescription insertNewObjectForEntityForName:@"Dog" inManagedObjectContext:self.managedObjectContext];
    
    dog.dogPicture = self.dogPictureView.image;
    dog.dogName = self.dogNameField.text;
    dog.dogGender = self.dogSexField.text;
    

// date picker

    dog.dogOwner = self.dogOwnerField.text;
    dog.dogDescription = self.dogDescriptionField.text;
    dog.dogLocation = self.dogUserNameField.text;
    dog.dogDescription = self.dogUserNameField.text;
    
    User *user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:self.managedObjectContext];

    user.userName = self. dogUserNameField.text;
    user.password = self.dogPasswordField.text;
    
    
    NSError *error = nil;
    
    [self.navigationController popViewControllerAnimated:YES];
    
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"error saving: %@", error.localizedDescription);
    }
}


#pragma button: PICK PICTURE


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:NULL];
     self.dogPictureView.image = info[UIImagePickerControllerOriginalImage];
    
    NSString* imageName = [NSString stringWithFormat:(@"%@picture",self.dogUserNameField.text)];
    UIImage *dogImage = [UIImage imageNamed:imageName];
    Dog *dog = [[Dog alloc]init];
    dog.dogPicture = UIImageJPEGRepresentation(dogImage, 1.0);
    
//    [newManagedObject setValue:imageData forKey:@"image"];

}














- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end