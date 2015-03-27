// SCITokenSearchField.h
//
// Copyright (c) 2014 scireum GmbH
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <UIKit/UIKit.h>

@class SCITokenSearchField;
@protocol SCITokenSearchFieldDelegate <NSObject>
@optional
- (void)tokenSearchField:(SCITokenSearchField *)tokenSearchField didEnterText:(NSString *)text;
- (void)tokenSearchField:(SCITokenSearchField *)tokenSearchField didDeleteTokenAtIndex:(NSUInteger)index;
- (void)tokenSearchField:(SCITokenSearchField *)tokenSearchField didChangeText:(NSString *)text;
- (void)tokenSearchFieldDidBeginEditing:(SCITokenSearchField *)tokenSearchField;
@end

@protocol SCITokenSearchFieldDataSource <NSObject>
@optional
- (NSString *)tokenSearchField:(SCITokenSearchField *)tokenSearchField titleForTokenAtIndex:(NSUInteger)index;
- (NSUInteger)numberOfTokensInTokenSearchField:(SCITokenSearchField *)tokenField;
- (void)clearTokenSearchFieldData:(SCITokenSearchField *)tokenSearchField;
@end


@interface SCITokenSearchField : UIView

@property (weak, nonatomic) id<SCITokenSearchFieldDelegate> delegate;
@property (weak, nonatomic) id<SCITokenSearchFieldDataSource> dataSource;
@property(nonatomic,getter=isEnabled) BOOL enabled;

- (void)reloadData;
- (NSString *)inputText;


/**-----------------------------------------------------------------------------
 * @name Customization
 * -----------------------------------------------------------------------------
 */

@property (assign, nonatomic) UIKeyboardType inputTextFieldKeyboardType;
@property (strong, nonatomic) UIColor *inputTextFieldTextColor;
@property (copy, nonatomic) NSString *placeholderText;
@property (copy, nonatomic) NSString *tokenSeparator;
@property (assign, nonatomic) BOOL useAlwaysBubblesForTokens;

- (void)setColorScheme:(UIColor *)color;
- (void)setColorSchemeForBubbles:(UIColor *)color;

@end

