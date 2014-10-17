//
//  ViewController.m
//  SCITokenSearchFieldExample
//
//  Created by Jan Scheithauer on 10.10.14.
//  Copyright (c) 2014 scireum. All rights reserved.
//

#import "ViewController.h"
#import "SCITokenSearchField.h"

@interface ViewController () <SCITokenSearchFieldDelegate, SCITokenSearchFieldDataSource>
@property (weak, nonatomic) IBOutlet SCITokenSearchField *tokenField;
@property (strong, nonatomic) SCITokenSearchField *navSearchBar;
@property (strong, nonatomic) NSMutableArray *names;
@property (strong, nonatomic) NSMutableArray *namesSearchbar;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.names = [NSMutableArray array];
    self.namesSearchbar = [NSMutableArray array];

    self.navSearchBar = [[SCITokenSearchField alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    self.navSearchBar.tag = 1;
    self.navSearchBar.delegate = self;
    self.navSearchBar.dataSource = self;
    self.navSearchBar.placeholderText = NSLocalizedString(@"Enter names here", nil);
    self.navSearchBar.tokenSeparator = @"";
    self.navSearchBar.useAlwaysBubblesForTokens = YES;
    self.navSearchBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;

    UIView *searchBarContainer = [[UIView alloc] initWithFrame:self.navSearchBar.frame];
    [searchBarContainer addSubview:self.navSearchBar];
    UIBarButtonItem *searchBarItem = [[UIBarButtonItem alloc] initWithCustomView:searchBarContainer];
    NSMutableArray *items = [[NSMutableArray alloc] initWithCapacity:1];
    [items addObject:searchBarItem];
    self.navigationItem.rightBarButtonItems = items;
    [[self.navSearchBar layer] setBorderColor:[[UIColor clearColor] CGColor]];
    [[self.navSearchBar layer] setBorderWidth:1]; // border width
    [[self.navSearchBar layer] setCornerRadius:5]; // radius of rounded corners
    [[self.navSearchBar layer] setBackgroundColor:[[UIColor whiteColor] CGColor]];

    self.tokenField.tag = 2;
    self.tokenField.delegate = self;
    self.tokenField.dataSource = self;
    self.tokenField.placeholderText = NSLocalizedString(@"Enter names here", nil);
    self.tokenField.tokenSeparator = @"";
    self.tokenField.useAlwaysBubblesForTokens = YES;
    [self.tokenField setColorScheme:[UIColor colorWithRed:61/255.0f green:149/255.0f blue:206/255.0f alpha:1.0f]];
    [self.tokenField becomeFirstResponder];

    [self.tokenField.layer setBorderColor:[[UIColor clearColor] CGColor]];
    [self.tokenField.layer setBorderWidth:0.5];
    [[self.tokenField layer] setCornerRadius:5]; // radius of rounded corners
    [self.tokenField setClipsToBounds: YES]; //clip text within the bounds

}

- (IBAction)didTapResignFirstResponderButton:(id)sender
{
    [self.tokenField resignFirstResponder];
}


#pragma mark - SCITokenSearchFieldDelegate

- (void)tokenSearchField:(SCITokenSearchField *)tokenSearchField didEnterText:(NSString *)text
{
    tokenSearchField.tag == 1 ? [self.namesSearchbar addObject:text] : [self.names addObject:text];
    [tokenSearchField reloadData];
}

- (void)tokenSearchField:(SCITokenSearchField *)tokenSearchField didDeleteTokenAtIndex:(NSUInteger)index
{
    tokenSearchField.tag == 1 ? [self.namesSearchbar removeObjectAtIndex:index] : [self.names removeObjectAtIndex:index];
    [tokenSearchField reloadData];
}


#pragma mark - SCITokenSearchFieldDataSource

- (NSString *)tokenSearchField:(SCITokenSearchField *)tokenSearchField titleForTokenAtIndex:(NSUInteger)index
{
    return tokenSearchField.tag == 1 ? self.namesSearchbar[index] : self.names[index];

}

- (NSUInteger)numberOfTokensInTokenSearchField:(SCITokenSearchField *)tokenSearchField
{
    return tokenSearchField.tag == 1 ? [self.namesSearchbar count] : [self.names count];
}

- (void)clearTokenSearchFieldData:(SCITokenSearchField *)tokenSearchField {
    tokenSearchField.tag == 1 ? [self.namesSearchbar removeAllObjects] : [self.names removeAllObjects];
    [tokenSearchField reloadData];
}

@end
