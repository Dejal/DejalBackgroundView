//
//  DejalBackgroundView.m
//  Dejal Open Source
//
//  Created by David Sinclair on 2005-08-27.
//  Copyright (c) 2005-2015 Dejal Systems, LLC. All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without modification,
//  are permitted provided that the following conditions are met:
//
//  - Redistributions of source code must retain the above copyright notice,
//    this list of conditions and the following disclaimer.
//
//  - Redistributions in binary form must reproduce the above copyright notice,
//    this list of conditions and the following disclaimer in the documentation
//    and/or other materials provided with the distribution.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
//  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
//  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
//  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
//  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
//  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
//  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
//  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
//  OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
//  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

#import "DejalBackgroundView.h"


@implementation DejalBackgroundView

- (id)initWithFrame:(NSRect)frame;
{
    if ((self = [super initWithFrame:frame]))
    {
        self.allowMouseDownToMoveWindow = NO;
        self.drawsBackground = YES;
        self.drawsBorder = YES;
        self.backgroundColor = nil;
        self.borderColor = nil;
    }
    
    return self;
}

- (BOOL)isOpaque;
{
    return (self.drawsBackground && self.backgroundColor.alphaComponent == 1.0);
}

- (void)drawRect:(NSRect)rect;
{
    if (self.drawsBackground)
    {
        [self.backgroundColor set];
        NSRectFillUsingOperation(rect, NSCompositingOperationSourceOver);
    }
    
    if (self.drawsBorder)
    {
        [self.borderColor set];
        NSFrameRectWithWidthUsingOperation(self.bounds, 1.0, NSCompositingOperationSourceOver);
    }
}

- (BOOL)mouseDownCanMoveWindow;
{
    return self.allowMouseDownToMoveWindow;
}

- (NSColor *)backgroundColor;
{
    if (!_backgroundColor)
    {
        self.backgroundColor = [NSColor colorWithCalibratedRed:0.906 green:0.929 blue:0.965 alpha:1.0];
    }
    
    return _backgroundColor;
}

- (NSColor *)borderColor;
{
    if (!_borderColor)
    {
        self.borderColor = [NSColor lightGrayColor];
    }
    
    return _borderColor;
}

@end

