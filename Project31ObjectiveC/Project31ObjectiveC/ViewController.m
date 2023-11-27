//
//  ViewController.m
//  Project31ObjectiveC
//
//  Created by Jonathan Paul on 11/27/23.
//

#import "ViewController.h"
#import "WebKit/WebKit.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UITextField *addressBar;
@property (strong, nonatomic) IBOutlet UIStackView *stackView;
@property (weak, nonatomic) WKWebView *activeWebView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setDefaultTitle];

    UIBarButtonItem *add = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addWebView)];
    UIBarButtonItem *delete = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(deleteWebView)];

    self.navigationItem.rightBarButtonItems = @[delete, add];
}

- (void)setDefaultTitle {
    self.title = @"Multibrowser";
}

- (void)addWebView {
    WKWebView *webView = [WKWebView new];
    webView.navigationDelegate = self;

    [self.stackView addArrangedSubview:webView];

    NSURL *url = [NSURL URLWithString:@"https://www.jonathandpaul.com"];

    [webView loadRequest:[NSURLRequest requestWithURL:url]];

    // Highlight the new webview and recognize when it is tapped on by the user
    webView.layer.borderColor = [[UIColor blueColor] CGColor];
    [self selectWebView:webView];

    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(webViewTapped:)]; // add a colon for each param in teh selector
    recognizer.delegate = self;
    [webView addGestureRecognizer:recognizer];
}

// Create a border around the selected web view and set it to the activeWebView property
- (void)selectWebView:(WKWebView *)webView {
    for (UIView *view in self.stackView.arrangedSubviews) {
        view.layer.borderWidth = 0;
    }

    self.activeWebView = webView;
    webView.layer.borderWidth = 3;

    [self updateUI:webView];
}

- (void)updateUI:(WKWebView*)webView {
    self.title = webView.title;
    self.addressBar.text = webView.URL.absoluteString;
}


- (void) webViewTapped:(UITapGestureRecognizer *)recognizer {
    WKWebView *webView = (WKWebView*)recognizer.view;
    [self selectWebView:webView];
}

// WKNavigationDelegate method to update the UI when the WKWebView finishes loading
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    if (webView == self.activeWebView) {
        [self updateUI:webView];
    }
}

// TODO: Just like being John Malcovich?
// UIGestureRecognizerDelegate method to tell the gesture to be recognized alongside the recognizers built into the WKWebView
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

// UITextFieldDelegate method when the user clicks return on the keyboard
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // This is far less safe without the "if let"s
    NSURL *url = [NSURL URLWithString:self.addressBar.text];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.activeWebView loadRequest:urlRequest];

    // Make the keyboard hide
    [textField resignFirstResponder];
    return YES;
}

- (void)deleteWebView {
    // Because we don't have "if let" we can check for nil to be safe
    if (self.activeWebView == nil) {
        return;
    }
    // In Objective-C the index is of type NSUInteger instead of Array<UIView>.Index which is, in Swift, a typealias to Int
    NSUInteger index = [self.stackView.arrangedSubviews indexOfObject:self.activeWebView];
    [self.activeWebView removeFromSuperview];

    if ([self.stackView.arrangedSubviews count] == 0) {
        // go back to our default UI
        [self setDefaultTitle];
    } else {
        // if that was the last webview in the stack, go back one
        if (index == self.stackView.arrangedSubviews.count) {
            index = self.stackView.arrangedSubviews.count - 1;
        }

        // find the web view at the new index and select it
        // This is done in a less safe way in obj-c
        WKWebView *webView = (WKWebView*)self.stackView.arrangedSubviews[index];
        [self selectWebView:webView];
    }
}

// Deprecated in iOS 17.0
// Have reacive view when multitasking is happening on iPad
- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    if (self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClassCompact) {
        self.stackView.axis = UILayoutConstraintAxisVertical;
    } else {
        self.stackView.axis = UILayoutConstraintAxisHorizontal;
    }
}



@end
