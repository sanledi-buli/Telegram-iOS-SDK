/*
 * This is the source code of Telegram for iOS v. 1.1
 * It is licensed under GNU GPL v. 2 or later.
 * You should have received a copy of the license in this archive (see LICENSE).
 *
 * Copyright Peter Iakovlev, 2013.
 */

//
//  HPTextView.h
//
//  Created by Hans Pinckaers on 29-06-10.
//
//	MIT License
//
//	Copyright (c) 2011 Hans Pinckaers
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy
//	of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights
//	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//	copies of the Software, and to permit persons to whom the Software is
//	furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in
//	all copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//	THE SOFTWARE.

#import <UIKit/UIKit.h>

@class TGHPGrowingTextView;
@class TGHPTextViewInternal;

@protocol TGTGHPGrowingTextViewDelegate <NSObject>

@optional

- (void)growingTextViewDidBeginEditing:(TGHPGrowingTextView *)growingTextView;
- (void)growingTextViewDidEndEditing:(TGHPGrowingTextView *)growingTextView;

- (BOOL)growingTextView:(TGHPGrowingTextView *)growingTextView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;
- (void)growingTextViewDidChange:(TGHPGrowingTextView *)growingTextView afterSetText:(bool)afterSetText;

- (void)growingTextView:(TGHPGrowingTextView *)growingTextView willChangeHeight:(float)height duration:(NSTimeInterval)duration animationCurve:(int)animationCurve;

- (void)growingTextViewDidChangeSelection:(TGHPGrowingTextView *)growingTextView;
- (BOOL)growingTextViewShouldReturn:(TGHPGrowingTextView *)growingTextView;

- (void)growingTextView:(TGHPGrowingTextView *)growingTextView didPasteImages:(NSArray *)images;
- (void)growingTextView:(TGHPGrowingTextView *)growingTextView didPasteData:(NSData *)data;

@end

@interface TGHPGrowingTextView : UIView <UITextViewDelegate>

@property (nonatomic, strong) UIView *placeholderView;

@property (nonatomic) int minNumberOfLines;
@property (nonatomic) int maxNumberOfLines;
@property (nonatomic) CGFloat maxHeight;
@property (nonatomic) CGFloat minHeight;
@property (nonatomic) BOOL animateHeightChange;
@property (nonatomic) NSTimeInterval animationDuration;
@property (nonatomic, strong) TGHPTextViewInternal *internalTextView;

@property (nonatomic) bool oneTimeLongAnimation;

@property (nonatomic, weak) id<TGTGHPGrowingTextViewDelegate> delegate;
@property (nonatomic,strong) NSString *text;
@property (nonatomic,strong) UIFont *font;
@property (nonatomic,strong) UIColor *textColor;
@property (nonatomic) NSTextAlignment textAlignment;

- (void)refreshHeight;

- (void)setText:(NSString *)newText animated:(bool)animated;

@end
