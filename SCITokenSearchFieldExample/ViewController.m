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
@property (strong, nonatomic) NSMutableArray *names;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.names = [NSMutableArray array];
    self.tokenField.delegate = self;
    self.tokenField.dataSource = self;
    self.tokenField.placeholderText = NSLocalizedString(@"Enter names here", nil);
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
    [self.names addObject:text];
    [self.tokenField reloadData];
}

- (void)tokenSearchField:(SCITokenSearchField *)tokenSearchField didDeleteTokenAtIndex:(NSUInteger)index
{
    [self.names removeObjectAtIndex:index];
    [self.tokenField reloadData];
}


#pragma mark - SCITokenSearchFieldDataSource

- (NSString *)tokenSearchField:(SCITokenSearchField *)tokenSearchField titleForTokenAtIndex:(NSUInteger)index
{
    return self.names[index];
}

- (NSUInteger)numberOfTokensInTokenSearchField:(SCITokenSearchField *)tokenSearchField
{
    return [self.names count];
}

- (void)clearTokenSearchFieldData:(SCITokenSearchField *)tokenSearchField {
    [self.names removeAllObjects];
    [tokenSearchField reloadData];
}

@end
