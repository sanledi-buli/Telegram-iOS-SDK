//
// TATelegraph.h
// Copyright (c) 2015, Hariton Batkov
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// * Redistributions of source code must retain the above copyright notice, this
//   list of conditions and the following disclaimer.
//
// * Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
// OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#import "TATelegraphBlocks.h"
@protocol ASWatcher;
@interface TATelegraph : NSObject

/*!
 @method startWithApiId:apiHash:
 
 @abstract Should be called before any interaction with TATelegraph is started
Note that calling startWithApiId:apiHash: second time in App lifecycle won't work
 */
+ (void) startWithApiId:(NSString *)apiID apiHash:(NSString *) apiHash;

+ (instancetype) sharedTelegraph;


- (void) sendCodeToPhone:(NSString *) phone watcher:(id<ASWatcher>)watcher;
+ (void) sendCodeToPhone:(NSString *) phone watcher:(id<ASWatcher>)watcher;


//@final. Must not be used for subclassing.

/*!
 @method init
 
 @abstract Should create only one instance of class. Should not call init.
 */
- (instancetype)init	__attribute__((unavailable("init is not available in TATelegraph, Use sharedTelegraph"))) NS_DESIGNATED_INITIALIZER;

/*!
 @method new
 
 @abstract Should create only one instance of class. Should not call new.
 */
+ (instancetype)new	__attribute__((unavailable("new is not available in TATelegraph, Use sharedTelegraph")));

@end
