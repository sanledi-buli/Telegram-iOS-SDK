#import "TGModernGalleryVideoView.h"

#import <AVFoundation/AVFoundation.h>

#import <objc/runtime.h>

#import "TGStringUtils.h"

@interface TGModernGalleryVideoView ()
{
    AVPlayerLayer *_playerLayer;
}

@end

@implementation TGModernGalleryVideoView

- (instancetype)initWithFrame:(CGRect)frame playerLayer:(AVPlayerLayer *)playerLayer
{
    self = [super initWithFrame:frame];
    if (self != nil)
    {
        
        _playerLayer.frame = frame;
        _playerLayer = playerLayer;
        _playerLayer.delegate = self;
    }
    return self;
}

- (AVPlayerLayer *)playerLayer
{
    return _playerLayer;
}

@end
