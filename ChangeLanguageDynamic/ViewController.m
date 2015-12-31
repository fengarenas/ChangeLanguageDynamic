//
//  ViewController.m
//  ChangeLanguageDynamic
//
//  Created by Fengj on 15/12/31.
//  Copyright © 2015年 DevFeng. All rights reserved.
//

#import "ViewController.h"
#import "LocalizationManager.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *changeLanguageButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置默认语言为中文简体
    setLanguage(@"zh-Hans");
    
    //载入界面字符串
    [self loadUIStrings];
    
    //监听语言变化通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loadUIStrings) name:languageChangedNoti object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)loadUIStrings {
    self.userNameTextField.placeholder = getString(@"UserNamePlaceHolder");
    self.passwordTextField.placeholder = getString(@"PassWordPlaceHolder");
    [self.loginButton setTitle:getString(@"Login") forState:UIControlStateNormal];
    [self.changeLanguageButton setTitle:getString(@"ChangeLanguage") forState:UIControlStateNormal];
}

- (IBAction)changeLanguageButtonClicked:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:getString(@"ChangeLanguage") message:nil preferredStyle:UIAlertControllerStyleActionSheet];

    UIAlertAction *action1 = [UIAlertAction actionWithTitle:getString(@"Chinese(Simplified)")
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * _Nonnull action) {
                                                       setLanguage(@"zh-Hans");
                                                    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:getString(@"Chinese(Traditional)")
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * _Nonnull action) {
                                                       setLanguage(@"zh-Hant");
                                                   }];
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:getString(@"English")
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * _Nonnull action) {
                                                       setLanguage(@"en");
                                                   }];
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:getString(@"cancel") style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alert addAction:action1];
    [alert addAction:action2];
    [alert addAction:action3];
    [alert addAction:actionCancel];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)tapGesHandler:(id)sender {
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
