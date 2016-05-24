//
//  ViewController.m
//  SafariTNG
//
//  Created by Andrew Bihl on 5/24/16.
//  Copyright © 2016 Andrew Bihl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property NSURL* lastURL;
@end

@implementation ViewController

- (IBAction)onBackButtonPressed:(UIButton *)sender {
    NSURLRequest* request = [NSURLRequest requestWithURL:self.lastURL];
    [self.webView loadRequest:request];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL* url = [NSURL URLWithString:@"http://mobilemakers.co"];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    }

-(void)webViewDidStartLoad:(UIWebView *)webView{
    [self.activityIndicator startAnimating];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.activityIndicator stopAnimating];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSString* urlInput = self.urlTextField.text;
    if (![urlInput containsString:@"http://"] && ![urlInput containsString:@"https://"]){
        urlInput = [NSString stringWithFormat:@"http://%@",urlInput];
    }
    self.lastURL = self.webView.request.URL;
    NSURL* url = [NSURL URLWithString:urlInput];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    return true;
}
@end
